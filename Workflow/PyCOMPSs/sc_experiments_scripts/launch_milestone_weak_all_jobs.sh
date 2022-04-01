#!/usr/bin/env bash

export COMPSS_PYTHON_VERSION=3-ML
module load COMPSs/2.10
module load singularity/3.5.2
module use /apps/modules/modulefiles/tools/COMPSs/libraries
module load permedcoe  # generic permedcoe package

# Set the tool internal parallelism and constraint
export COMPUTING_UNITS=4  # Always 4 since it has been found to be good.


# 2 nodes (1 master + 1 worker) with 10 patients
id=$(./launch_milestone_job.sh None 2 60 metadata_clean.tsv | grep "Submitted batch job" | cut -d " " -f 4)
echo $id

# 3 nodes (1 master + 2 worker) with 20 patients
id=$(./launch_milestone_job.sh ${id} 3 60 metadata_2x.tsv | grep "Submitted batch job" | cut -d " " -f 4)
echo $id

# 5 nodes (1 master + 4 worker) with 40 patients
id=$(./launch_milestone_job.sh ${id} 5 60 metadata_4x.tsv | grep "Submitted batch job" | cut -d " " -f 4)
echo $id

# 7 nodes (1 master + 6 worker) with 60 patients
id=$(./launch_milestone_job.sh ${id} 7 60 metadata_6x.tsv | grep "Submitted batch job" | cut -d " " -f 4)
echo $id

# 9 nodes (1 master + 8 worker) with 80 patients
id=$(./launch_milestone_job.sh ${id} 9 60 metadata_8x.tsv | grep "Submitted batch job" | cut -d " " -f 4)
echo $id

# 11 nodes (1 master + 10 worker) with 100 patients
id=$(./launch_milestone_job.sh ${id} 11 60 metadata_10x.tsv | grep "Submitted batch job" | cut -d " " -f 4)
echo $id
