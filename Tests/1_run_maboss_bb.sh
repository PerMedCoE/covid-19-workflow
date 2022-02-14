#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../BuildingBlocks/Resources/images/
export PERMEDCOE_ASSETS=$(pwd)/../../BuildingBlocks/Resources/assets/
export COMPUTING_UNITS=1

maboss_BB -d \
    -i epithelial_cell_2 $(pwd)/../Resources/data ${COMPUTING_UNITS} \
    -o $(pwd)/ko_file.txt \
    --mount_point ${PERMEDCOE_ASSETS}/MaBoSS:${PERMEDCOE_ASSETS}/MaBoSS
