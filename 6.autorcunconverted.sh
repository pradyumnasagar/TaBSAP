#!/bin/bash

source 0.autonames.sh
cd $out/rcunconverted/fastq

ls -1 *.fastq | sort -V | sed 's/^#.*//' > ../../listdump/rcuc.txt
ls  *.fastq | wc -l | sed 's/^#.*//' > ../../listdump/rcucno.txt

while read rcucnoo ; do rcucno=$rcucnoo ; done < ../../listdump/rcucno.txt                             
for ((i=1; i<=$rcucno; i++))
do
rcuc=$(cat ../../listdump/rcuc.txt | cut -d  " " -f1 | sed -n ''$i'p')

nohup $tools/NextGenMap-0.4.12/Cibiv-NextGenMap-ce00bcf/bin/ngm-0.4.12/ngm -q $out/rcunconverted/fastq/$rcuc -r $refs/rcuc.fa -b -o $rcuc.rcunconverted.bam --bs-mapping

$tools/samtools-1.2/samtools view -f4 $rcuc.rcunconverted.bam > $rcuc.unmapped.sam
$tools/samtools-1.2/samtools view -F4 $rcuc.rcunconverted.bam > $rcuc.mapped.sam
nohup java -jar $tools/picard-tools-1.119/SamToFastq.jar I= $rcuc.unmapped.sam F= $rcuc.rcunconverted.unmapped.fastq
done





mv *.bam $out/rcunconverted/bam
cd $out/rcunconverted/bam
for fname in *rcconverted.unmapped.fastq.rcunconverted.bam; do
   newname=`echo "$fname" | sed 's/rcconverted.unmapped.fastq.rcunconverted.bam/rcunconverted.bam/g'`
   sed 's/rcconverted.unmapped.fastq.rcunconverted.bam/rcunconverted.bam/g' "$fname" >"$newname"
done
rm *rcconverted.unmapped.fastq.rcunconverted.bam
find . -size 0c -delete


cd ../fastq
mv *.unmapped.sam $out/rcunconverted/unmapped
cd $out/rcunconverted/unmapped
for fname in *rcconverted.unmapped.fastq.unmapped.sam; do
   newname=`echo "$fname" | sed 's/rcconverted.unmapped.fastq.unmapped.sam/unmapped.sam/g'`
   sed 's/rcconverted.unmapped.fastq.unmapped.sam/unmapped.sam/g' "$fname" >"$newname"
done
rm *rcconverted.unmapped.fastq.unmapped.sam
find . -size 0c -delete



cd ../fastq
mv *.mapped.sam $out/rcunconverted/mapped
cd $out/rcunconverted/mapped
for fname in *rcconverted.unmapped.fastq.mapped.sam; do
   newname=`echo "$fname" | sed 's/rcconverted.unmapped.fastq.mapped.sam/mapped.sam/g'`
   sed 's/rcconverted.unmapped.fastq.mapped.sam/mapped.sam/g' "$fname" >"$newname"
done
rm *rcconverted.unmapped.fastq.mapped.sam
find . -size 0c -delete




cd ../fastq
mv *fastq.rcunconverted.unmapped.fastq $out/rcunconverted/finalUnmapped
cd $out/rcunconverted/finalUnmapped
for fname in *rcconverted.unmapped.fastq.rcunconverted.unmapped.fastq; do
   newname=`echo "$fname" | sed 's/rcconverted.unmapped.fastq.rcunconverted.unmapped.fastq/rcunconverted.unmapped.fastq/g'`
   sed 's/rcconverted.unmapped.fastq.rcunconverted.unmapped.fastq/rcunconverted.unmapped.fastq/g' "$fname" >"$newname"
done
rm *rcconverted.unmapped.fastq.rcunconverted.unmapped.fastq
find . -size 0c -delete

cd $out
echo sixth done
./7.autoconvert2fasta.sh


