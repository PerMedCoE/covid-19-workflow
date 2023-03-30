#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/
export COMPUTING_UNITS=1

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

TEMP_DIRECTORY=$(pwd)/MaBoSS_wd
mkdir -p ${TEMP_DIRECTORY}

MaBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --model epithelial_cell_2 \
    --data_folder $(pwd)/../Resources/data \
    --parallel ${COMPUTING_UNITS} \
    --ko_file $(pwd)/ko_file.txt

enable_pycompss
