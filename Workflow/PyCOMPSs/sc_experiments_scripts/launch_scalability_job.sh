#!/usr/bin/env bash

previous_id=$1
shift 1

dataset=${COVID19_PILOT_DATASET}               # Currently using the "permedcoe" deployed


enqueue_compss \
    --job_dependency=${previous_id} \
    --num_nodes=2 \
    --worker_in_master_cpus=0 \
    --exec_time=15 \
    --worker_working_dir=$(pwd) \
    --log_level=off \
    --graph \
    --tracing \
    --python_interpreter=python3 \
    --epilog="$(pwd)/./clean.sh" \
    $(pwd)/../src/covid19_pilot.py \
        ${dataset}metadata_one.tsv \
        ${dataset}epithelial_cell_2 \
        $(pwd)/results_${COMPUTING_UNITS}/ \
        $(pwd)/ko_file.txt \
        1 \
        epithelial_cell_2 \
        ${dataset}
