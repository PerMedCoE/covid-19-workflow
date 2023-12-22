#!/usr/bin/env bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
if [[ -z "${PERMEDCOE_IMAGES}" ]]; then
  default_images=$(realpath ${SCRIPT_DIR}/../../BuildingBlocks/Resources/images/)/
  export PERMEDCOE_IMAGES=${default_images}
  echo "WARNING: PERMEDCOE_IMAGES environment variable not set. Using default: ${default_images}"
else
  echo "INFO: Using PERMEDCOE_IMAGES from: ${PERMEDCOE_IMAGES}"
fi
export COMPUTING_UNITS=1

# 1st patient

mkdir $(pwd)/result/C141/physiboss_results

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_Apoptosome_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__Apoptosome_complex \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__Apoptosome_complex_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__Apoptosome_complex_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__Apoptosome_complex_ko_1.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__Apoptosome_complex_ko_1.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__Apoptosome_complex_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_FADD_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_M_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_CASP9_cell_active_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__CASP9_cell_active \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP9_cell_active_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP9_cell_active_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP9_cell_active_ko_1.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP9_cell_active_ko_1.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__CASP9_cell_active_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_FAS_FASL_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__FAS_FASL_complex \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FAS_FASL_complex_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FAS_FASL_complex_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FAS_FASL_complex_ko_1.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FAS_FASL_complex_ko_1.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__FAS_FASL_complex_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_CASP3_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__CASP3 \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP3_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP3_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP3_ko_1.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP3_ko_1.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__CASP3_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_FASLG_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__FASLG \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FASLG_ko_1.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FASLG_ko_1.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__FASLG_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C141_1_CASP8_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__CASP8 \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP8_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP8_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP8_ko_1.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP8_ko_1.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__CASP8_ko_physiboss_run_1


TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_Apoptosome_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__Apoptosome_complex \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__Apoptosome_complex_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__Apoptosome_complex_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__Apoptosome_complex_ko_2.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__Apoptosome_complex_ko_2.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__Apoptosome_complex_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_FADD_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_M_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_CASP9_cell_active_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__CASP9_cell_active \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP9_cell_active_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP9_cell_active_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP9_cell_active_ko_2.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP9_cell_active_ko_2.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__CASP9_cell_active_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_FAS_FASL_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__FAS_FASL_complex \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FAS_FASL_complex_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FAS_FASL_complex_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FAS_FASL_complex_ko_2.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FAS_FASL_complex_ko_2.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__FAS_FASL_complex_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_CASP3_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__CASP3 \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP3_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP3_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP3_ko_2.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP3_ko_2.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__CASP3_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_FASLG_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__FASLG \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FASLG_ko_2.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FASLG_ko_2.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__FASLG_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C141_2_CASP8_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C141 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__CASP8 \
    --bnd_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP8_ko.bnd \
    --cfg_file $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__CASP8_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP8_ko_2.out \
    --err_file $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__CASP8_ko_2.err \
    --results_dir $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__CASP8_ko_physiboss_run_2


# 2nd patient

mkdir $(pwd)/result/C142/physiboss_results

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_Apoptosome_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__Apoptosome_complex \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__Apoptosome_complex_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__Apoptosome_complex_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__Apoptosome_complex_ko_1.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__Apoptosome_complex_ko_1.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__Apoptosome_complex_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_FADD_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_M_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_CASP9_cell_active_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__CASP9_cell_active \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP9_cell_active_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP9_cell_active_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP9_cell_active_ko_1.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP9_cell_active_ko_1.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__CASP9_cell_active_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_FAS_FASL_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__FAS_FASL_complex \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FAS_FASL_complex_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FAS_FASL_complex_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FAS_FASL_complex_ko_1.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FAS_FASL_complex_ko_1.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__FAS_FASL_complex_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_CASP3_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__CASP3 \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP3_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP3_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP3_ko_1.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP3_ko_1.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__CASP3_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_FASLG_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__FASLG \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FASLG_ko_1.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FASLG_ko_1.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__FASLG_ko_physiboss_run_1

TEMP_DIRECTORY=$(pwd)/physiboss_C142_1_CASP8_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 1 \
    --prefix epithelial_cell_2_personalized__CASP8 \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP8_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP8_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP8_ko_1.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP8_ko_1.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__CASP8_ko_physiboss_run_1


TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_Apoptosome_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__Apoptosome_complex \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__Apoptosome_complex_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__Apoptosome_complex_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__Apoptosome_complex_ko_2.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__Apoptosome_complex_ko_2.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__Apoptosome_complex_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_FADD_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_M_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
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

TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_CASP9_cell_active_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__CASP9_cell_active \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP9_cell_active_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP9_cell_active_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP9_cell_active_ko_2.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP9_cell_active_ko_2.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__CASP9_cell_active_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_FAS_FASL_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__FAS_FASL_complex \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FAS_FASL_complex_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FAS_FASL_complex_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FAS_FASL_complex_ko_2.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FAS_FASL_complex_ko_2.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__FAS_FASL_complex_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_CASP3_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__CASP3 \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP3_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP3_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP3_ko_2.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP3_ko_2.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__CASP3_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_FASLG_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__FASLG \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FASLG_ko_2.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FASLG_ko_2.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__FASLG_ko_physiboss_run_2

TEMP_DIRECTORY=$(pwd)/physiboss_C142_2_CASP8_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    default \
    --sample C142 \
    --repetition 2 \
    --prefix epithelial_cell_2_personalized__CASP8 \
    --bnd_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP8_ko.bnd \
    --cfg_file $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__CASP8_ko.cfg \
    --parallel ${COMPUTING_UNITS} \
    --max_time 100 \
    --out_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP8_ko_2.out \
    --err_file $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__CASP8_ko_2.err \
    --results_dir $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__CASP8_ko_physiboss_run_2