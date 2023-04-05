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
