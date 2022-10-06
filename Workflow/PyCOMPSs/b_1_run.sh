#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [[ -z "${PERMEDCOE_IMAGES}" ]]; then
  default_images=$(realpath ${SCRIPT_DIR}/../../../BuildingBlocks/Resources/images/)/
  export PERMEDCOE_IMAGES=${default_images}
  echo "WARNING: PERMEDCOE_IMAGES environment variable not set. Using default: ${default_images}"
else
  echo "INFO: Using PERMEDCOE_IMAGES from: ${PERMEDCOE_IMAGES}"
fi

dataset=$(pwd)/../../Resources/data

# Set the container engine (SINGULARITY or UDOCKER)
export CONTAINER_ENGINE=UDOCKER

# Set the tool internal parallelism and constraint
export COMPUTING_UNITS=1

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/1_covid19_pilot.py \
    $(pwd)/ko_file.txt \
    epithelial_cell_2 \
    ${dataset} \
    ${dataset}/metadata_small_local.tsv \
    $(pwd)/results/


######################################################
# APPLICATION EXECUTION EXAMPLE
# Call:
#       ./b_1_run.sh
#
# Example:
#       ./b_1_run.sh
######################################################
