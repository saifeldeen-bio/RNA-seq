#!/bin/bash
path=$(pwd)'/'
genomeName="Mycobacterium_tuberculosis_H37Rv_genome_v4"
GTF='Mycobacterium_tuberculosis_H37Rv_gff_v4.gtf'
genomeDir="ref"
indexDir='ref_index'
inputDir=$path$genomeDir
outDir=$path$indexDir
sjdbGTFfile=$path$genomeDir'/'$GTF

mkdir -p $outDir
# extract exons
hisat2_extract_exons.py $sjdbGTFfile > $inputDir'/'$genomeName'.exon'

# extract splice sites
hisat2_extract_splice_sites.py $sjdbGTFfile > $inputDir'/'$genomeName'.ss'

exon=$inputDir'/'$genomeName'.exon'
spliceSites=$inputDir'/'$genomeName'.ss'

#index
hisat2-build --exon $exon\
 --ss $spliceSites\
  $inputDir'/'$genomeName".fasta"\
   $genomeName


#index without GTF
#hisat2-build -f $inputDir'/'$genomeName".fasta" $genomeName

mv *.ht2 $indexDir'/'
