#!/bin/bash
source 0.autonames.sh
cp ref/converted.fa biqref/ccccc.fa


cd biqref
#echo folder

$tools/fastx/fasta_formatter -i ccccc.fa -o conccc.fa
echo format

awk '/^>/ {OUT=substr($0,2) ".fa"}; OUT {print >OUT}' conccc.fa
#awk '/^>/{s=++d".fa"} {print > s}' uc.fa
echo 'split'

rm ccccc.fa
rm conccc.fa
echo 'remove'

#while read name ; do names=$name ; done < ../listdump/genelist.txt
#for ((i=1; i<=$names; i++))
#do
#bref=$(cat ../listdump/genelist.txt | cut -d  " " -f1 | sed -n ''$i'p')
#mv * $bref.fa
#done



#yes '.fa' | sed $(wc -l < ../listdump/biqlist.txt)q | paste '' ../listdump/biqlist.txt -
sed 's/$/.fa/' ../listdump/genelist.txt > ../listdump/biqlist.txt
#awk '{print $0, ".fa"}' listdump/genelist.txt > listdump/biqlist.txt
echo listappend
for file in *.fa; do read line;  mv -v "${file}" "${line}";  done < ../listdump/biqlist.txt
rename $'\r' '' *
echo done
#./12.biq.sh
#for file in *.fa; do read line;  mv -v "${file}" "${line}"; done
ls | sed 's/^#.*//' > ../listdump/biqref.txt




#echo split list 

#biqsplit=$(cat ../listdump/biqsplit.txt | cut -d  " " -f1 | sed -n ''1'p')
#echo variable

#cat $biqsplit | grep '>' $biqsplit > ../listdump/biqlist.txt

#awk '{gsub(">", "");print}' ../listdump/biqlist.txt  > ../listdump/biqlist.txt
 
cd $out
./12.biq.sh
