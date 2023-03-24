#!/usr/bin/python3

import os
import csv

# To set building block debug mode
from permedcoe import set_debug
# To set the default PyCOMPSs TMPDIR
from permedcoe import TMPDIR
# Import building block tasks
from MaBoSS_BB import MaBoSS_analysis
from single_cell_processing_BB import single_cell_processing
# Import utils
from utils import parse_input_parameters
from helpers import get_genefiles

# PyCOMPSs imports
from pycompss.api.api import compss_wait_on_file


def main():
    """
    MAIN CODE
    """
    set_debug(False)

    print("-------------------------------")
    print("| 1 - Covid-19 Pilot Workflow |")
    print("-------------------------------")

    # GET INPUT PARAMETERS
    args = parse_input_parameters(phase=1)

    # GENE CANDIDATES
    if os.path.exists(args.ko_file):
        print("KO file provided")
    else:
        print("KO file not detected, running MABOSS")
        ## MABOSS
        # This step produces the ko_file.txt, containing the set of selected gene candidates
        MaBoSS_analysis(args.model,
                        args.data_folder,
                        args.ko_file,
                        tmpdir=TMPDIR)
        compss_wait_on_file(args.ko_file)
    # Discover gene candidates
    genes = [""]  # first empty since it is the original without gene ko
    with open(args.ko_file, "r") as ko_fd:
        genes += ko_fd.read().splitlines()
    genefiles = get_genefiles(args.model, genes)

    # Iterate over the metadata file processing each patient
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
            single_cell_processing(tmpdir=TMPDIR,
                                   p_id=sample,
                                   p_group=line["group"],
                                   p_file=p_file,
                                   norm_data=norm_data,
                                   raw_data=raw_data,
                                   scaled_data=scaled_data,
                                   cells_metadata=cells_metadata,
                                   outdir=scp_images_dir)


if __name__ == "__main__":
    main()
