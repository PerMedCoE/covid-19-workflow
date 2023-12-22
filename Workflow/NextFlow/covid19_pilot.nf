#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.physiboss_cpus=1
params.single_cell_cpus=1
params.maboss_cpus=1


meta_input=Channel.fromPath("${params.meta_file}")

resources_data="${_DATA_DIR}"

maboss_wd="${PWD}/MaBoSS_wd/"
single_cell_wd="${PWD}/single_cell_wd"
personalize_patient_wd="${PWD}/personalize_patient_wd"
physiboss_model_wd="${PWD}/physibos_model_wd"
physiboss_analyse_replicates_wd="${PWD}/physiboss_analyse_replicates_wd"
meta_analysis_wd="${PWD}/meta_analysis_wd/"


workflow {
    scRNA_counts=tsv_to_csv(meta_input).splitCsv(header: true).map { row -> ["${row.id}","${row.group}", "${row.file}".replaceAll(/.*data/,"${params.data_dir}")  ] }
    MaBoSS_analysis()

    scRNA_counts | single_cell_processing

    personalize_patient(single_cell_processing.out, MaBoSS_analysis.out)

    physiboss_model(personalize_patient.out.transpose(),Channel.of(1..params.repetitions))

    // TODO: physiboss_analyse_replicates must receive a folder containing the replicas that physiboss_model has done
    // For example, in this sample physiboss_model is done 36 times, and physiboss_analyse_replicates has to be
    // done 18 times, since it requires to recibe a foler with the 2 replicas done with physiboss_model.
    // In addition, it has to be done only the amount of patients * genes (not number of repetitions)

    physiboss_analyse_replicates(personalize_patient.out.transpose(),physiboss_model.out.collect(),Channel.of(1..params.repetitions))

    meta_analysis(physiboss_analyse_replicates.out.collect(),MaBoSS_analysis.out)

}

process tsv_to_csv {

    input:
    file meta_tsv

    output:
    file "meta.csv"

    """
    sed  's/\t/,/g' $meta_tsv > "meta.csv"
    """
}


process MaBoSS_analysis {
    cpus="${params.maboss_cpus}"

    output:
    file "ko_file.txt"

    """
    mkdir -p ${maboss_wd}
    MaBoSS_BB -d --tmpdir ${maboss_wd} default --model epithelial_cell_2 --data_folder ${params.data_dir} --parallel ${task.cpus} --ko_file ko_file.txt
    """
}

process single_cell_processing {
    cpus="$params.single_cell_cpus"
    input:
      tuple val(p_id),val(group),path(sample_file)
    output:
      tuple val("$p_id"),path('result')

    """
    mkdir \${PWD}/result
    mkdir -p "${single_cell_wd}_${p_id}/"
    # Substitute the symbolic link with an actual copy of sample_file (single_cell_processing_BB fails reading if using a symbolic link).
    cp --remove-destination "\$(readlink \${PWD}/${sample_file})" \${PWD}/${sample_file}
    single_cell_processing_BB -d --tmpdir "${single_cell_wd}_${p_id}/" --p_id ${p_id} --p_group ${group} --p_file \${PWD}/${sample_file} --parallelize ${task.cpus} --norm_data \${PWD}/result/norm_data.tsv --raw_data \${PWD}/result/raw_data.tsv --scaled_data \${PWD}/result/scaled_data.tsv --cells_metadata \${PWD}/result/cells_metadata.tsv --outdir \${PWD}/images > scp.txt 2>&1
    """
}

