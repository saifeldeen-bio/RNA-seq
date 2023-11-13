#!/bin/bash
path=$(pwd)'/'
genomeName="Mycobacterium_tuberculosis_H37Rv_genome_v4"
GTF='Mycobacterium_tuberculosis_H37Rv_gff_v4.gtf'
genomeDir="ref"
indexDir='ref_index'
inputDir=$path$genomeDir
outDir=$path$indexDir
sjdbGTFfile=$path$genomeDir'/'$GTF

STAR --runThreadN 2\
 --runMode genomeGenerate\
  --genomeDir $outDir\
   --genomeFastaFiles $inputDir'/'$genomeName".fasta"\
   --sjdbGTFfile $sjdbGTFfile\
   --genomeSAindexNbases 14

