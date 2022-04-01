#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/
export COMPUTING_UNITS=1

# Self contained assets in package
META_ANALISIS_ASSETS=$(python3 -c "import meta_analysis_BB; import os; print(os.path.dirname(meta_analysis_BB.__file__))")

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

mkdir $(pwd)/result/meta_analysis/

meta_analysis_BB -d \
    -i $(pwd)/../Resources/data/metadata_small.tsv \
       $(pwd)/result/ \
       epithelial_cell_2 \
       $(pwd)/ko_file.txt \
       2 \
       T \
    -o $(pwd)/result/meta_analysis/ \
    --mount_points ${META_ANALISIS_ASSETS}/assets/:${META_ANALISIS_ASSETS}/assets/

enable_pycompss