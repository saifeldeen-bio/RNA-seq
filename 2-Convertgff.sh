#!/bin/bash
path=$(pwd)'/'
gffName="C_parapsilosis_CDC317_current_features"
gffDir="ref"
inputDir=$path$gffDir


gffread $inputDir"/"$gffName".gff" -T\
 -o $inputDir"/"$gffName".gtf"

