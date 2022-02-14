#!/usr/bin/env bash
export COVID19_BB_IMAGES=$(readlink -f ../../resources/images/)/
export COVID19_BB_ASSETS=$(readlink -f ../../resources/assets/)/
export _DATA_DIR=$(readlink -f ../../resources/data/)/
export SINGULARITY_BIND="$COVID19_BB_ASSETS:$COVID19_BB_ASSETS,$_DATA_DIR:$_DATA_DIR"
snakemake --cores 12 meta_analysis 
