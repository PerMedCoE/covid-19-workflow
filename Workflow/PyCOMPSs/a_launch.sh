#!/usr/bin/env bash

export COMPSS_PYTHON_VERSION=3
module load COMPSs/2.10
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
    --exec_time=45 \
    --worker_working_dir=$(pwd) \
    --log_level=off \
    --graph \
    --tracing \
    --python_interpreter=python3 \
    $(pwd)/src/covid19_pilot.py \
        ${dataset}metadata_clean.tsv \
        ${dataset}epithelial_cell_2 \
        $(pwd)/results/ \
        $(pwd)/ko_file.txt \
        2 \
        epithelial_cell_2 \
        ${dataset} \
        100

######################################################
# APPLICATION EXECUTION EXAMPLE
# Call:
#       ./a_launch.sh
#
# Example:
#       ./a_launch.sh
######################################################
