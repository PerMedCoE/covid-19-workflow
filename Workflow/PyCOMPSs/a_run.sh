#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../../BuildingBlocks/Resources/images/

dataset=$(pwd)/../../Resources/data

# Set the tool internal parallelism and constraint
export COMPUTING_UNITS=1

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src/covid19_pilot.py \
    ${dataset}/metadata_small.tsv \
    ${dataset}/epithelial_cell_2 \
    $(pwd)/results/ \
    $(pwd)/ko_file.txt \
    2 \
    epithelial_cell_2 \
    ${dataset} \
    100


######################################################
# APPLICATION EXECUTION EXAMPLE
# Call:
#       ./a_run.sh
#
# Example:
#       ./a_run.sh
######################################################
