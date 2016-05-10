#!/bin/bash

source 0.autonames.sh
cd $out/rcconverted/fastq

ls -1 *.fastq | sort -V | sed 's/^#.*//' > ../../listdump/crcbam.txt
ls *.fastq | wc -l | sed 's/^#.*//' > ../../listdump/rcno.txt

while read rccnoo ; do rccno=$rccnoo ; done < ../../listdump/rcno.txt
for ((i=1; i<=$rccno; i++))
do
crcbam=$(cat ../../listdump/crcbam.txt | cut -d  " " -f1 | sed -n ''$i'p')
cd $out/rcconverted/fastq

nohup $tools/NextGenMap-0.4.12/Cibiv-NextGenMap-ce00bcf/bin/ngm-0.4.12/ngm -q $out/rcconverted/fastq/$crcbam -r $refs/rcc.fa -b -o $crcbam.rcconverted.bam --bs-mapping

$tools/samtools-1.2/samtools view -f4 $crcbam.rcconverted.bam > $crcbam.unmapped.sam
$tools/samtools-1.2/samtools view -F4 $crcbam.rcconverted.bam > $crcbam.mapped.sam
nohup java -jar $tools/picard-tools-1.119/SamToFastq.jar I= $crcbam.unmapped.sam F= $crcbam.rcconverted.unmapped.fastq
done


mv *.bam $out/rcconverted/bam
cd $out/rcconverted/bam
for fname in *unconverted.unmapped.fastq.rcconverted.bam; do
   newname=`echo "$fname" | sed 's/unconverted.unmapped.fastq.rcconverted.bam/rcconverted.bam/g'`
   sed 's/unconverted.unmapped.fastq.rcconverted.bam/rcconverted.bam/g' "$fname" >"$newname"
done
rm *unconverted.unmapped.fastq.rcconverted.bam
find . -size 0c -delete


cd ../fastq
mv *.unmapped.sam $out/rcconverted/unmapped
cd $out/rcconverted/unmapped
for fname in *unconverted.unmapped.fastq.unmapped.sam; do
   newname=`echo "$fname" | sed 's/unconverted.unmapped.fastq.unmapped.sam/unmapped.sam/g'`
   sed 's/unconverted.unmapped.fastq.unmapped.sam/unmapped.sam/g' "$fname" >"$newname"
done
rm *unconverted.unmapped.fastq.unmapped.sam
find . -size 0c -delete




cd ../fastq


mv *.mapped.sam $out/rcconverted/mapped
cd $out/rcconverted/mapped
for fname in *unconverted.unmapped.fastq.mapped.sam; do
   newname=`echo "$fname" | sed 's/unconverted.unmapped.fastq.mapped.sam/mapped.sam/g'`
   sed 's/unconverted.unmapped.fastq.mapped.sam/mapped.sam/g' "$fname" >"$newname"
done
rm *unconverted.unmapped.fastq.mapped.sam
find . -size 0c -delete


cd ../fastq

mv *.rcconverted.unmapped.fastq $out/rcunconverted/fastq
cd $out/rcunconverted/fastq

for fname in *unconverted.unmapped.fastq.rcconverted.unmapped.fastq; do
   newname=`echo "$fname" | sed 's/unconverted.unmapped.fastq.rcconverted.unmapped.fastq/rcconverted.unmapped.fastq/g'`
   sed 's/unconverted.unmapped.fastq.rcconverted.unmapped.fastq/rcconverted.unmapped.fastq/g' "$fname" >"$newname"
done
rm *unconverted.unmapped.fastq.rcconverted.unmapped.fastq
find . -size 0c -delete

echo fifth done
cd $out
./6.autorcunconverted.sh
