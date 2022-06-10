#!/usr/bin/env bash

wget https://www.ncbi.nlm.nih.gov/geo/download/?acc=GSE145926\&format=file -O GSE145926_RAW.tar

mkdir GSE145926_covid19
tar xvf GSE145926_RAW.tar --directory GSE145926_covid19
rm GSE145926_covid19/*.csv.gz

mv GSE145926_covid19 ../../Resources/data
