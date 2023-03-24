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

TEMP_DIRECTORY=$(pwd)/single_cell_C141_wd
mkdir -p ${TEMP_DIRECTORY}

single_cell_processing_BB \
    --debug \
    --mount_points ${SINGLE_CELL_ASSETS}/assets/:${SINGLE_CELL_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --p_id C141 \
    --p_group C \
    --p_file $(pwd)/../Resources/data/small/GSM4339769_C141_filtered_feature_bc_matrix.h5 \
    --parallelize ${COMPUTING_UNITS} \
    --norm_data $(pwd)/result/C141/single_cell_processing/results/norm_data.tsv \
    --raw_data $(pwd)/result/C141/single_cell_processing/results/raw_data.tsv \
    --scaled_data $(pwd)/result/C141/single_cell_processing/results/scaled_data.tsv \
    --cells_metadata $(pwd)/result/C141/single_cell_processing/results/cells_metadata.tsv \
    --outdir $(pwd)/result/C141/single_cell_processing/images/

# 2nd patient

mkdir -p $(pwd)/result/C142/single_cell_processing/results/
mkdir -p $(pwd)/result/C142/single_cell_processing/images/

TEMP_DIRECTORY=$(pwd)/single_cell_C142_wd
mkdir -p ${TEMP_DIRECTORY}

single_cell_processing_BB \
    --debug \
    --mount_points ${SINGLE_CELL_ASSETS}/assets/:${SINGLE_CELL_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --p_id C142 \
    --p_group C \
    --p_file $(pwd)/../Resources/data/small/GSM4339770_C142_filtered_feature_bc_matrix.h5 \
    --parallelize ${COMPUTING_UNITS} \
    --norm_data $(pwd)/result/C142/single_cell_processing/results/norm_data.tsv \
    --raw_data $(pwd)/result/C142/single_cell_processing/results/raw_data.tsv \
    --scaled_data $(pwd)/result/C142/single_cell_processing/results/scaled_data.tsv \
    --cells_metadata $(pwd)/result/C142/single_cell_processing/results/cells_metadata.tsv \
    --outdir $(pwd)/result/C142/single_cell_processing/images/

enable_pycompss
