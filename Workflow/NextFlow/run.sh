#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(readlink -f $(pwd)/../../../BuildingBlocks/Resources/images/)/
export _DATA_DIR=$(readlink -f ../../Resources/data/)

mkdir MaBoSS_wd

nextflow run -resume covid19_pilot.nf \
    --meta_file=$_DATA_DIR/metadata_small.tsv \
    --model_prefix=$_DATA_DIR/epithelial_cell_2 \
    --cell_type="Epithelial_cells" \
    --result_dir="Results" \
    --repetitions=2 \
    --model_name="epithelial_cell_2" \
    --data_dir="$_DATA_DIR" \
    --max_time=10 \
