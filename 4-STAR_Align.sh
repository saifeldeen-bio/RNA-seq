#!/bin/bash
path=$(pwd)'/'
index='ref_index/'
GTFname='Mycobacterium_tuberculosis_H37Rv_gff_v4'
inputreasdspath='trimmed_reads/Paired'
indexDir=$path$index
readsDir=$path$inputreasdspath
GTFdir=$path"ref/"
outDir=$path'STAR-Aligned'

mkdir -p $outDir

for sample in $(ls $readsDir | grep "fastq" | cut -d "_" -f1 | sort | uniq)
do
#get sample name
fsample=$(basename $sample "_1_paired.fastq")
rsample=$(basename $sample "_2_paired.fastq")

STAR --runThreadN 2\
 --genomeDir $indexDir\
  --sjdbGTFfile $GTFdir$GTFname".gtf"\
   --readFilesIn $readsDir'/'$fsample'_1_paired.fastq' $readsDir'/'$rsample'_2_paired.fastq'\
    #if your reads are in gz format
    #--readFilesCommand zcat\
     --outSAMtype BAM SortedByCoordinate\
      --limitBAMsortRAM 3000000000\
       --quantMode GeneCounts

mv "Aligned.out.sam" $fsample'.out.sam'
done

mv *.sam $outDir
mv *.out $outDir
mv *.tab $outDir
