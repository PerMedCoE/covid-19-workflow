#!/usr/bin/env bash

# MN4
module load singularity/3.7.3
module use /apps/modules/modulefiles/tools/COMPSs/libraries
module load permedcoe
module load python/3.10.2
module load nextflow/21.04.1

export _DATA_DIR=$COVID19WORKFLOW_DATASET

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
