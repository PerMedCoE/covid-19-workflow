#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../../BuildingBlocks/Resources/images/

dataset=$(pwd)/../../Resources/data

# Set the tool internal parallelism and constraint
export COMPUTING_UNITS=1

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/1_covid19_pilot.py \
    $(pwd)/ko_file.txt \
    epithelial_cell_2 \
    ${dataset} \
    ${dataset}/metadata_clean.tsv \
    $(pwd)/results/


######################################################
# APPLICATION EXECUTION EXAMPLE
# Call:
#       ./b_1_run.sh
#
# Example:
#       ./b_1_run.sh
######################################################
