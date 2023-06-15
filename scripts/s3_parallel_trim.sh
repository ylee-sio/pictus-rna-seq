#!/bin/bash

# list of SRR run ids. in our case it will be in ~/lp/resources/runids.txt
# hardcoded fastp_trim.sh for 12 threads 

runids=$1
cat "$1" | parallel -j 2 "bash fastp_trim.sh {}"
