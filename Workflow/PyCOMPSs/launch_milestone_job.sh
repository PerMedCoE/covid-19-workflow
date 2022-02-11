#!/usr/bin/env bash

previous_id=$1
num_nodes=$2
exec_time=$3
tsv_file=$4   # e.g. metadata_clean.tsv
shift 4

dataset=${COVID19_PILOT_DATASET}               # Currently using the "permedcoe" deployed


enqueue_compss \
    --job_dependency=${previous_id} \
    --num_nodes=${num_nodes} \
    --worker_in_master_cpus=0 \
    --exec_time=${exec_time} \
    --base_log_dir=$(pwd) \
    --worker_working_dir=$(pwd) \
    --log_level=off \
    --tracing \
    --python_interpreter=python3 \
    --epilog="$(pwd)/./clean.sh" \
    $(pwd)/src/covid19_pilot.py \
        ${dataset}${tsv_file} \
        ${dataset}epithelial_cell_2 \
        $(pwd)/results_${COMPUTING_UNITS}/ \
        $(pwd)/ko_file.txt \
        4 \
        epithelial_cell_2 \
        ${dataset}
