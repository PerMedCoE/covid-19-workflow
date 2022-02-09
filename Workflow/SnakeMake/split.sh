#!/bin/bash
cat $1 | sed  "s@../../data@$(readlink -f ../../resources/data)@g"  |  awk  'NR>1 {print  $0  > substr($1,1) ".tsv"}'
sed -i "1 i\\$(head -n 1 $1 )" *.tsv
#mv *.tsv $(dirname $1)
