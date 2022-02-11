#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../../BuildingBlocks/Resources/images/
export PERMEDCOE_ASSETS=$(pwd)/../../BuildingBlocks/Resources/assets/

# 1st patient

mkdir -p $(pwd)/result/C141/personalize_patient/models/

personalize_patient_BB -d \
    -i $(pwd)/result/C141/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/../Resources/data/epithelial_cell_2 Epithelial_cells \
       $(pwd)/ko_file.txt \
    -o $(pwd)/result/C141/personalize_patient/models \
       $(pwd)/result/C141/personalize_patient/personalized_by_cell_type.tsv \
    --mount_points ${PERMEDCOE_ASSETS}/personalize_patient/:${PERMEDCOE_ASSETS}/personalize_patient/,$(pwd)/../Resources/data/:$(pwd)/../Resources/data/

# 2nd patient

mkdir -p $(pwd)/result/C142/personalize_patient/models/

personalize_patient_BB -d \
    -i $(pwd)/result/C142/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/../Resources/data/epithelial_cell_2 Epithelial_cells \
       $(pwd)/ko_file.txt \
    -o $(pwd)/result/C142/personalize_patient/models \
       $(pwd)/result/C142/personalize_patient/personalized_by_cell_type.tsv \
    --mount_points ${PERMEDCOE_ASSETS}/personalize_patient/:${PERMEDCOE_ASSETS}/personalize_patient/,$(pwd)/../Resources/data/:$(pwd)/../Resources/data/
