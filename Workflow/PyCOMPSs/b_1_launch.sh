#!/usr/bin/env bash

export COMPSS_PYTHON_VERSION=3
module load COMPSs/3.1
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
    --exec_time=10 \
    --worker_working_dir=$(pwd) \
    --log_level=off \
    --graph \
    --tracing \
    --python_interpreter=python3 \
    $(pwd)/src_split/1_covid19_pilot.py \
        $(pwd)/ko_file.txt \
        epithelial_cell_2 \
        ${dataset} \
        ${dataset}/metadata_clean.tsv \
        $(pwd)/results/

######################################################
# APPLICATION EXECUTION EXAMPLE
# Call:
#       ./b_1_launch.sh
#
# Example:
#       ./b_1_launch.sh
######################################################
