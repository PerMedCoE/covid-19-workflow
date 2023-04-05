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

# 1st patient

mkdir -p $(pwd)/result/C141/personalize_patient/models/

TEMP_DIRECTORY=$(pwd)/personalize_patient_C141_wd
mkdir -p ${TEMP_DIRECTORY}

personalize_patient_BB \
    --debug \
    --mount_points $(pwd)/../Resources/data/:$(pwd)/../Resources/data/ \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --norm_data $(pwd)/result/C141/single_cell_processing/results/norm_data.tsv \
    --cells $(pwd)/result/C141/single_cell_processing/results/cells_metadata.tsv \
    --model_prefix $(pwd)/../Resources/data/epithelial_cell_2 \
    --t Epithelial_cells \
    --ko $(pwd)/ko_file.txt \
    --model_output_dir $(pwd)/result/C141/personalize_patient/models \
    --personalized_result $(pwd)/result/C141/personalize_patient/personalized_by_cell_type.tsv

# 2nd patient

mkdir -p $(pwd)/result/C142/personalize_patient/models/

TEMP_DIRECTORY=$(pwd)/personalize_patient_C142_wd
mkdir -p ${TEMP_DIRECTORY}

personalize_patient_BB \
    --debug \
    --mount_points $(pwd)/../Resources/data/:$(pwd)/../Resources/data/ \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --norm_data $(pwd)/result/C142/single_cell_processing/results/norm_data.tsv \
    --cells $(pwd)/result/C142/single_cell_processing/results/cells_metadata.tsv \
    --model_prefix $(pwd)/../Resources/data/epithelial_cell_2 \
    --t Epithelial_cells \
    --ko $(pwd)/ko_file.txt \
    --model_output_dir $(pwd)/result/C142/personalize_patient/models \
    --personalized_result $(pwd)/result/C142/personalize_patient/personalized_by_cell_type.tsv
