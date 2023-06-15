#!/bin/bash

runid=$1
bedtools genomecov -ibam  ~/lp/bam/"$1".bam -split -bg -scale 1 > ~/lp/bedgraph/"$1".bg
