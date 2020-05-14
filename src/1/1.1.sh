#!/bin/bash

printf "Download datasets: \n"

FILE1=data-structure.csv
FILE2=hads2013n_ASCII.zip

if test -f "$FILE1"; then
    echo "$FILE1 exist"
else
    curl -o $FILE1 http://data.gov.ru/sites/default/files/opendata/7107542055-ioszpro/data-2015-03-11T00-00-00-structure-2015-03-11T00-00-00.csv
fi

if test -f "$FILE2"; then
    echo "$FILE2 exist"
else
    curl -o $FILE2 https://www.huduser.gov/portal/datasets/hads/hads2013n_ASCII.zip

    printf "unzip $FILE2 \n"
    unzip -o $FILE2
fi

printf "\n Last 10 rows: \n"
tail -n 10 ../../d/l1.log

printf "\n First 5 rows: \n"
head -n 5 ../../d/l1.log

printf "\n Make dir and split file: \n"
mkdir -p l1
cd l1 
split -l 50 ../../../d/l1.log
ls -la .
cd ..

printf "\n Number of lines in l1.log: "
wc -l ../../d/l1.log
printf "\n Number of words in l1.log: "
wc -w ../../d/l1.log

printf "\n Making graph desc: \n"
awk -f ../../src/csv-to-tree.awk ../../d/tre.csv

printf "\n Saving graph image into graph.jpeg \n\n"
awk -f ../../src/csv-to-tree.awk ../../d/tre.csv | dot -Tjpg > graph.jpeg
