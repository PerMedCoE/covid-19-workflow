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

mkdir $(pwd)/result/C141/physiboss_replicates_analysis

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C141_1_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C141/physiboss_results/ \
    --prefix epithelial_cell_2_personalized_physiboss_run_ \
    --out_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized.out \
    --err_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized.err \
    --results_dir $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized_results \
    --parallel ${COMPUTING_UNITS}


TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C141_2_Apoptosome_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C141/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__Apoptosome_complex_ko_physiboss_run_ \
    --out_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__Apoptosome_complex_ko.out \
    --err_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__Apoptosome_complex_ko.err \
    --results_dir $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__Apoptosome_complex_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C141_3_FADD_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C141/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__FADD_ko_physiboss_run_ \
    --out_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__FADD_ko.out \
    --err_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__FADD_ko.err \
    --results_dir $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__FADD_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C141_4_M_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C141/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__M_ko_physiboss_run_ \
    --out_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__M_ko.out \
    --err_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__M_ko.err \
    --results_dir $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__M_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C141_5_CASP9_cell_active_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C141/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__CASP9_cell_active_ko_physiboss_run_ \
    --out_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP9_cell_active_ko.out \
    --err_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP9_cell_active_ko.err \
    --results_dir $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP9_cell_active_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C141_6_FAS_FASL_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C141/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__FAS_FASL_complex_ko_physiboss_run_ \
    --out_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__FAS_FASL_complex_ko.out \
    --err_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__FAS_FASL_complex_ko.err \
    --results_dir $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__FAS_FASL_complex_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C141_7_CASP3_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C141/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__CASP3_ko_physiboss_run_ \
    --out_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP3_ko.out \
    --err_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP3_ko.err \
    --results_dir $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP3_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C141_8_FASLG_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C141/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__FASLG_ko_physiboss_run_ \
    --out_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__FASLG_ko.out \
    --err_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__FASLG_ko.err \
    --results_dir $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__FASLG_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C141_9_CASP8_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C141/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__CASP8_ko_physiboss_run_ \
    --out_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP8_ko.out \
    --err_file $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP8_ko.err \
    --results_dir $(pwd)/result/C141/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP8_ko_results \
    --parallel ${COMPUTING_UNITS}



# 2nd patient

mkdir $(pwd)/result/C142/physiboss_replicates_analysis

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C142_1_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C142/physiboss_results/ \
    --prefix epithelial_cell_2_personalized_physiboss_run_ \
    --out_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized.out \
    --err_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized.err \
    --results_dir $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized_results \
    --parallel ${COMPUTING_UNITS}


TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C142_2_Apoptosome_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C142/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__Apoptosome_complex_ko_physiboss_run_ \
    --out_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__Apoptosome_complex_ko.out \
    --err_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__Apoptosome_complex_ko.err \
    --results_dir $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__Apoptosome_complex_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C142_3_FADD_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C142/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__FADD_ko_physiboss_run_ \
    --out_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__FADD_ko.out \
    --err_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__FADD_ko.err \
    --results_dir $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__FADD_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C142_4_M_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C142/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__M_ko_physiboss_run_ \
    --out_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__M_ko.out \
    --err_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__M_ko.err \
    --results_dir $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__M_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C142_5_CASP9_cell_active_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C142/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__CASP9_cell_active_ko_physiboss_run_ \
    --out_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP9_cell_active_ko.out \
    --err_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP9_cell_active_ko.err \
    --results_dir $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP9_cell_active_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C142_6_FAS_FASL_complex_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C142/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__FAS_FASL_complex_ko_physiboss_run_ \
    --out_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__FAS_FASL_complex_ko.out \
    --err_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__FAS_FASL_complex_ko.err \
    --results_dir $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__FAS_FASL_complex_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C142_7_CASP3_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C142/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__CASP3_ko_physiboss_run_ \
    --out_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP3_ko.out \
    --err_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP3_ko.err \
    --results_dir $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP3_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C142_8_FASLG_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C142/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__FASLG_ko_physiboss_run_ \
    --out_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__FASLG_ko.out \
    --err_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__FASLG_ko.err \
    --results_dir $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__FASLG_ko_results \
    --parallel ${COMPUTING_UNITS}

TEMP_DIRECTORY=$(pwd)/physiboss_analyse_replicates_C142_9_CASP8_wd
mkdir -p ${TEMP_DIRECTORY}

PhysiBoSS_BB \
    --debug \
    --tmpdir ${TEMP_DIRECTORY} \
    analyse_replicates \
    --replicates 2 \
    --replicates_folder $(pwd)/result/C142/physiboss_results/ \
    --prefix epithelial_cell_2_personalized__CASP8_ko_physiboss_run_ \
    --out_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP8_ko.out \
    --err_file $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP8_ko.err \
    --results_dir $(pwd)/result/C142/physiboss_replicates_analysis/epithelial_cell_2_personalized__CASP8_ko_results \
    --parallel ${COMPUTING_UNITS}