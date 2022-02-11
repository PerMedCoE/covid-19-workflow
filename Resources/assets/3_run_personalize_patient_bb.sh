#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../images/
export PERMEDCOE_ASSETS=$(pwd)/

# 1st patient

mkdir -p result/C141/personalize_patient/models/

personalize_patient_BB -d \
    -i $(pwd)/result/C141/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/../data/epithelial_cell_2 Epithelial_cells \
       $(pwd)/ko_file.txt \
    -o $(pwd)/result/C141/personalize_patient/models \
       $(pwd)/result/C141/personalize_patient/personalized_by_cell_type.tsv \
    --mount_points ${PERMEDCOE_ASSETS}/personalize_patient/:${PERMEDCOE_ASSETS}/personalize_patient/,$(pwd)/../data/:$(pwd)/../data/

# 2nd patient

mkdir -p result/C142/personalize_patient/models/

personalize_patient_BB -d \
    -i $(pwd)/result/C142/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/../data/epithelial_cell_2 Epithelial_cells \
       $(pwd)/ko_file.txt \
    -o $(pwd)/result/C142/personalize_patient/models \
       $(pwd)/result/C142/personalize_patient/personalized_by_cell_type.tsv \
    --mount_points ${PERMEDCOE_ASSETS}/personalize_patient/:${PERMEDCOE_ASSETS}/personalize_patient/,$(pwd)/../data/:$(pwd)/../data/
