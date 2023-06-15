#!/bin/bash

# this script will only need to be run once

# this is a good resource for getting set up with most of what you need to start rna-seq analysis
curl http://data.biostarhandbook.com/install.sh | bash

# the bioinfo env should have all of these
mamba install -y ncbi-datasets-cli gh parallel agat pigz unzip

# creating folders for s1 script
mkdir genome
mkdir transcriptome
mkdir resources
mkdir aligned
mkdir bam
mkdir bedgraph
mkdir bigwig

# Get the assembly report. This contains summaries of all genomes on NCBI. You can use this find information for your species. In our case it will be for Lytechinus pictus.
#wget https://ftp.ncbi.nlm.nih.gov/genomes/ASSEMBLY_REPORTS/assembly_summary_refseq.txt

# follow instructions
gh auth login

mv workflow_setup.sh .workflow_setup.sh
