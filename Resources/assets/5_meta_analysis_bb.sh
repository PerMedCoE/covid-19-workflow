#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../images/
export PERMEDCOE_ASSETS=$(pwd)/

mkdir $(pwd)/result/meta_analysis/

meta_analysis_BB -d \
    -i $(pwd)/../data/metadata_small.tsv \
       $(pwd)/result/ \
       epithelial_cell_2 \
       $(pwd)/ko_file.txt \
       2 \
       T \
    -o $(pwd)/result/meta_analysis/ \
    --mount_points ${PERMEDCOE_ASSETS}/meta_analysis/:${PERMEDCOE_ASSETS}/meta_analysis/
