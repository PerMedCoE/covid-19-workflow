#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [[ -z "${PERMEDCOE_IMAGES}" ]]; then
  default_images=$(realpath ${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/)/
  export PERMEDCOE_IMAGES=${default_images}
  echo "WARNING: PERMEDCOE_IMAGES environment variable not set. Using default: ${default_images}"
else
  echo "INFO: Using PERMEDCOE_IMAGES from: ${PERMEDCOE_IMAGES}"
fi
export COMPUTING_UNITS=1

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
