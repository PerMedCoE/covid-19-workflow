#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/
export COMPUTING_UNITS=1

# Self contained assets in package
MABOSS_ASSETS=$(python3 -c "import MaBoSS_BB; import os; print(os.path.dirname(MaBoSS_BB.__file__))")

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

MaBoSS_BB -d \
    -i epithelial_cell_2 $(pwd)/../Resources/data ${COMPUTING_UNITS} \
    -o $(pwd)/ko_file.txt \
    --mount_point ${MABOSS_ASSETS}/assets:${MABOSS_ASSETS}/assets

enable_pycompss
