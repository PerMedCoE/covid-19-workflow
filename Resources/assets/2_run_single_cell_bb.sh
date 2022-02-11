#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../images/
export PERMEDCOE_ASSETS=$(pwd)/
export COMPUTING_UNITS=1

# 1st patient

mkdir -p result/C141/single_cell_processing/results/
mkdir -p result/C141/single_cell_processing/images/

single_cell_processing_BB -d \
    -i C141 C $(pwd)/../data/small/GSM4339769_C141_filtered_feature_bc_matrix.h5 ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/raw_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/scaled_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/result/C141/single_cell_processing/images \
    --mount_points ${PERMEDCOE_ASSETS}/single_cell/:${PERMEDCOE_ASSETS}/single_cell/

# 2nd patient

mkdir -p result/C142/single_cell_processing/results/
mkdir -p result/C142/single_cell_processing/images/

single_cell_processing_BB -d \
    -i C142 C $(pwd)/../data/small/GSM4339770_C142_filtered_feature_bc_matrix.h5 ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/raw_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/scaled_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/result/C142/single_cell_processing/images \
    --mount_points ${PERMEDCOE_ASSETS}/single_cell/:${PERMEDCOE_ASSETS}/single_cell/
