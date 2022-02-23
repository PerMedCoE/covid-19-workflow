# COVID-19 Workflow

COVID-19 Multiscale Modelling of the Virus and Patients’ Tissue

## Table of Contents

- [COVID-19 Workflow](#covid-19-workflow)
  - [Table of Contents](#table-of-contents)
  - [Description](#description)
  - [Contents](#contents)
    - [Building Blocks](#building-blocks)
    - [Workflows](#workflows)
    - [Resources](#resources)
    - [Tests](#tests)
  - [Instructions](#instructions)
    - [Local machine](#local-machine)
      - [Requirements](#requirements)
      - [Usage steps](#usage-steps)
    - [MareNostrum 4](#marenostrum-4)
      - [Requirements in MN4](#requirements-in-mn4)
      - [Usage steps in MN4](#usage-steps-in-mn4)
  - [License](#license)
  - [Contact](#contact)

## Description

TO BE COMPLETED

## Contents

### Building Blocks

The ``BuildingBlocks`` folder contains the script to install the
Building Blocks used in the COVID-19 Workflow.

### Workflows

The ``Workflow`` folder contains the workflows implementations.

Currently contains the implementation using PyCOMPSs and Snakemake (in progress).

### Resources

The ``Resources`` folder contains the building blocks assets and images, and
a small dataset.

### Tests

The ``Tests`` folder contains the scripts that run each Building Block
used in the workflow for a small dataset.
They can be executed individually *without PyCOMPSs installed* for testing
purposes.

## Instructions

### Local machine

This section explains the requirements and usage for the COVID19 Workflow in a laptop or desktop computer.

#### Requirements

- [`permedcoe`](https://github.com/PerMedCoE/permedcoe) package
- [PyCOMPSs](https://pycompss.readthedocs.io/en/stable/Sections/00_Quickstart.html) / [Snakemake](https://snakemake.readthedocs.io/en/stable/)
- [Singularity](https://sylabs.io/guides/3.0/user-guide/installation.html)

#### Usage steps

1. Clone the `BuildingBlocks` repository

   ```bash
   git clone https://github.com/PerMedCoE/BuildingBlocks.git
   ```

2. Build the required Building Block images

   ```bash
   cd BuildingBlocks/Resources/images
   sudo singularity build MaBoSS.sif MaBoSS.singularity
   sudo singularity build meta_analysis.sif meta_analysis.singularity
   sudo singularity build PhysiCell-COVID19.sif PhysiCell-COVID19.singularity
   sudo singularity build single_cell.sif single_cell.singularity
   cd ../../..
   ```

   > :warning: **TIP**: The singularity containers **can to be downloaded** from the project [B2DROP](https://b2drop.bsc.es/index.php/f/444350).


3. Clone this repository

   ```bash
   git clone https://github.com/PerMedCoE/covid-19-workflow.git
   ```

4. Install the `BuildingBlocks` package

   ```bash
   cd covid-19-workflow
   cd BuildingBlocks && ./install_BBs.sh && cd ..
   ```

**If using PyCOMPSs**

5. Go to `Workflow/PyCOMPSs` folder

   ```bash
   cd Workflows/PyCOMPSs
   ```

6. Execute `./run.sh`

**If using Snakemake**

5. Go to `Workflow/SnakeMake` folder

   ```bash
   cd Workflows/SnakeMake
   ```

6. Execute `./run.sh`

The execution is prepared to use the singularity images that **MUST** be placed into `BuildingBlocks/Resources/images` folder, and the assets **MUST** be located into `BuildingBlocks/Resources/assets`. If they are located in any other folder, please update the `run.sh` script setting the `PERMEDCOE_IMAGES` and `PERMEDCOE_ASSETS` to
the images and assets folders accordingly.

> **TIP**: If you want to run the workflow with a different dataset, please update the `run.sh` script setting the `dataset` variable to the new dataset folder and their file names. 

### MareNostrum 4

This section explains the requirements and usage for the COVID19 Workflow in the MareNostrum 4 supercomputer.

#### Requirements in MN4

- Access to MN4

All Building Blocks are already installed in MN4, and the COVID19 Workflow available.

#### Usage steps in MN4

1. Load the `COMPSs`, `Singularity` and `permedcoe` modules

   ```bash
   export COMPSS_PYTHON_VERSION=3
   module load COMPSs/2.10
   module load singularity/3.5.2
   module use /apps/modules/modulefiles/tools/COMPSs/libraries
   module load permedcoe
   ```

   > **TIP**: Include the loading into your `${HOME}/.bashrc` file to load it automatically on the session start.

   This commands will load COMPSs and the permedcoe package which provides all necessary dependencies, as well as the path to the singularity container images (`PERMEDCOE_IMAGES` environment variable), assets (`PERMEDCOE_ASSETS` environment variable) and testing dataset (`COVID19WORKFLOW_DATASET` environment variable).

2. Get a copy of the pilot workflow into your desired folder

   ```bash
   mkdir desired_folder
   cd desired_folder
   get_covid19workflow
   ```

3. Go to `Workflow/PyCOMPSs` folder

   ```bash
   cd Workflow/PyCOMPSs
   ```

4. Execute `./launch.sh`

This command will launch a job into the job queuing system (SLURM) requesting 2 nodes (one node acting half master and half worker, and other full worker node) for 20 minutes, and is prepared to use the singularity images that are already deployed in MN4 (located into the `PERMEDCOE_IMAGES` environment variable). It uses the assets located into the `PERMEDCOE_ASSETS` environment variable and dataset located into `../../Resources/data` folder.

> :warning: **TIP**: If you want to run the workflow with a different dataset, please edit the `launch.sh` script and define the appropriate dataset path.

After the execution, a `results` folder will be available with with COVID19 Workflow results.

### Mahti or Puhti

This section explains how to run the COVID19 workflow on CSC supercomputers using SnakeMake.

#### Requirements

- Install snakemake (or check if there is a version installed using `module spider snakemake`)
- Install workflow, using the same steps as for the local machine. With the exception that containers have to be built elsewhere. 

#### Steps


1. Go to `Workflow/SnakeMake` folder

   ```bash
   cd Workflow/SnakeMake
   ```
   
2. Edit `launch.sh` with the correct partition, account, and resource specifications.  

3. Execute `./launch.sh`

> :warning: Snakemake provides a `--cluster` flag, but this functionality should be avoided as it's really not suited for HPC systems.

## License

[Apache 2.0](https://www.apache.org/licenses/LICENSE-2.0)

## Contact

<https://permedcoe.eu/contact/>
