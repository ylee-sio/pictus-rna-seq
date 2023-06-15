#!/bin/bash

runid=$1
bedGraphToBigWig bedgraph/"$runid".bg  genome/lp.genome.fna.fai bigwig/"$runid".bw
