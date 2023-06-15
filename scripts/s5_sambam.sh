#!/bin/bash

runid=$1
nthreads=$2

samtools sort -@ "$nthreads" -o ~/lp/bam/"$1".bam ~/lp/aligned/"$1".sam
samtools index -@ "$nthreads" ~/lp/bam/"$1".bam ~/lp/bam/"$1".bam.bai
pigz -5 -p "$nthreads" ~/lp/aligned/"$1".sam
