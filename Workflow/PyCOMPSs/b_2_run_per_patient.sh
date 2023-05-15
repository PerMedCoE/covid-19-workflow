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

# Set the tool internal parallelism and constraint
export COMPUTING_UNITS=8

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/2_covid19_pilot_per_patient.py \
   $(pwd)/ko_file.txt \
   epithelial_cell_2 \
   C141 \
   $(pwd)/results/ \
   ${dataset}/epithelial_cell_2 \
   3 \
   14400

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/2_covid19_pilot_per_patient.py \
   $(pwd)/ko_file.txt \
   epithelial_cell_2 \
   C142 \
   $(pwd)/results/ \
   ${dataset}/epithelial_cell_2 \
   3 \
   14400

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/2_covid19_pilot_per_patient.py \
    $(pwd)/ko_file.txt \
    epithelial_cell_2 \
    C143 \
    $(pwd)/results/ \
    ${dataset}/epithelial_cell_2 \
    3 \
    14400

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/2_covid19_pilot_per_patient.py \
    $(pwd)/ko_file.txt \
    epithelial_cell_2 \
    C144 \
    $(pwd)/results/ \
    ${dataset}/epithelial_cell_2 \
    3 \
    14400

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/2_covid19_pilot_per_patient.py \
    $(pwd)/ko_file.txt \
    epithelial_cell_2 \
    C145 \
    $(pwd)/results/ \
    ${dataset}/epithelial_cell_2 \
    3 \
    14400

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/2_covid19_pilot_per_patient.py \
    $(pwd)/ko_file.txt \
    epithelial_cell_2 \
    C51 \
    $(pwd)/results/ \
    ${dataset}/epithelial_cell_2 \
    3 \
    14400

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/2_covid19_pilot_per_patient.py \
    $(pwd)/ko_file.txt \
    epithelial_cell_2 \
    C52 \
    $(pwd)/results/ \
    ${dataset}/epithelial_cell_2 \
    3 \
    14400

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/2_covid19_pilot_per_patient.py \
    $(pwd)/ko_file.txt \
    epithelial_cell_2 \
    C100 \
    $(pwd)/results/ \
    ${dataset}/epithelial_cell_2 \
    3 \
    14400

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/2_covid19_pilot_per_patient.py \
    $(pwd)/ko_file.txt \
    epithelial_cell_2 \
    C148 \
    $(pwd)/results/ \
    ${dataset}/epithelial_cell_2 \
    3 \
    14400

runcompss --log_level=debug --graph --python_interpreter=python3 $(pwd)/src_split/2_covid19_pilot_per_patient.py \
    $(pwd)/ko_file.txt \
    epithelial_cell_2 \
    C152 \
    $(pwd)/results/ \
    ${dataset}/epithelial_cell_2 \
    3 \
    14400

######################################################
# APPLICATION EXECUTION EXAMPLE
# Call:
#       ./b_2_run_per_patient.sh
#
# Example:
#       ./b_2_run_per_patient.sh
######################################################
