#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../../BuildingBlocks/Resources/images/

dataset=$(pwd)/../../Resources/data

# Set the tool internal parallelism and constraint
export COMPUTING_UNITS=1

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/3_covid19_pilot.py \
    $(pwd)/results/ \
    ${dataset}/metadata_clean.tsv \
    epithelial_cell_2 \
    $(pwd)/ko_file.txt \
    2

######################################################
# APPLICATION EXECUTION EXAMPLE
# Call:
#       ./b_3_run.sh
#
# Example:
#       ./b_3_run.sh
######################################################
