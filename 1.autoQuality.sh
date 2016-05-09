#!/bin/bash
source 0.autonames.sh
cd $out	

while read tests ; do testss=$tests ; done < listdump/file.txt
for ((i=1; i<=$testss; i++))
do
cd $raw1
list=$(cat ../listdump/list.txt | cut -d  " " -f1 | sed -n ''$i'p')

$tools/FastQC/fastqc $list -o ../qb4
$tools/fastx/fastq_quality_trimmer -Q 33 -t 20 -i $list -o qualityTrimmed$list; 
echo "Trimming reads with Fastq Quality Trimer"
cd $raw1
mv qualityTrimmed* ../faout  
$tools/FastQC/fastqc ../faout/qualityTrimmed$list -o ../qaf
done
cd $out
echo first done
./2.automap.sh
