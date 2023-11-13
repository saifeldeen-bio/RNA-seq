#!/bin/bash
path=$(pwd)'/'
bamDir='HISAT2-Aligned'
bam=$path$bamDir
GTFname="C_parapsilosis_CDC317_current_features.gtf"
out='Counts'
GTFdir=$path'ref/'$GTFname
outDir=$path$out

mkdir -p $outDir

for bamfile in $(ls $bam | grep ".bam" | cut -d "." -f1 | sort | uniq)
do
bamfile=$(basename $bamfile ".bam")
featureCounts -p -a $GTFdir -o $outDir'/'$bamfile'_out.txt' $bam'/'$bamfile'.bam'
# remove sam and bam files
#rm $sam"/"$samfile".out.sam"
#rm $sam"/"$samfile".bam"

awk '{print $1, $NF}' $outDir'/'$bamfile'_out.txt' > $outDir'/'$bamfile'_count.txt'
done
