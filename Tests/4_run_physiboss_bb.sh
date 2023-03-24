#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export PERMEDCOE_IMAGES=${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/
export COMPUTING_UNITS=1

# Self contained assets in package
PHYSIBOSS_ASSETS=$(python3 -c "import PhysiBoSS_BB; import os; print(os.path.dirname(PhysiBoSS_BB.__file__))")

source ${SCRIPT_DIR}/aux.sh
disable_pycompss

# 1st patient

mkdir $(pwd)/result/C141/physiboss_results

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C141 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_1.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_1.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_M_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C141 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__M \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_1.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_1.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_FADD_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C141 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__FADD \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FADD_ko_1.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FADD_ko_1.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__FADD_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C141 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_2.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_2.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_M_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C141 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__M \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_2.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_2.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_FADD_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C141 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__FADD \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FADD_ko_2.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FADD_ko_2.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__FADD_ko_physiboss_run_2


# 2nd patient

mkdir $(pwd)/result/C142/physiboss_results

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C142 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_1.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_1.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_M_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C142 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__M \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_1.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_1.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_FADD_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C142 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__FADD \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FADD_ko_1.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FADD_ko_1.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__FADD_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C142 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_2.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_2.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_M_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C142 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__M \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_2.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_2.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_FADD_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --mount_points ${PHYSIBOSS_ASSETS}/assets/:${PHYSIBOSS_ASSETS}/assets/ \
    --tmpdir ${TEMP_DIRECTORY} \
    --sample C142 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__FADD \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FADD_ko_2.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FADD_ko_2.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__FADD_ko_physiboss_run_2

enable_pycompss
