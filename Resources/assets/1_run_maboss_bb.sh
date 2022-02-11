#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../images/
export PERMEDCOE_ASSETS=$(pwd)/
export COMPUTING_UNITS=1

maboss_BB -d \
    -i epithelial_cell_2 $(pwd)/../data ${COMPUTING_UNITS} \
    -o $(pwd)/ko_file.txt \
    --mount_point ${PERMEDCOE_ASSETS}/MaBoSS:${PERMEDCOE_ASSETS}/MaBoSS
