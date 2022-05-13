#!/usr/bin/env nextflow
nextflow.enable.dsl=2

params.repetitions=2
params.data_dir="${_DATA_DIR}"
params.max_time=100
params.physiboss_cpus=1
params.single_cell_cpus=1
params.maboss_cpus=1
params.model_prefix="epithelial_cell_2"
params.cell_type="Epithelial_cells"
params.meta_file="${params.data_dir}/metadata_small.tsv"

meta_input=Channel.fromPath("${params.meta_file}")


workflow {

    MaBoSS_analysis()

    // 
    tsv_to_csv(meta_input).splitCsv(header: true).map { row -> ["${row.id}","${row.group}", "${row.file}".replaceAll(/.*data/,"${params.data_dir}")  ] } | single_cell_processing

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
    MaBoSS_BB -d -i epithelial_cell_2 ${params.data_dir} ${task.cpus} -o ko_file.txt
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
    single_cell_processing_BB -d -i ${p_id}  ${group} ${sample_file} ${task.cpus} -o result/norm_data.tsv result/raw_data.tsv result/scaled_data.tsv result/cells_metadata.tsv images
    """
}

process personalize_patient {
    input: 
      tuple val(p_id) , path(res_dir) 
      file ko 
    output:
      tuple  val("$p_id"),path("model/*.cfg"),path("model/*.bnd")

    """
    personalize_patient_BB -d -i ${res_dir}/norm_data.tsv ${res_dir}/cells_metadata.tsv ${params.data_dir}/${params.model_prefix} ${params.cell_type} $ko -o \$PWD/model personal 
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
    PhysiBoSS_BB -d -i $p_id $rep $cfg_file.baseName $bnd_file $cfg_file ${task.cpus} ${params.max_time} -o physiboss.out physiboss.err  \$PWD/${p_id}_${cfg_file.baseName}_physiboss_run_${rep}
    """

}                                                                                             

process meta_analysis {
    input: 
      path physiboss_res  
      file ko 
    output:
      path('results')

    // Nextflow makes it a bit hard to pass around directory structures
    // So we need to move around some things.
    """
    ids=(\$(ls -1 | grep epithelial_cell_2 | cut -d '_' -f1 | sort | uniq ))
    for i in "\${ids[@]}"; do
        mkdir -p \$i/physiboss_results
        mv \${i}_* \$i/physiboss_results
        rename \${i}_ "" \$i/physiboss_results/*
    done
    meta_analysis_BB -d -i $params.meta_file \$PWD ${params.model_prefix} $ko $params.repetitions 0 -o \$PWD/results
    """
}
