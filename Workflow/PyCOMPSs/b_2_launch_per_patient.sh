#!/usr/bin/env bash

export COMPSS_PYTHON_VERSION=3
module load COMPSs/3.0
module load singularity/3.5.2
module use /apps/modules/modulefiles/tools/COMPSs/libraries
module load permedcoe  # generic permedcoe package

# Override the following for using different images or dataset
export PERMEDCOE_IMAGES=${PERMEDCOE_IMAGES}  # Currently using the "permedcoe" deployed
dataset=$(pwd)/../../Resources/data/

# Set the tool internal parallelism and constraint
export COMPUTING_UNITS=1

enqueue_compss \
    --num_nodes=2 \
    --exec_time=15 \
    --worker_working_dir=$(pwd) \
    --log_level=off \
    --graph \
    --tracing \
    --python_interpreter=python3 \
    $(pwd)/src_split/2_covid19_pilot_per_patient.py \
        $(pwd)/ko_file.txt \
        epithelial_cell_2 \
        C141 \
        $(pwd)/results/ \
        ${dataset}/epithelial_cell_2 \
        2 \
        100

enqueue_compss \
    --num_nodes=2 \
    --exec_time=15 \
    --worker_working_dir=$(pwd) \
    --log_level=off \
    --graph \
    --tracing \
    --python_interpreter=python3 \
    $(pwd)/src_split/2_covid19_pilot_per_patient.py \
        $(pwd)/ko_file.txt \
        epithelial_cell_2 \
        C142 \
        $(pwd)/results/ \
        ${dataset}/epithelial_cell_2 \
        2 \
        100

######################################################
# APPLICATION EXECUTION EXAMPLE
# Call:
#       ./b_2_launch_per_patient.sh
#
# Example:
#       ./b_2_launch_per_patient.sh
######################################################
