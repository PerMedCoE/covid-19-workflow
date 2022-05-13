
nextflow.enable.dsl=2

meta_files=Channel.fromPath("${_DATA_DIR}/small/*")
repetitions=4

workflow {
    MaBoSS_analysis()
    meta_files.map { x -> [x.baseName.split('_')[1],x] } | single_cell_processing
    personalize_patient(single_cell_processing.out, MaBoSS_analysis.out)
    physiboss_model(personalize_patient.out.transpose(),Channel.of(1..repetitions))
    meta_analysis(physiboss_model.out.collect(),MaBoSS_analysis.out)
}

process MaBoSS_analysis {

    output:
    file "ko_file.txt" 

    """
    MaBoSS_BB -d -i epithelial_cell_2 ${_DATA_DIR} 1 -o ko_file.txt
    """
}

process single_cell_processing {
    input:
      tuple val(p_id),path(sample_file) 
    output:
      tuple val("$p_id") , path('result') 

    """
    mkdir result
    single_cell_processing_BB -d -i ${p_id}  C ${sample_file} 1 -o result/norm_data.tsv result/raw_data.tsv result/scaled_data.tsv result/cells_metadata.tsv images
    """
}

process personalize_patient {
    input: 
      tuple val(p_id) , path(res_dir) 
      file ko 
    output:
      tuple  val("$p_id"),path("model/*.cfg"),path("model/*.bnd")

    """
    personalize_patient_BB -d -i ${res_dir}/norm_data.tsv ${res_dir}/cells_metadata.tsv ${_DATA_DIR}/epithelial_cell_2 Epithelial_cells $ko -o \$PWD/model personal 
    """
} 

process physiboss_model {
    cpus=10
    input:
      tuple val(p_id) , path(cfg_file) , path(bnd_file)
      each rep
    output: 
      path("${p_id}_${cfg_file.baseName}_physiboss_run_${rep}") 
    """
    PhysiBoSS_BB -d -i $p_id $rep $cfg_file.baseName $bnd_file $cfg_file ${task.cpus} 8000 -o physiboss.out physiboss.err  \$PWD/${p_id}_${cfg_file.baseName}_physiboss_run_${rep}
    """

}                                                                                             

process meta_analysis {
    input: 
      path physiboss_res  
      file ko 
    output:
      path('results')
    """
    ids=(\$(ls -1 | grep epithelial_cell_2 | cut -d '_' -f1 | sort | uniq ))
    for i in "\${ids[@]}"; do
        mkdir -p \$i/physiboss_results
        mv \${i}_* \$i/physiboss_results
        rename \${i}_ "" \$i/physiboss_results/*
    done
    meta_analysis_BB -d -i $_DATA_DIR/metadata_small.tsv \$PWD epithelial_cell_2 $ko $repetitions 0 -o \$PWD/results
    """
}
