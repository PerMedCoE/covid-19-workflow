#!/bin/bash
#SBATCH --account=project_2001659
#SBATCH --cores=10
#SBATCH --partition=test
#SBATCH --time=00:15:00

export PERMEDCOE_IMAGES=$(readlink -f $(pwd)/../../../BuildingBlocks/Resources/images/)/
export PERMEDCOE_ASSETS=$(readlink -f $(pwd)/../../../BuildingBlocks/Resources/assets/)/

export _DATA_DIR=$(readlink -f ../../Resources/data/)
export SINGULARITY_BIND="$PERMEDCOE_ASSETS:$PERMEDCOE_ASSETS,$_DATA_DIR:$_DATA_DIR"
snakemake --cores 10 meta_analysis 
