#!/usr/bin/env bash
export PERMEDCOE_IMAGES=$(readlink -f $(pwd)/../../../BuildingBlocks/Resources/images/)/
export PERMEDCOE_ASSETS=$(readlink -f $(pwd)/../../../BuildingBlocks/Resources/assets/)/

export _DATA_DIR=$(readlink -f ../../Resources/data/)
export SINGULARITY_BIND="$PERMEDCOE_ASSETS:$PERMEDCOE_ASSETS,$_DATA_DIR:$_DATA_DIR"
snakemake --cores 12 --cluster-config cluster.json --cluster "sbatch -A {cluster.account} -p {cluster.partition} -n {cluster.n}  -t {cluster.time} --mem {cluster.memory}"  meta_analysis
