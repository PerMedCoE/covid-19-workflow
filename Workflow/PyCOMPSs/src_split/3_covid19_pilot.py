#!/usr/bin/python3

import os
import csv

# To set building block debug mode
from permedcoe import set_debug
# To set the default PyCOMPSs TMPDIR
from permedcoe import TMPDIR
# Import building block tasks
from meta_analysis_BB import meta_analysis
# Import utils
from utils import parse_input_parameters


def main():
    """
    MAIN CODE
    """
    set_debug(False)

    print("-------------------------------")
    print("| 3 - Covid-19 Pilot Workflow |")
    print("-------------------------------")

    # GET INPUT PARAMETERS
    args = parse_input_parameters(phase=3)

    # Perform last step: meta analysis
    final_result_dir = os.path.join(args.outdir, "meta_analysis")
    os.makedirs(final_result_dir)
    # META-ANALYSIS
    meta_analysis(tmpdir=TMPDIR,
                  meta_file=args.metadata,
                  out_dir=args.outdir,
                  model_prefix=args.model,
                  ko_file=args.ko_file,
                  reps=args.reps,
                  verbose="T",
                  results=final_result_dir)


if __name__ == "__main__":
    main()
