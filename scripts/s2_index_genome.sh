#!/bin/bash

# splice aware indexing of reference transcriptome. this take a lot of memory. will replace this comment with actual metrics

# convert gff to gtf
agat_convert_sp_gff2gtf.pl --gff genome.gff -o lp.genome.gtf

# exon coordinates
hisat2_extract_exons.py lp.genome.gtf > lp.genome.exon

# splice site coordinates
hisat2_extract_splice_sites.py lp.genome.gtf > lp.genome.ss

# index building with splice sites
hisat2-build -p 18 --exon $d1/lp.genome.exon --ss $d1/lp.genome.ss lp.genome.fna lp.genome
