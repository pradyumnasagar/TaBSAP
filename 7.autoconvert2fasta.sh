#!/bin/bash

source 0.autonames.sh


######## converted
cd $out/converted/mapped
ls -1 *.sam |sort -V | sed 's/^#.*//' > ../../listdump/cm.txt
ls *.sam | wc -l | sed 's/^#.*//' > ../../listdump/no3.txt
while read no3 ; do num3=$no3 ; done < ../../listdump/no3.txt                           
for ((i=1; i<=$num3; i++))
do
cm=$(cat ../../listdump/cm.txt | cut -d  " " -f1 | sed -n ''$i'p')
awk '{gsub(".mapped.sam", "");print}' ../../listdump/cm.txt  > ../../listdump/cm1.txt

cm1=$(cat ../../listdump/cm1.txt | cut -d  " " -f1 | sed -n ''$i'p')
mkdir -p $out/converted/mapped/$cm1
cat $cm | awk '{OFS="\t"; print ">"$3"\n"$10}' > $cm1.converted.mapped.fasta

mv *$cm1.converted.mapped.fasta $cm1
done


########################## unconverted
cd $out/unconverted/mapped

ls -1 *.sam | sort -V | sed 's/^#.*//' > ../../listdump/um.txt
ls *.sam | wc -l | sed 's/^#.*//' > ../../listdump/no2.txt
while read no2 ; do num2=$no2 ; done < ../../listdump/no2.txt
for ((i=1; i<=$num2; i++))
do
um=$(cat ../../listdump/um.txt | cut -d  " " -f1 | sed -n ''$i'p')
awk '{gsub(".mapped.sam", "");print}' ../../listdump/um.txt  > ../../listdump/um1.txt
um1=$(cat ../../listdump/um1.txt | cut -d  " " -f1 | sed -n ''$i'p')
mkdir -p $out/converted/mapped/$um1

cat $um | awk '{OFS="\t"; print ">"$3"\n"$10}' > $um1.converted.mapped.fasta

mkdir -p $out/unconverted/mapped/$um1

cat $um | awk '{OFS="\t"; print ">"$3"\n"$10}' > $um1.unconverted.mapped.fasta

mv $um1.unconverted.mapped.fasta $um1

done

########################## rcconverted




cd $out/rcconverted/mapped
ls -1 *.sam | sort -V | sed 's/^#.*//' > ../../listdump/rcc.txt
ls *.sam | wc -l | sed 's/^#.*//' > ../../listdump/no1.txt
while read no1 ; do num1=$no1 ; done < ../../listdump/no1.txt
for ((i=1; i<=$num1; i++))
do
rcc=$(cat ../../listdump/rcc.txt | cut -d  " " -f1 | sed -n ''$i'p')
awk '{gsub(".mapped.sam", "");print}' ../../listdump/rcc.txt  > ../../listdump/rcc1.txt
rcc1=$(cat ../../listdump/rcc1.txt | cut -d  " " -f1 | sed -n ''$i'p')
mkdir -p $out/rcconverted/mapped/$rcc1

cat $rcc | awk '{OFS="\t"; print ">"$3"\n"$10}' > $rcc1.rcconverted.mapped.fasta
$tools/fastx/fastx_reverse_complement -i $rcc1.rcconverted.mapped.fasta -o $rcc1.rcconverted.complement.mapped.fasta

mv $rcc1.rcconverted.complement.mapped.fasta $rcc1

done

######################## rcunconverted

cd $out/rcunconverted/mapped
ls -1 *.sam | sort -V | sed 's/^#.*//' > ../../listdump/rcuc.txt
ls *.sam | wc -l | sed 's/^#.*//' > ../../listdump/no.txt
while read no ; do num=$no ; done < ../../listdump/no.txt
for ((i=1; i<=num; i++))
do

rcuc=$(cat ../../listdump/rcuc.txt | cut -d  " " -f1 | sed -n ''$i'p')
awk '{gsub(".mapped.sam", "");print}' ../../listdump/rcuc.txt  > ../../listdump/rcuc1.txt

rcuc1=$(cat ../../listdump/rcuc1.txt | cut -d  " " -f1 | sed -n ''$i'p')
mkdir -p $out/rcunconverted/mapped/$rcuc1

cat $rcuc | awk '{OFS="\t"; print ">"$3"\n"$10}' > $rcuc1.rcunconverted.mapped.fasta
$tools/fastx/fastx_reverse_complement -i $rcuc1.rcunconverted.mapped.fasta -o $rcuc1.rcunconverted.complement.mapped.fasta

mv $rcuc1.rcunconverted.complement.mapped.fasta $rcuc1

done




cd $out 
echo seventh done
./8.autoextractGeneFasta.sh
