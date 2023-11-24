#!/usr/bin/env bash

echo "Downloading covid-19-workflow required containers... Please wait..."

CURRENT_DIR=$(pwd)
CONTAINER_FOLDER=$(pwd)/covid-19-workflow-containers
mkdir -p ${CONTAINER_FOLDER}
cd ${CONTAINER_FOLDER}

apptainer pull maboss.sif docker://ghcr.io/jaantollander/maboss:latest
apptainer pull meta_analysis.sif docker://ghcr.io/jaantollander/meta_analysis:latest
apptainer pull PhysiCell-COVID19.sif docker://ghcr.io/jaantollander/PhysiCell-COVID19:latest
apptainer pull single_cell.sif docker://ghcr.io/jaantollander/single_cell:latest

cd ${CURRENT_DIR}

echo "covid-19-workflow required containers downloaded"
echo ""
echo "Containers stored in: ${CONTAINER_FOLDER}"
echo ""
echo "Please, don't forget to run:"
echo "    export PERMEDCOE_IMAGES=${CONTAINER_FOLDER}"
echo "Before running the workflow."
echo ""
