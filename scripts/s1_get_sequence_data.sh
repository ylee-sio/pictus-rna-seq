#!/bin/bash

# download genome data for Lytechinus pictus and organize ref genome dir
mkdir ~/lp/genome/resources
datasets download genome accession GCF_015342785.2 --include gff3,rna,cds,protein,genome,seq-report --filename ~/lp/genome/GCF_015342785.2.zip
unzip ~/lp/genome/GCF_015342785.2.zip
mv ~/lp/genome/ncbi_dataset/data/GCF_015342785.2/GCF_015342785.2_UCSD_Lpic_2.1_genomic.fna ~/lp/genome
mv ~/lp/genome/GCF_015342785.2.zip ~/lp/genome/resources
mv ~/lp/genome/ncbi_dataset ~/lp/genome/resources
mv ~/lp/genome/README.md ~/lp/genome/resources
wget https://ftp.ncbi.nlm.nih.gov/genomes/all/GCF/015/342/785/GCF_015342785.2_UCSD_Lpic_2.1/GCF_015342785.2_UCSD_Lpic_2.1_genomic.gtf.gz -O ~/lp/genome/genomic.gtf.gz

#rename genome files for basename consistency
mv ~/lp/genome/GCF_015342785.2_UCSD_Lpic_2.1_genomic.fna ~/lp.genome.fna
mv ~/lp/genome/genomic.gtf.gz ~/lp/genome/lp.genome.gtf

# these are the steps taken to obtain L. pictus transcript data available on ncbi as of June 2023
esearch -db sra -query PRJNA952574 | efetch -format runinfo > ~/lp/resources/runinfo.csv
cat ~/lp/resources/runinfo.csv | cut -f 1 -d ',' | grep SRR > ~/lp/resources/runids.txt
cat ~/lp/resources/runids.txt | parallel fastq-dump --split-files --outdir ~/lp/transcriptome {}
pigz -5 -p 24 -r ~/lp/transcriptome

