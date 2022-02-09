#!/usr/bin/env bash

export COVID19_BB_IMAGES=$(pwd)/../images/
export COVID19_BB_ASSETS=$(pwd)/
export COMPUTING_UNITS=1

maboss -d \
    -i epithelial_cell_2 $(pwd)/../data ${COMPUTING_UNITS} \
    -o $(pwd)/ko_file.txt \
    --mount_point ${COVID19_BB_ASSETS}/MaBoSS:${COVID19_BB_ASSETS}/MaBoSS
