#!/bin/bash
source 0.autonames.sh
cp ref/uc.fa biqref/ccccc.fa


cd biqref
#echo folder

$tools/fastx/fasta_formatter -i ccccc.fa -o conccc.fa
echo format

awk '/^>/ {OUT=substr($0,2) ".fa"}; OUT {print >OUT}' conccc.fa
#awk '/^>/{s=++d".fa"} {print > s}' uc.fa
echo 'split'

rm ccccc.fa
rm conccc.fa

sed 's/$/.fa/' ../listdump/genelist.txt > ../listdump/biqlist.txt

ls | sed 's/^#.*//' > ../listdump/biqref.txt



 
cd $out
./12.biq.sh
