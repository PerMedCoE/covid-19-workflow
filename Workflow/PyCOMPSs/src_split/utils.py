import os
import argparse

##########################################
############ INPUT PARAMETERS ############
##########################################

def create_parser(phase):
    """Create argument parser.

    :param phase: Phase in the workflow.
    :return: Parser with the phase's arguments.
    """
    parser = argparse.ArgumentParser(description="Process some integers.")
    if phase == 1:
        parser.add_argument("ko_file", type=str,
                            help="KO file (txt)")
        parser.add_argument("model", type=str,
                            help="Model")
        parser.add_argument("data_folder", type=str,
                            help="Data folder")
        parser.add_argument("metadata", type=str,
                            help="Input metadata (.tsv)")
        parser.add_argument("outdir", type=str,
                            help="Output directory")
    elif phase == 21:
        parser.add_argument("ko_file", type=str,
                            help="KO file (txt)")
        parser.add_argument("model", type=str,
                            help="Model")
        parser.add_argument("metadata", type=str,
                            help="Input metadata (.tsv)")
        parser.add_argument("outdir", type=str,
                            help="Output directory")
        parser.add_argument("model_prefix", type=str,
                            help="Model prefix")
        parser.add_argument("reps", type=int,
                            help="Number of repetitions")
        parser.add_argument("max_time", type=int,
                            help="Maximum simulation time")
    elif phase == 22:
        parser.add_argument("ko_file", type=str,
                            help="KO file (txt)")
        parser.add_argument("model", type=str,
                            help="Model")
        parser.add_argument("patient_id", type=str,
                            help="Patient id")
        parser.add_argument("outdir", type=str,
                            help="Output directory")
        parser.add_argument("model_prefix", type=str,
                            help="Model prefix")
        parser.add_argument("reps", type=int,
                            help="Number of repetitions")
        parser.add_argument("max_time", type=int,
                            help="Maximum simulation time")
    elif phase == 3:
        parser.add_argument("outdir", type=str,
                            help="Output directory")
        parser.add_argument("metadata", type=str,
                            help="Input metadata (.tsv)")
        parser.add_argument("model", type=str,
                            help="Model")
        parser.add_argument("ko_file", type=str,
                            help="KO file (txt)")
        parser.add_argument("reps", type=int,
                            help="Number of repetitions")
    else:
        raise Exception(f"Unsupported phase: {phase}. Must be 1, 21, 22 or 3.")
    return parser


#########################################
######## INPUT PARAMETERS PARSER ########
#########################################

def parse_input_parameters(phase, show=True):
    """Parse input parameters.

    :param phase: Phase in the workflow.
    :param show: Print the parameters.
    :return: Parsed arguments.
    """
    parser = create_parser(phase)
    args = parser.parse_args()
    if show:
        print()
        print(">>> WELCOME TO THE PILOT WORKFLOW")
        print("> Parameters:")
        if phase == 1:
            print("\t- ko file: %s" % args.ko_file)
            print("\t- model: %s" % args.model)
            print("\t- data folder: %s" % args.data_folder)
            print("\t- metadata file: %s" % args.metadata)
            print("\t- output folder: %s" % args.outdir)
        elif phase == 21:
            print("\t- ko file: %s" % args.ko_file)
            print("\t- model: %s" % args.model)
            print("\t- metadata file: %s" % args.metadata)
            print("\t- output folder: %s" % args.outdir)
            print("\t- model prefix: %s" % args.model_prefix)
            print("\t- replicates: %s" % str(args.reps))
            print("\t- max time: %d" % args.max_time)
        elif phase == 22:
            print("\t- ko file: %s" % args.ko_file)
            print("\t- model: %s" % args.model)
            print("\t- patient id: %s" % args.patient_id)
            print("\t- output folder: %s" % args.outdir)
            print("\t- model prefix: %s" % args.model_prefix)
            print("\t- replicates: %s" % str(args.reps))
            print("\t- max time: %d" % args.max_time)
        elif phase == 3:
            print("\t- output folder: %s" % args.outdir)
            print("\t- metadata file: %s" % args.metadata)
            print("\t- model: %s" % args.model)
            print("\t- ko file: %s" % args.ko_file)
            print("\t- replicates: %s" % str(args.reps))
        else:
            raise Exception(f"Unsupported phase: {phase}. Must be 1, 21, 22 or 3.")
        print("\n")
    return args
