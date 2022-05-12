#!/usr/bin/env bash


#permedcoe execute application NextFlow.nf --workflow_manager nextflow
export PERMEDCOE_IMAGES=$(readlink -f $(pwd)/../../../BuildingBlocks/Resources/images/)/
export _DATA_DIR=$(readlink -f ../../Resources/data/)
export SINGULARITY_BIND=$_DATA_DIR,$(readlink -f $(python3 -c "import meta_analysis_BB; import os; print(os.path.dirname(meta_analysis_BB.__file__))")/../) 

# Using shortcuts:
# permedcoe x app NextFlow.nf -w nextflow
