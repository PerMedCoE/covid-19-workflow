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

personalize_patient_BB -d \
    -i $(pwd)/result/C141/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/../Resources/data/epithelial_cell_2 Epithelial_cells \
       $(pwd)/ko_file.txt \
    -o $(pwd)/result/C141/personalize_patient/models \
       $(pwd)/result/C141/personalize_patient/personalized_by_cell_type.tsv \
    --mount_points ${PERSONALIZE_PATIENT_ASSETS}/assets/:${PERSONALIZE_PATIENT_ASSETS}/assets/,$(pwd)/../Resources/data/:$(pwd)/../Resources/data/

# 2nd patient

mkdir -p $(pwd)/result/C142/personalize_patient/models/

personalize_patient_BB -d \
    -i $(pwd)/result/C142/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/../Resources/data/epithelial_cell_2 Epithelial_cells \
       $(pwd)/ko_file.txt \
    -o $(pwd)/result/C142/personalize_patient/models \
       $(pwd)/result/C142/personalize_patient/personalized_by_cell_type.tsv \
    --mount_points ${PERSONALIZE_PATIENT_ASSETS}/assets/:${PERSONALIZE_PATIENT_ASSETS}/assets/,$(pwd)/../Resources/data/:$(pwd)/../Resources/data/

enable_pycompss
