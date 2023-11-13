#!/bin/bash
path=$(pwd)'/'
index='ref_index''/'
indexname='Mycobacterium_tuberculosis_H37Rv_genome_v4'
inputreasdspath='trimmed_reads/Paired'
indexDir=$path$index
readsDir=$path$inputreasdspath
GTFdir=$path"ref/"
outDir=$path'HISAT2-Aligned'

mkdir -p $outDir

for sample in $(ls $readsDir | grep "fastq" | cut -d "_" -f1 | sort | uniq)
do
#get sample name
fsample=$(basename $sample "_1_paired.fastq")
rsample=$(basename $sample "_2_paired.fastq")

hisat2 --phred33 --dta -x $indexDir$indexname -1 $readsDir'/'$fsample'_1_paired.fastq' -2 $readsDir'/'$rsample'_2_paired.fastq' -S $fsample'.out.sam'

#mv "Aligned.out.sam" $fsample'.out.sam'
done

mv *.sam $outDir

