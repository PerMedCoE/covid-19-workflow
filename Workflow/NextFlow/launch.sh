#!/usr/bin/env bash


#permedcoe execute application NextFlow.nf --workflow_manager nextflow
export NXF_DEFAULT_DSL=1
export PERMEDCOE_IMAGES=$(readlink -f $(pwd)/../../../BuildingBlocks/Resources/images/)/
export _DATA_DIR=$(readlink -f ../../Resources/data/)

# Using shortcuts:
# permedcoe x app NextFlow.nf -w nextflow
