#!/bin/bash
source 0.autonames.sh
cd $out
cd $faout
ls -1 *.fastq | sort -V | sed 's/^#.*//' > ../listdump/listout.txt
while read tests ; do testss=$tests ; done < ../listdump/file.txt
for ((i=1; i<=$testss; i++))
do 
cd $faout
maps=$(cat ../listdump/listout.txt | cut -d  " " -f1 | sed -n ''$i'p')
nohup $tools/NextGenMap-0.4.12/Cibiv-NextGenMap-ce00bcf/bin/ngm-0.4.12/ngm -q ../faout/$maps -r $refs/converted.fa -b -o ../converted/map$maps.bam --bs-mapping
echo "Mapping Read "$i" with BS converted reference with NextGenMap "




done

cd $con
for fname in *fastq.bam; do
   newname=`echo "$fname" | sed 's/fastq.bam/bam/g'`
   sed 's/fastq.bam/bam/g' "$fname" >"$newname"
done
find . -size 0c -delete
rm *fastq.bam
cd $out
echo second done
./3.autounmappedReads.sh







