#!/bin/bash

source 0.autonames.sh
cd $con
ls -1 *.bam | sort -V | sed 's/^#.*//' > ../listdump/bam.txt
while read tests ; do testss=$tests ; done < ../listdump/file.txt
for ((i=1; i<=$testss; i++))
do
bam=$(cat ../listdump/bam.txt | cut -d  " " -f1 | sed -n ''$i'p')
$tools/samtools-1.2/samtools view -f4 $bam > $bam.unmapped.sam
$tools/samtools-1.2/samtools view -F4 $bam > $bam.mapped.sam
ls -1 *bam | sort -V | sed 's/^#.*//' > ../listdump/pica.txt
pica=$(cat ../listdump/pica.txt | cut -d  " " -f1 | sed -n ''$i'p')
java -jar $tools/picard-tools-1.119/SamToFastq.jar I= $pica.unmapped.sam F= $pica.converted.unmapped.fastq
done

#rm *fastq*
mv $con/*.unmapped.sam $con/unmapped

cd unmapped

for fname in *bam.unmapped.sam; do
   newname=`echo "$fname" | sed 's/bam.unmapped.sam/unmapped.sam/g'`
   sed 's/bam.unmapped.sam/unmapped.sam/g' "$fname" >"$newname"
done
find . -size 0c -delete
rm *bam.unmapped.sam

mv $con/*.mapped.sam $con/mapped
cd ../mapped 
for fname in *bam.mapped.sam; do
   newname=`echo "$fname" | sed 's/bam.mapped.sam/mapped.sam/g'`
   sed 's/bam.mapped.sam/mapped.sam/g' "$fname" >"$newname"
done
find . -size 0c -delete
rm *bam.mapped.sam

cd ..
mv *.fastq $out/unconverted/fastq/
cd $out/unconverted/fastq/
for fname in *bam.converted.unmapped.fastq; do
   newname=`echo "$fname" | sed 's/bam.converted.unmapped.fastq/unmapped.fastq/g'`
   sed 's/bam.converted.unmapped.fastq/unmapped.fastq/g' "$fname" >"$newname"
done
find . -size 0c -delete
rm *bam.converted*
cd $out
echo third done
./4.autounconverted.sh
