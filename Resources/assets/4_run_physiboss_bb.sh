#!/usr/bin/env bash

export COVID19_BB_IMAGES=$(pwd)/../images/
export COVID19_BB_ASSETS=$(pwd)/
export COMPUTING_UNITS=1

# 1st patient

mkdir $(pwd)/result/C141/physiboss_results

physiboss -d \
    -i C141 1 epithelial_cell_2_personalized \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_1.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_1.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized_physiboss_run_1 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/

physiboss -d \
    -i C141 1 epithelial_cell_2_personalized__M \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_1.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_1.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_1 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/

physiboss -d \
    -i C141 1 epithelial_cell_2_personalized__FASLG \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FASLG_ko_1.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FASLG_ko_1.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__FASLG_ko_physiboss_run_1 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/

physiboss -d \
    -i C141 2 epithelial_cell_2_personalized \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_2.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized_2.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized_physiboss_run_2 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/

physiboss -d \
    -i C141 2 epithelial_cell_2_personalized__M \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_2.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__M_ko_2.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_2 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/

physiboss -d \
    -i C141 2 epithelial_cell_2_personalized__FASLG \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.bnd \
       $(pwd)/result/C141/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FASLG_ko_2.out \
       $(pwd)/result/C141/physiboss_results/output_C141_epithelial_cell_2_personalized__FASLG_ko_2.err \
       $(pwd)/result/C141/physiboss_results/epithelial_cell_2_personalized__FASLG_ko_physiboss_run_2 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/


# 2nd patient

mkdir $(pwd)/result/C142/physiboss_results

physiboss -d \
    -i C142 1 epithelial_cell_2_personalized \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_1.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_1.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized_physiboss_run_1 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/

physiboss -d \
    -i C142 1 epithelial_cell_2_personalized__M \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_1.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_1.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_1 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/

physiboss -d \
    -i C142 1 epithelial_cell_2_personalized__FASLG \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FASLG_ko_1.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FASLG_ko_1.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__FASLG_ko_physiboss_run_1 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/

physiboss -d \
    -i C142 2 epithelial_cell_2_personalized \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_2.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized_2.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized_physiboss_run_2 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/

physiboss -d \
    -i C142 2 epithelial_cell_2_personalized__M \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__M_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_2.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__M_ko_2.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__M_ko_physiboss_run_2 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/

physiboss -d \
    -i C142 2 epithelial_cell_2_personalized__FASLG \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.bnd \
       $(pwd)/result/C142/personalize_patient/models/epithelial_cell_2_personalized__FASLG_ko.cfg \
       ${COMPUTING_UNITS} \
    -o $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FASLG_ko_2.out \
       $(pwd)/result/C142/physiboss_results/output_C142_epithelial_cell_2_personalized__FASLG_ko_2.err \
       $(pwd)/result/C142/physiboss_results/epithelial_cell_2_personalized__FASLG_ko_physiboss_run_2 \
    --mount_points ${COVID19_BB_ASSETS}/PhysiBoSS/:${COVID19_BB_ASSETS}/PhysiBoSS/
