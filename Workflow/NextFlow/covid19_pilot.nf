#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.physiboss_cpus=1
params.single_cell_cpus=1
params.maboss_cpus=1


meta_input=Channel.fromPath("${params.meta_file}")


workflow {
    scRNA_counts=tsv_to_csv(meta_input).splitCsv(header: true).map { row -> ["${row.id}","${row.group}", "${row.file}".replaceAll(/.*data/,"${params.data_dir}")  ] }
    MaBoSS_analysis()

    // 
    scRNA_counts | single_cell_processing

    personalize_patient(single_cell_processing.out, MaBoSS_analysis.out)

    physiboss_model(personalize_patient.out.transpose(),Channel.of(1..params.repetitions))

    meta_analysis(physiboss_model.out.collect(),MaBoSS_analysis.out)
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
    MaBoSS_BB -d --model epithelial_cell_2 --data_folder ${params.data_dir} --parallel ${task.cpus} --ko_file ko_file.txt
    """
}

process single_cell_processing {
    cpus="$params.single_cell_cpus" 
    input:
      tuple val(p_id),val(group),path(sample_file) 
    output:
      tuple val("$p_id") , path('result') 

    """
    mkdir result
    single_cell_processing_BB -d --p_id ${p_id} --p_group ${group} --p_file ${sample_file} --parallelize ${task.cpus} --norm_data result/norm_data.tsv --raw_data result/raw_data.tsv --scaled_data result/scaled_data.tsv --cells_metadata result/cells_metadata.tsv --outdir images
    """
}

process personalize_patient {
    input: 
      tuple val(p_id) , path(res_dir) 
      file ko 
    output:
      tuple  val("$p_id"),path("model/*.cfg"),path("model/*.bnd")

    """
    personalize_patient_BB -d --norm_data ${res_dir}/norm_data.tsv --cells ${res_dir}/cells_metadata.tsv --model_prefix ${params.model_prefix} --t ${params.cell_type} --ko $ko --model_output_dir \$PWD/model --personalized_result personal 
    """
} 

process physiboss_model {
    cpus="${params.physiboss_cpus}"
    input:
      tuple val(p_id) , path(cfg_file) , path(bnd_file)
      each rep
    output: 
      path("${p_id}_${cfg_file.baseName}_physiboss_run_${rep}") 
    """
    PhysiBoSS_BB -d --sample $p_id --repetition $rep --prefix $cfg_file.baseName --bnd_file $bnd_file --cfg_file $cfg_file --parallel ${task.cpus} --max_time ${params.max_time} --out_file physiboss.out --err_file physiboss.err --results_dir \$PWD/${p_id}_${cfg_file.baseName}_physiboss_run_${rep}
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
    done

    meta_analysis_BB -d --meta_file $params.meta_file --out_dir \$PWD --model_prefix ${params.model_name} --ko_file $ko --reps $params.repetitions --verbose 0 --results \$PWD/meta_res
    """
}
