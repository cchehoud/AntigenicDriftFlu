#!/bin/bash

## Loops over r1 and r2 files and performs an alignment to H3N2 reference genome

## Make BWA database from H3N2 reference genome (genbank: KF848938.1)
bwa index H3N2_HA_reference.fasta

## Uses BWA to align paired reads to H3N2 reference genome
for file in $(ls *_r1.fastq);do
    patient_day=${file%%_r1.fastq};
    bwa mem H3N2_HA_reference.fasta ${patient_day}_r1.fastq ${patient_day}_r2.fastq > ${patient_day}.sam
done


## Converts SAM files into summary statistics files using samtools
bash /home/cchehoud/scripts/SAM_tools.bash *.sam
