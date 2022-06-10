#!/usr/bin/python3

import os
import csv

# To set building block debug mode
from permedcoe import set_debug
# Import building block tasks
from personalize_patient_BB import personalize_patient
from PhysiBoSS_BB import physiboss_model
# Import utils
from utils import parse_input_parameters
from helpers import get_genefiles

# PyCOMPSs imports
from pycompss.api.api import compss_wait_on_directory


def main():
    """
    MAIN CODE
    """
    set_debug(False)

    print("-------------------------------")
    print("| 2 - Covid-19 Pilot Workflow |")
    print("-------------------------------")

    # GET INPUT PARAMETERS
    args = parse_input_parameters(phase=2)

    # GENE CANDIDATES
    genes = [""]  # first empty since it is the original without gene ko
    with open(args.ko_file, "r") as ko_fd:
        genes += ko_fd.read().splitlines()
    genefiles = get_genefiles(args.model, genes)

    # Iterate over the metadata file processing each patient
    physiboss_results = []
    physiboss_subfolder = "physiboss_results"  # do not modify (hardcoded in meta-analysis)
    with open(args.metadata, "r") as metadata_fd:
        reader = csv.DictReader(metadata_fd, delimiter="\t")
        for line in reader:
            # ONE LINE PER PATIENT
            sample = line["id"]
            sample_out_dir = os.path.join(args.outdir, sample)

            scp_dir = os.path.join(sample_out_dir, "single_cell_processing", "results")
            norm_data = os.path.join(scp_dir, "norm_data.tsv")
            raw_data = os.path.join(scp_dir, "raw_data.tsv")
            scaled_data = os.path.join(scp_dir, "scaled_data.tsv")
            cells_metadata = os.path.join(scp_dir, "cells_metadata.tsv")

            # PERSONALIZE PATIENT
            print("> PERSONALIZING PATIENT %s" % sample)
            pp_dir = os.path.join(sample_out_dir, "personalize_patient")
            os.makedirs(pp_dir)
            model_output_dir = os.path.join(pp_dir, "models")
            personalized_result = os.path.join(pp_dir, "personalized_by_cell_type.tsv")
            personalize_patient(norm_data=norm_data,
                                cells=cells_metadata,
                                model_prefix=args.model_prefix,
                                t="Epithelial_cells",
                                model_output_dir=model_output_dir,
                                personalized_result=personalized_result,
                                ko=args.ko_file)

            for gene_prefix in genefiles:
                print(">> prefix: " + str(gene_prefix))
                for r in range(1, args.reps + 1):
                    print(">>> Repetition: " + str(r))
                    name = "output_" + sample + "_" + gene_prefix + "_" + str(r)
                    out_file = os.path.join(args.outdir, sample, physiboss_subfolder, name + ".out")
                    err_file = os.path.join(args.outdir, sample, physiboss_subfolder, name + ".err")
                    print("\t- " + out_file)
                    print("\t- " + err_file)
                    results_dir = os.path.join(args.outdir, sample, physiboss_subfolder, gene_prefix + "_physiboss_run_" + str(r))
                    os.makedirs(results_dir)
                    physiboss_results.append(results_dir)
                    # PHYSIBOSS
                    physiboss_model(sample=sample,
                                    repetition=r,
                                    prefix=gene_prefix,
                                    model_dir=model_output_dir,
                                    out_file=out_file,
                                    err_file=err_file,
                                    results_dir=results_dir,
                                    max_time=args.max_time)

    # Wait for all physiboss
    # Currently needed because the meta analysis requires all of them
    # and its input is the main folder. It assumes the internal folder
    # structure
    for physiboss_result in physiboss_results:
        compss_wait_on_directory(physiboss_result)


if __name__ == "__main__":
    main()
