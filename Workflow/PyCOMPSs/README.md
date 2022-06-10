COVID-19 WORKFLOW FOR PyCOMPSs
==============================

This folder contains the COVID-19 Workflow for PyCOMPSs.

**IMPORTANT**: Please, run the `0_prepare_dataset.sh` script to download and prepare
the testing dataset.


There are two versions:

1. **Full workflow for PyCOMPSs**: The whole workflow can be executed as a
   single execution or submitted to a supercomputer to be executed as a
   single job.

   Please, use the following scripts for this version:

   * `a_run.sh`: Execute the full workflow in local machine.
   * `a_launch.sh`: Submit the execution to a supercomputer.


2. **Workflow splitted in phases**: The workflow is splitted into multiple
   phases so that each of them can be executed individually (but the order
   must be kept in order to execute the whole workflow).

   Please, use the following scripts for this version:

   * Run in local machine:

     * `b_1_run.sh`: Execute the first steps of the workflow. Computes the ko-file with MaBoSS building block and performs the single cell processing for all patients.
     * `b_2_run.sh`: Execute the second step of the workflow. This step considers all patients. Computes all patient personalization and all PhysiBoSS simulations.
     * `b_2_run_per_patient.sh`: Execute the second step of the workflow. This step considers each patient individually. Computes only the patient personalization and its required PhysiBoSS simulations. This script runs for two testing patients, but could be extended for more if requested.
     * `b_3_run.sh`: Execute the third step of the workflow (meta-analysis). Requires previous step 1 and 2 to be completed.

  * Submit the execution to a supercomputer:

     * `b_1_launch.sh`: Submits the execution of the first steps of the workflow. Computes the ko-file with MaBoSS building block and performs the single cell processing for all patients.
     * `b_2_launch.sh`: Submits the execution of the second steps of the workflow. This step considers all patients. Computes all patient personalization and all PhysiBoSS simulations.
     * `b_2_launch_per_patient.sh`: Submits the execution of the second steps of the workflow. This step considers each patient individually. Computes only the patient personalization and its required PhysiBoSS simulations. This script runs for two testing patients, but could be extended for more if requested.
     * `b_3_launch.sh`: Submits the execution of the third step of the workflow. Requires previous step 1 and 2 to be completed.
