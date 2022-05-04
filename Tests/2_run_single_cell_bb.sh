#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/
export COMPUTING_UNITS=1

# Self contained assets in package
SINGLE_CELL_ASSETS=$(python3 -c "import single_cell_processing_BB; import os; print(os.path.dirname(single_cell_processing_BB.__file__))")

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

# 1st patient

mkdir -p $(pwd)/result/C141/single_cell_processing/results/
mkdir -p $(pwd)/result/C141/single_cell_processing/images/

single_cell_processing_BB -d \
    -i C141 C $(pwd)/../Resources/data/small/GSM4339769_C141_filtered_feature_bc_matrix.h5 ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/raw_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/scaled_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/result/C141/single_cell_processing/images \
    --mount_points ${SINGLE_CELL_ASSETS}/assets/:${SINGLE_CELL_ASSETS}/assets/

# 2nd patient

mkdir -p $(pwd)/result/C142/single_cell_processing/results/
mkdir -p $(pwd)/result/C142/single_cell_processing/images/

single_cell_processing_BB -d \
    -i C142 C $(pwd)/../Resources/data/small/GSM4339770_C142_filtered_feature_bc_matrix.h5 ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/raw_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/scaled_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/result/C142/single_cell_processing/images \
    --mount_points ${SINGLE_CELL_ASSETS}/assets/:${SINGLE_CELL_ASSETS}/assets/

enable_pycompss
