#!/usr/bin/env bash

export PERMEDCOE_IMAGES=$(pwd)/../images/
export PERMEDCOE_ASSETS=$(pwd)/
export COMPUTING_UNITS=1

# 1st patient

mkdir $(pwd)/result/C141/physiboss_results

physiboss_BB -d \
    -i C141 1 epithelial_cell_2_personalized \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_1.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_1.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized_physiboss_run_1 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/

physiboss_BB -d \
    -i C141 1 epithelial_cell_2_personalized__M \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_1.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_1.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_1 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/

physiboss_BB -d \
    -i C141 1 epithelial_cell_2_personalized__FADD \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FADD_ko_1.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FADD_ko_1.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__FADD_ko_physiboss_run_1 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/

physiboss_BB -d \
    -i C141 2 epithelial_cell_2_personalized \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_2.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_2.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized_physiboss_run_2 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/

physiboss_BB -d \
    -i C141 2 epithelial_cell_2_personalized__M \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_2.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_2.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_2 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/

physiboss_BB -d \
    -i C141 2 epithelial_cell_2_personalized__FADD \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FADD_ko_2.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FADD_ko_2.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__FADD_ko_physiboss_run_2 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/


# 2nd patient

mkdir $(pwd)/result/C142/physiboss_results

physiboss_BB -d \
    -i C142 1 epithelial_cell_2_personalized \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_1.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_1.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized_physiboss_run_1 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/

physiboss_BB -d \
    -i C142 1 epithelial_cell_2_personalized__M \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_1.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_1.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_1 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/

physiboss_BB -d \
    -i C142 1 epithelial_cell_2_personalized__FADD \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FADD_ko_1.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FADD_ko_1.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__FADD_ko_physiboss_run_1 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/

physiboss_BB -d \
    -i C142 2 epithelial_cell_2_personalized \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_2.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_2.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized_physiboss_run_2 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/

physiboss_BB -d \
    -i C142 2 epithelial_cell_2_personalized__M \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_2.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_2.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_2 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/

physiboss_BB -d \
    -i C142 2 epithelial_cell_2_personalized__FADD \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FADD_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FADD_ko_2.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FADD_ko_2.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__FADD_ko_physiboss_run_2 \
    --mount_points ${PERMEDCOE_ASSETS}/PhysiBoSS/:${PERMEDCOE_ASSETS}/PhysiBoSS/
