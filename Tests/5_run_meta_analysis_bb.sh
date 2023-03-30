#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/
export COMPUTING_UNITS=1

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

mkdir $(pwd)/result/meta_analysis/

TEMP_DIRECTORY=$(pwd)/meta_analysis_wd
mkdir -p ${TEMP_DIRECTORY}

meta_analysis_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    --meta_file $(pwd)/../Resources/data/metadata_small.tsv \
    --out_dir $(pwd)/result/ \
    --model_prefix epithelial_cell_2 \
    --ko_file $(pwd)/ko_file.txt \
    --reps 2 \
    --verbose T \
    --results $(pwd)/result/meta_analysis/

enable_pycompss
