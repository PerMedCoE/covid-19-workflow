#!/usr/bin/python3

import os
import csv

# To set building block debug mode
from permedcoe import set_debug
# Import building block tasks
from MaBoSS_BB import MaBoSS_analysis
from single_cell_processing_BB import single_cell_processing
from personalize_patient_BB import personalize_patient
from PhysiBoSS_BB import physiboss_model
from meta_analysis_BB import meta_analysis
# Import utils
from utils import parse_input_parameters
from helpers import get_genefiles

# PyCOMPSs imports
from pycompss.api.api import compss_wait_on_directory
from pycompss.api.api import compss_wait_on_file
from pycompss.api.api import compss_wait_on


def main():
    """
    MAIN CODE
    """
    set_debug(False)

    print("---------------------------")
    print("| Covid-19 Pilot Workflow |")
    print("---------------------------")

    # GET INPUT PARAMETERS
    args = parse_input_parameters()

    # GENE CANDIDATES
    if os.path.exists(args.ko_file):
        print("KO file provided")
    else:
        print("KO file not detected, running MABOSS")
        ## MABOSS
        # This step produces the ko_file.txt, containing the set of selected gene candidates
        MaBoSS_analysis(args.model, args.data_folder, args.ko_file)
        compss_wait_on_file(args.ko_file)
    # Discover gene candidates
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
            # SINGLE CELL PROCESSING
            print("> SINGLE CELL PROCESSING %s" % sample)
            sample_out_dir = os.path.join(args.outdir, sample)
            scp_dir = os.path.join(sample_out_dir, "single_cell_processing", "results")
            os.makedirs(scp_dir)
            scp_images_dir = os.path.join(sample_out_dir, "single_cell_processing", "images")
            os.makedirs(scp_images_dir)
            norm_data = os.path.join(scp_dir, "norm_data.tsv")
            raw_data = os.path.join(scp_dir, "raw_data.tsv")
            scaled_data = os.path.join(scp_dir, "scaled_data.tsv")
            cells_metadata = os.path.join(scp_dir, "cells_metadata.tsv")
            if line["file"].startswith("../.."):
                # Two folder relative - Local
                relative_p_file = os.path.join(*(line["file"].split(os.path.sep)[2:]))  # remove first two folders "../.."
                p_file = os.path.join("..", "..", "Resources", relative_p_file)
            else:
                # Absolute path - Supercomputer
                p_file = line["file"]
            single_cell_processing(p_id=sample,
                                   p_group=line["group"],
                                   p_file=p_file,
                                   norm_data=norm_data,
                                   raw_data=raw_data,
                                   scaled_data=scaled_data,
                                   cells_metadata=cells_metadata,
                                   outdir=scp_images_dir)

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

    # VERSION 1: PROCESS ALL WITHIN THE SAME TASK

    # Wait for all physiboss
    # Currently needed because the meta analysis requires all of them
    # and its input is the main folder. It assumes the internal folder
    # structure
    for physiboss_result in physiboss_results:
        compss_wait_on_directory(physiboss_result)

    # Perform last step: meta analysis
    final_result_dir = os.path.join(args.outdir, "meta_analysis")
    os.makedirs(final_result_dir)
    # META-ANALYSIS
    meta_analysis(meta_file=args.metadata,
                  out_dir=args.outdir,
                  model_prefix=args.model,
                  ko_file=args.ko_file,
                  reps=args.reps,
                  verbose="T",
                  results=final_result_dir)

    """
    # VERSION 2: REDUCE PER PATIENT, AND FINALLY ALL OF THEM
    # WORK IN PROGRESS!!!

    # We need to sync all physiboss simulations because physiboss does not
    # provide the final.xml and final_cells_physicell.mat as file out.
    # It only provides them as contents within the folder.
    for physiboss_result in physiboss_results:
       compss_wait_on_directory(physiboss_result)

    from parallel_meta_analysis import extract_simulation_results
    from parallel_meta_analysis import merge_reduce
    from parallel_meta_analysis import reduce_simulation_results
    from parallel_meta_analysis import reduce_patient_results
    from parallel_meta_analysis import reduce_simulation

    print("OUTPUT DIR:")
    print(args.outdir)
    with open(args.metadata, "r") as metadata_fd:
        reader = csv.DictReader(metadata_fd, delimiter="\t")
        all_simulation_results_per_patient = []
        for line in reader:
            # ONE LINE PER PATIENT
            sample = line["id"]
            patient_simulation_folders = []
            for gene_prefix in genefiles:
                # print(">> prefix: " + str(gene_prefix))
                for r in range(1, args.reps + 1):
                    # print(">>> Repetition: " + str(r))
                    simulation_folder = os.path.join(args.outdir, sample, physiboss_subfolder, gene_prefix + "_physiboss_run_" + str(r))
                    patient_simulation_folders.append(simulation_folder)
            print("PATIENT: " + str(sample))
            simulation_results = []
            for f in patient_simulation_folders:
                final_xml = os.path.join(f, "final.xml")
                final_cells_physicell_mat = os.path.join(f, "final_cells_physicell.mat")
                simulation_result = extract_simulation_results(final_xml,
                                                               final_cells_physicell_mat)
                simulation_results.append(simulation_result)
            result = merge_reduce(reduce_simulation_results, simulation_results, chunk=2)
            all_simulation_results_per_patient.append(result)

    # REDUCE ALL PATIENTS:
    final_result = merge_reduce(reduce_patient_results, all_simulation_results_per_patient)
    final_result = compss_wait_on(final_result)
    import pprint
    pprint.pprint(final_result)
    """


if __name__ == "__main__":
    main()
