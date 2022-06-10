#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../../BuildingBlocks/Resources/images/

dataset=$(pwd)/../../Resources/data

# Set the tool internal parallelism and constraint
export COMPUTING_UNITS=1

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/2_covid19_pilot.py \
    $(pwd)/ko_file.txt \
    epithelial_cell_2 \
    ${dataset}/metadata_small.tsv \
    $(pwd)/results/ \
    ${dataset}/epithelial_cell_2 \
    2 \
    100
