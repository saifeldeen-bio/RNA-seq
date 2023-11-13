#!/bin/bash
path=$(pwd)"/"
rawData="raw_reads"
outDir="trimmed_reads"
PEdir="Paired/"
UPdir="Unpaired"

inputfolder=$path$rawData
outfolder=$path$outDir
#creat out Directory
mkdir -p $outfolder"/"$PEdir $outfolder"/"$UPdir

for sample in $(ls $inputfolder | grep "fastq.gz" | cut -d "_" -f 1 | sort | uniq)
do
#get sample name
fsample=$(basename $sample "_1.fastq.gz")
rsample=$(basename $sample "_2.fastq.gz")

trimmomatic
trimmomatic PE -phred33\
 $inputfolder'/'$fsample"_1.fastq.gz" $inputfolder'/'$rsample"_2.fastq.gz"\
  $outfolder"/"$PEdir'/'$fsample"_1_paired.fastq" $outfolder"/"$UPdir'/'$fsample'_1_unpaired.fastq'\
   $outfolder"/"$PEdir'/'$rsample"_2_paired.fastq" $outfolder"/"$UPdir'/'$rsample'_2_unpaired.fastq'\
    SLIDINGWINDOW:4:25 MINLEN:36
#done

QCtrimDir=$path'QCtrimmDir'
mkdir -p $QCtrimDir
fastqc trimmed_reads/Paired/*.fastq -o $QCtrimDir
multiqc $QCtrimDir'/'
