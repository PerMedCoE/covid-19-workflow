echo "Installing covid-19-workflow required Building Blocks... Please wait..."

CURRENT_DIR=$(pwd)
# SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

cd ../../BuildingBlocks

cd MaBoSS
./clean.sh
cd ..

cd meta_analysis
./clean.sh
cd ..

cd personalize_patient
./clean.sh
cd ..

cd PhysiBoSS
./clean.sh
cd ..

cd single_cell_processing
./clean.sh
cd ..

cd ${CURRENT_DIR}
