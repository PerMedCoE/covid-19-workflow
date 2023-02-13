#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/
export COMPUTING_UNITS=1

# Self contained assets in package
MABOSS_ASSETS=$(python3 -c "import MaBoSS_BB; import os; print(os.path.dirname(MaBoSS_BB.__file__))")

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

WORKING_DIRECTORY=$(pwd)/MaBoSS_wd
mkdir -p ${WORKING_DIRECTORY}

MaBoSS_BB -d \
    --mount_point ${MABOSS_ASSETS}/assets:${MABOSS_ASSETS}/assets,${WORKING_DIRECTORY}:${WORKING_DIRECTORY} \
    default \
    --model epithelial_cell_2 \
    --data_folder $(pwd)/../Resources/data \
    --parallel ${COMPUTING_UNITS} \
    --ko_file $(pwd)/ko_file.txt \
    --working_directory ${WORKING_DIRECTORY}


enable_pycompss
