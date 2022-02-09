#!/usr/bin/env bash

export COVID19_BB_IMAGES=$(pwd)/../images/
export COVID19_BB_ASSETS=$(pwd)/

mkdir $(pwd)/result/meta_analysis/

meta_analysis -d \
    -i $(pwd)/../data/metadata_small.tsv \
       $(pwd)/result/ \
       epithelial_cell_2 \
       $(pwd)/ko_file.txt \
       2 \
       T \
    -o $(pwd)/result/meta_analysis/ \
    --mount_points ${COVID19_BB_ASSETS}/meta_analysis/:${COVID19_BB_ASSETS}/meta_analysis/
