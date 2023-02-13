#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/
export COMPUTING_UNITS=1

# Self contained assets in package
PERSONALIZE_PATIENT_ASSETS=$(python3 -c "import personalize_patient_BB; import os; print(os.path.dirname(personalize_patient_BB.__file__))")

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

# 1st patient

mkdir -p $(pwd)/result/C141/personalize_patient/models/

WORKING_DIRECTORY=$(pwd)/personalize_patient_C141_wd
mkdir -p ${WORKING_DIRECTORY}

personalize_patient_BB -d \
    --mount_points ${PERSONALIZE_PATIENT_ASSETS}/assets/:${PERSONALIZE_PATIENT_ASSETS}/assets/,${WORKING_DIRECTORY}:${WORKING_DIRECTORY},$(pwd)/../Resources/data/:$(pwd)/../Resources/data/ \
    default \
    --norm_data $(pwd)/result/C141/single_cell_processing/results/norm_data.tsv \
    --cells $(pwd)/result/C141/single_cell_processing/results/cells_metadata.tsv \
    --model_prefix $(pwd)/../Resources/data/epithelial_cell_2 \
    --t Epithelial_cells \
    --ko $(pwd)/ko_file.txt \
    --model_output_dir $(pwd)/result/C141/personalize_patient/models \
    --personalized_result $(pwd)/result/C141/personalize_patient/personalized_by_cell_type.tsv \
    --working_directory ${WORKING_DIRECTORY}

# 2nd patient

mkdir -p $(pwd)/result/C142/personalize_patient/models/

WORKING_DIRECTORY=$(pwd)/personalize_patient_C142_wd
mkdir -p ${WORKING_DIRECTORY}

personalize_patient_BB -d \
    --mount_points ${PERSONALIZE_PATIENT_ASSETS}/assets/:${PERSONALIZE_PATIENT_ASSETS}/assets/,${WORKING_DIRECTORY}:${WORKING_DIRECTORY},$(pwd)/../Resources/data/:$(pwd)/../Resources/data/ \
    default \
    --norm_data $(pwd)/result/C142/single_cell_processing/results/norm_data.tsv \
    --cells $(pwd)/result/C142/single_cell_processing/results/cells_metadata.tsv \
    --model_prefix $(pwd)/../Resources/data/epithelial_cell_2 \
    --t Epithelial_cells \
    --ko $(pwd)/ko_file.txt \
    --model_output_dir $(pwd)/result/C142/personalize_patient/models \
    --personalized_result $(pwd)/result/C142/personalize_patient/personalized_by_cell_type.tsv \
    --working_directory ${WORKING_DIRECTORY}

enable_pycompss
