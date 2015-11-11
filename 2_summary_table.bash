#!/bin/bash

echo -e "Sample\tTotal_Reads\tTotal_Matched_Reads\tMismatched_Reads\tFraction_Matched_Reads"

for file in $(ls *idxstats.tsv); do
    patient_day=${file%%.idxstats.tsv}; 
    matched_paired_reads=`grep '563408512' $file | cut -f3`
    matched_single_reads=`grep '563408512' $file | cut -f4`
    unmatched_reads=`grep '*' $file | cut -f4`
    total_reads=`echo "$matched_paired_reads + $matched_paired_reads + $matched_single_reads + $unmatched_reads" | bc`
    total_matched_reads=`echo "$matched_paired_reads + $matched_paired_reads + $matched_single_reads" | bc`
    fraction_matched=`echo "scale=4; $total_matched_reads / $total_reads" | bc`
    echo -e "$patient_day\t$total_reads\t$total_matched_reads\t$unmatched_reads\t$fraction_matched"
done
