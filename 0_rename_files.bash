#!/bin/bash

## Takes the SRA submitted sequence files from Cushing et al 2015 and changes the reads' names so that both pairs match (have the same name).

while read p; do
    SRA_num=`echo $p | cut -f4 -d ' '`
    patient_day=`echo $p | cut -f5 -d ' '`
    patient_day_read=`echo $p | cut -f6 -d ' '`
    wc ${SRA_num}.fastq 
    less ${SRA_num}.fastq | perl -pe "s,${SRA_num},${patient_day},g" > "${patient_day_read}.fastq"
done < H3N2_day1_manifest.txt