process personalize_patient {
    input:
      tuple val(p_id),path(res_dir)
      file ko
    output:
      tuple  val("$p_id"),path("model/*.cfg"),path("model/*.bnd"),path('personal')

    """
    mkdir -p "${personalize_patient_wd}_${p_id}/"
    # Substitute the symbolic link with an actual copy of sample_file (personalize_patient_BB fails reading if using a symbolic link).
    mv \${PWD}/${res_dir} \${PWD}/${res_dir}_sl
    cp -r --remove-destination "\$(readlink \${PWD}/${res_dir}_sl)" \${PWD}/${res_dir}
    cp --remove-destination "\$(readlink \${PWD}/${ko})" \${PWD}/${ko}
    personalize_patient_BB -d --mount_points ${resources_data}:${resources_data} --tmpdir "${personalize_patient_wd}_${p_id}/" default --norm_data \${PWD}/${res_dir}/norm_data.tsv --cells \${PWD}/${res_dir}/cells_metadata.tsv --model_prefix ${params.model_prefix} --t ${params.cell_type} --ko \${PWD}/$ko --model_output_dir \$PWD/model --personalized_result \${PWD}/personal
    """
}

process physiboss_model {
    cpus="${params.physiboss_cpus}"
    input:
      tuple val(p_id),path(cfg_file),path(bnd_file),path('personal')
      each rep
    output:
      path("${p_id}_${cfg_file.baseName}_physiboss_run_${rep}")
      //val("$p_id"),path("${p_id}_${cfg_file.baseName}_physiboss_run_${rep}")
    """
    mkdir -p "${physiboss_model_wd}_${p_id}/"
    # Substitute the symbolic link with an actual copy of sample_file (personalize_patient_BB fails reading if using a symbolic link).
    cp --remove-destination "\$(readlink \${PWD}/${bnd_file})" \${PWD}/${bnd_file}
    cp --remove-destination "\$(readlink \${PWD}/${cfg_file})" \${PWD}/${cfg_file}
    PhysiBoSS_BB -d --tmpdir "${physiboss_model_wd}_${p_id}/" default --sample $p_id --repetition $rep --prefix $cfg_file.baseName --bnd_file \${PWD}/$bnd_file --cfg_file \${PWD}/$cfg_file --parallel ${task.cpus} --max_time ${params.max_time} --out_file \${PWD}/physiboss.out --err_file \${PWD}/physiboss.err --results_dir \$PWD/${p_id}_${cfg_file.baseName}_physiboss_run_${rep}
    """
}

process physiboss_analyse_replicates {
    cpus="${params.physiboss_cpus}"
    input:
      tuple val(p_id),path(cfg_file),path(bnd_file),path('personal')
      tuple val(p_id2),path("physiboss_run")
      each rep
    output:
      path("${p_id}_physiboss_replicates_analysis_${cfg_file.baseName}_results")
    """
    mkdir -p "${physiboss_analyse_replicates_wd}_${p_id}/"
    PhysiBoSS_BB -d --tmpdir "${physiboss_analyse_replicates_wd}_${p_id}/" analyse_replicates --replicates 2 --replicates_folder \${PWD}/${p_id}/physiboss_results --prefix $cfg_file.baseName --out_file \${PWD}/physiboss_analysis.out --err_file \${PWD}/physiboss_analysis.err --results_dir \$PWD/${p_id}_physiboss_replicates_analysis_${cfg_file.baseName}_results --parallel ${task.cpus}
    """
}

process meta_analysis {

    publishDir "${params.result_dir}" ,mode: 'copy'

    input:
      path physiboss_res
      file ko
    output:
      path('meta_res')

    // Nextflow makes it a bit hard to pass around directory structures
    // So we need to move around some things.
    """

    ids=(\$(ls -1 | grep epithelial_cell_2 | cut -d '_' -f1 | sort | uniq ))
    for i in "\${ids[@]}"; do
        mkdir -p \$i/physiboss_results
        mv \${i}_* \$i/physiboss_results
        rename \${i}_ "" \$i/physiboss_results/*
        mkdir -p \$i/physiboss_replicates_analysis
        mv \${i}_* \$i/physiboss_replicates_analysis
        rename \${i}_ "" \$i/physiboss_replicates_analysis/*
    done

    meta_analysis_BB -d --meta_file $params.meta_file --out_dir \$PWD --model_prefix ${params.model_name} --ko_file $ko --reps $params.repetitions --verbose 0 --results \$PWD/meta_res
    """
}
