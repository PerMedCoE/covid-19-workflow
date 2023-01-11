#!/usr/bin/env bash

echo "Uninstalling covid-19-workflow required Building Blocks... Please wait..."

CURRENT_DIR=$(pwd)
# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd ../../../BuildingBlocks

cd MaBoSS
./uninstall.sh
cd ..

cd meta_analysis
./uninstall.sh
cd ..

cd personalize_patient
./uninstall.sh
cd ..

cd PhysiBoSS
./uninstall.sh
cd ..

cd single_cell_processing
./uninstall.sh
cd ..

cd ${CURRENT_DIR}
