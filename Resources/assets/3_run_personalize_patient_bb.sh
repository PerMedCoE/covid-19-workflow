#!/usr/bin/env bash

export COVID19_BB_IMAGES=$(pwd)/../images/
export COVID19_BB_ASSETS=$(pwd)/

# 1st patient

mkdir -p result/C141/personalize_patient/models/

personalize_patient -d \
    -i $(pwd)/result/C141/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C141/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/../data/epithelial_cell_2 Epithelial_cells \
       $(pwd)/ko_file.txt \
    -o $(pwd)/result/C141/personalize_patient/models \
       $(pwd)/result/C141/personalize_patient/personalized_by_cell_type.tsv \
    --mount_points ${COVID19_BB_ASSETS}/personalize_patient/:${COVID19_BB_ASSETS}/personalize_patient/,$(pwd)/../data/:$(pwd)/../data/

# 2nd patient

mkdir -p result/C142/personalize_patient/models/

personalize_patient -d \
    -i $(pwd)/result/C142/single_cell_processing/results/norm_data.tsv \
       $(pwd)/result/C142/single_cell_processing/results/cells_metadata.tsv \
       $(pwd)/../data/epithelial_cell_2 Epithelial_cells \
       $(pwd)/ko_file.txt \
    -o $(pwd)/result/C142/personalize_patient/models \
       $(pwd)/result/C142/personalize_patient/personalized_by_cell_type.tsv \
    --mount_points ${COVID19_BB_ASSETS}/personalize_patient/:${COVID19_BB_ASSETS}/personalize_patient/,$(pwd)/../data/:$(pwd)/../data/
