#!/bin/bash

source 0.autonames.sh
cd $out/unconverted/fastq/

ls -1 *.fastq | sort -V | sed 's/^#.*//' > ../../listdump/ucbam.txt
while read tests ; do testss=$tests ; done < ../../listdump/file.txt
for ((i=1; i<=$testss; i++))
do
ucbam=$(cat ../../listdump/ucbam.txt | cut -d  " " -f1 | sed -n ''$i'p')
echo "mapping unmapped reads to Unconverted reference"
nohup $tools/NextGenMap-0.4.12/Cibiv-NextGenMap-ce00bcf/bin/ngm-0.4.12/ngm -q $out/unconverted/fastq/$ucbam -r $refs/uc.fa -b -o $ucbam.unconverted.bam --bs-mapping

echo "separating unmapped reads"
$tools/samtools-1.2/samtools view -f4 $ucbam.unconverted.bam > $ucbam.unmapped.sam
$tools/samtools-1.2/samtools view -F4 $ucbam.unconverted.bam > $ucbam.mapped.sam
echo "exporting fastq from unmapped files"
java -jar $tools/picard-tools-1.119/SamToFastq.jar I= $ucbam.unmapped.sam F= $ucbam.unconverted.unmapped.fastq

done


mv *.bam $out/unconverted/bam
cd $out/unconverted/bam
for fname in *unmapped.fastq.unconverted.bam; do
   newname=`echo "$fname" | sed 's/unmapped.fastq.unconverted.bam/unconverted.bam/g'`
   sed 's/unmapped.fastq.unconverted.bam/unconverted.bam/g' "$fname" >"$newname"
done
find . -size 0c -delete
rm *unmapped.fastq.unconverted*


cd $out/unconverted/fastq/
mv *.unmapped.sam $out/unconverted/unmapped
cd $out/unconverted/unmapped
for fname in *unmapped.fastq.unmapped.sam; do
   newname=`echo "$fname" | sed 's/unmapped.fastq.unmapped.sam/unmapped.sam/g'`
   sed 's/unmapped.fastq.unmapped.sam/unmapped.sam/g' "$fname" >"$newname"
done
find . -size 0c -delete
rm *unmapped.fastq.unmapped*


cd $out/unconverted/fastq/
mv *.mapped.sam $out/unconverted/mapped
cd $out/unconverted/mapped
for fname in *unmapped.fastq.mapped.sam; do
   newname=`echo "$fname" | sed 's/unmapped.fastq.mapped.sam/mapped.sam/g'`
   sed 's/unmapped.fastq.mapped.sam/mapped.sam/g' "$fname" >"$newname"
done
find . -size 0c -delete
rm *unmapped.fastq.mapped*


cd $out/unconverted/fastq/
mv *unconverted.unmapped.fastq $out/rcconverted/fastq
cd $out/rcconverted/fastq
for fname in *unmapped.fastq.unconverted.unmapped.fastq; do
   newname=`echo "$fname" | sed 's/unmapped.fastq.unconverted.unmapped.fastq/unconverted.unmapped.fastq/g'`
   sed 's/unmapped.fastq.unconverted.unmapped.fastq/unconverted.unmapped.fastq/g' "$fname" >"$newname"
done
find . -size 0c -delete
rm *fastq.unconverted*
cd $out
echo fourth done
./5.autorcconverted.sh
