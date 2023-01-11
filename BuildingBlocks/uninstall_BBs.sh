#!/usr/bin/env bash

echo "Uninstalling covid-19-workflow required Building Blocks... Please wait..."

python3 -m pip uninstall -y MaBoSS-BB
python3 -m pip uninstall -y meta_analysis-BB
python3 -m pip uninstall -y personalize_patient-BB
python3 -m pip uninstall -y PhysiBoSS-BB
python3 -m pip uninstall -y single_cell_processing-BB

echo "Uninstall finished"
