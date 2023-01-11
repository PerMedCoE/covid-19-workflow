#!/usr/bin/env bash

echo "Installing covid-19-workflow required Building Blocks... Please wait..."

python3 -m pip install 'git+https://github.com/PerMedCoE/BuildingBlocks.git@main#subdirectory=MaBoSS'
python3 -m pip install 'git+https://github.com/PerMedCoE/BuildingBlocks.git@main#subdirectory=meta_analysis'
python3 -m pip install 'git+https://github.com/PerMedCoE/BuildingBlocks.git@main#subdirectory=personalize_patient'
python3 -m pip install 'git+https://github.com/PerMedCoE/BuildingBlocks.git@main#subdirectory=PhysiBoSS'
python3 -m pip install 'git+https://github.com/PerMedCoE/BuildingBlocks.git@main#subdirectory=single_cell_processing'

echo "covid-19-workflow required Building Blocks installed"
