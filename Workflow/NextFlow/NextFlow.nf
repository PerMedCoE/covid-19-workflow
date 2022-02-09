
params.input="/path/to/dataset"
params.config="/path/to/conf.yaml"

input_ch = Channel.fromPath(params.input)
conf_ch = Channel.fromPath(params.config)

# TODO: Declare the building blocks to be used as process.

process BUILDINGBLOCK {
    input:
    file dataset from input_ch
    file conf from conf_ch

    output:
    file "output" into res_ch


    # TODO: Change bb to the building block name.
    """
    permedcoe execute building_block bb $dataset output $conf
    """
}