#!/usr/bin/env bash

echo "Installing covid-19-workflow required Building Blocks... Please wait..."

CURRENT_DIR=$(pwd)
# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd ../../../BuildingBlocks

cd MaBoSS
./install.sh
cd ..

cd meta_analysis
./install.sh
cd ..

cd personalize_patient
./install.sh
cd ..

cd PhysiBoSS
./install.sh
cd ..

cd single_cell_processing
./install.sh
cd ..

cd ${CURRENT_DIR}
