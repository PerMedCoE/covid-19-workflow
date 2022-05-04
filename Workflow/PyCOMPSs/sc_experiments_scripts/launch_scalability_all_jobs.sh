#!/usr/bin/env bash

export COMPSS_PYTHON_VERSION=3-ML
module load COMPSs/2.10
module load singularity/3.5.2
module use /apps/modules/modulefiles/tools/COMPSs/libraries
module load permedcoe  # generic permedcoe package


# Set the tool internal parallelism and constraint
export COMPUTING_UNITS=1
id=$(./launch_scalability_job.sh None | grep "Submitted batch job" | cut -d " " -f 4)
echo $id

export COMPUTING_UNITS=2
id=$(./launch_scalability_job.sh $id | grep "Submitted batch job" | cut -d " " -f 4)
echo $id

export COMPUTING_UNITS=4
id=$(./launch_scalability_job.sh $id | grep "Submitted batch job" | cut -d " " -f 4)
echo $id

export COMPUTING_UNITS=8
id=$(./launch_scalability_job.sh $id | grep "Submitted batch job" | cut -d " " -f 4)
echo $id

export COMPUTING_UNITS=16
id=$(./launch_scalability_job.sh $id | grep "Submitted batch job" | cut -d " " -f 4)
echo $id

export COMPUTING_UNITS=32
id=$(./launch_scalability_job.sh $id | grep "Submitted batch job" | cut -d " " -f 4)
echo $id

export COMPUTING_UNITS=48
id=$(./launch_scalability_job.sh $id | grep "Submitted batch job" | cut -d " " -f 4)
echo $id
