#!/bin/bash

runid=$1

hisat2 --phred33 --dta -x ~/lp/genome/lp.genome\
   --known-splicesite-infile ~/lp/genome/lp.genome.ss\
   -k 10 --summary-file ~/lp/aligned/"$1"_summary -p 12 --time\
   -1 ~/lp/transcriptome/"$1"_1.trimmed.fastq.gz -2 ~/lp/transcriptome/"$1"_2.trimmed.fastq.gz -S ~/lp/aligned/"$1".sam
