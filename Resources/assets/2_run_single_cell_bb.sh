#!/usr/bin/env bash

export COVID19_BB_IMAGES=$(pwd)/../images/
export COVID19_BB_ASSETS=$(pwd)/
export COMPUTING_UNITS=1

# 1st patient

mkdir -p result/C141/single_cell_processing/results/
mkdir -p result/C141/single_cell_processing/images/

single_cell_processing -d \
    -i C141 C $(pwd)/../data/small/GSM4339769_C141_filtered_feature_bc_matrix.h5 ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/raw_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/scaled_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/result/C141/single_cell_processing/images \
    --mount_points ${COVID19_BB_ASSETS}/single_cell/:${COVID19_BB_ASSETS}/single_cell/

# 2nd patient

mkdir -p result/C142/single_cell_processing/results/
mkdir -p result/C142/single_cell_processing/images/

single_cell_processing -d \
    -i C142 C $(pwd)/../data/small/GSM4339770_C142_filtered_feature_bc_matrix.h5 ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/raw_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/scaled_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/result/C142/single_cell_processing/images \
    --mount_points ${COVID19_BB_ASSETS}/single_cell/:${COVID19_BB_ASSETS}/single_cell/
