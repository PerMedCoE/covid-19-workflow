


meta_files=Channel.fromPath("${_DATA_DIR}/small/*")
meta_input=meta_files.map { x -> [x.baseName.split('_')[1],x] }
repetitions=2

ko_ch = Channel.value()


process MaBoSS_analysis {

    output:
    file "ko_file.txt" into ko_ch

    """
    MaBoSS_BB -d -i epithelial_cell_2 ${_DATA_DIR} 1 -o ko_file.txt
    """
}

process single_cell_processing {
    input:
      tuple val(p_id),path(sample_file) from meta_input
    output:
      tuple val("$p_id") , path('result') into single_cell_res

    """
    mkdir result
    single_cell_processing_BB -d -i ${p_id}  C ${sample_file} 1 -o result/norm_data.tsv result/raw_data.tsv result/scaled_data.tsv result/cells_metadata.tsv images
    """
}

process personalize_patient {
    input: 
      tuple val(p_id) , path(res_dir) from single_cell_res
      file ko from ko_ch
    output:
      tuple  val("$p_id"),path("model/*.cfg"),path("model/*.bnd") into models

    """
    personalize_patient_BB -d -i ${res_dir}/norm_data.tsv ${res_dir}/cells_metadata.tsv ${_DATA_DIR}/epithelial_cell_2 Epithelial_cells $ko -o \$PWD/model personal 
    """
} 

process physiboss_model {
    input:
      tuple val(p_id) , path(cfg_file) , path(bnd_file) from models.transpose()
    each rep from 1..repetitions
    output: 
      tuple val("$p_id"),val("$cfg_file.baseName"),val("$rep"),path('result') into physiboss_result 
    """
    PhysiBoSS_BB -d -i $p_id $rep $cfg_file.baseName $bnd_file $cfg_file 1 8640 -o physiboss.out physiboss.err result 
    """

}                                                                                             

