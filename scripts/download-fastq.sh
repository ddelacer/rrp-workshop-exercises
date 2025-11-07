#!/bin/bash

#set error handling for script
set -euo pipefail

#set working directory to where this file lives
cd "$(dirname "${BASH_SOURCE[0]}")"

# "Constant" variables
study_id="SRP255885"
#file name
fastq_url="ftp://ftp.sra.ebi.ac.uk/vol1/fastq/SRR115/089/SRR11518889/"
fastq_r1="SRR11518889_1.fastq.gz"
fastq_r2="SRR11518889_2.fastq.gz"

fastq_dir="../data/raw/fastq/$study_id"

#Create fastq directory
#can make nested directory with p, in one demand, will also error
#if that directory already exists, will be fine if that already 
#exists, it won't overwrite 

mkdir -p $fastq_dir

### Obtain and process the R1 file

echo "Obtaining $fastq_r1"
curl -O $fastq_url/$fastq_r1

#explore how many lines
echo "The number of lines in $fastq_r1 is ....drumroll..."
gunzip -c $fastq_r1 | wc -l 

#move the fastq file to the fastq directory
mv $fastq_r1 $fastq_dir

#now doing r2
echo "Obtaining $fastq_r2"
curl -O $fastq_url/$fastq_r2

#explore how many lines
echo "The number of lines in $fastq_r2 is ....drumroll..."
gunzip -c $fastq_r2 | wc -l

mv $fastq_r2 $fastq_dir



