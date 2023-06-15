#!/bin/bash

accession=$1
fastp --in1 "$accession"_1.fastq.gz --in2 "$accession"_2.fastq.gz\
 --out1 "$accession"_1.trimmed.fastq.gz --out2 "$accession"_2.trimmed.fastq.gz\
 -w 12 -l 60 -q 30\
 --dedup --cut_front --dont_overwrite --detect_adapter_for_pe --trim_poly_g --trim_poly_x  --overrepresentation_analysis\
 -h "$accession.trimmed".html -j "$accession.trimmed".json --report_title "$accession Trimmed fastqc Report" &> "$accession.trimmed".log



