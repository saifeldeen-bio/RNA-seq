#!/bin/bash
path=$(pwd)'/'
alignedreads='HISAT2-Aligned'
sam=$path$alignedreads

for samfile in $(ls $sam | grep ".sam" | cut -d "." -f1 | sort | uniq)
do
samfile=$(basename $samfile ".out.sam")
# convert sam to bam by view and sort by samtools
samtools view -bS $sam"/"$samfile".out.sam" > $sam"/"$samfile".bam"
# sort the bam file
samtools sort $sam"/"$samfile".bam" -o $sam"/"$samfile"_sorted.bam"
# index the bam file
samtools index $sam"/"$samfile"_sorted.bam"
# remove sam and bam files
rm $sam"/"$samfile".out.sam"
rm $sam"/"$samfile".bam"
done
