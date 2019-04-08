#!/bin/bash

source 0.autonames.sh
cd $out
######## converted
cd $out/converted/mapped
while read no3 ; do num3=$no3 ; done < ../../listdump/no3.txt 
for ((m=1; m<=$num3; m++))
do
echo step one
cm1=$(cat ../../listdump/cm1.txt | cut -d  " " -f1 | sed -n ''$m'p')

cd $out/converted/mapped
#for ((i=1; i<=$testss; i++))
#do
cd $out/converted/mapped/$cm1
for ((jm=1; jm<=$gee; jm++))
do 
$tools/faSomeRecords  $cm1.converted.mapped.fasta $out/genelist/$jm.txt $out/finalFiles/$m.$jm.converted.fa
#done
done
cd $out/converted/mapped
done



######## unconverted
cd $out/unconverted/mapped
while read no2 ; do num2=$no2 ; done < ../../listdump/no2.txt
for ((k=1; k<=$num2; k++))
do
echo step two
um1=$(cat ../../listdump/um1.txt | cut -d  " " -f1 | sed -n ''$k'p')
cd $out/unconverted/mapped
echo $um1
#for ((i=1; i<=$testss; i++))

#do

cd $out/unconverted/mapped/$um1

for ((ju=1; ju<=$gee; ju++))
do
$tools/faSomeRecords $um1.unconverted.mapped.fasta $out/genelist/$ju.txt $out/finalFiles/$k.$ju.unconverted.fa
#done
done
cd $out/unconverted/mapped
done
######## rcconverted
cd $out/rcconverted/mapped
while read no1 ; do num1=$no1 ; done < ../../listdump/no1.txt
for ((l=1; l<=$num1; l++))
do
pwd
rcc1=$(cat ../../listdump/rcc1.txt | cut -d  " " -f1 | sed -n ''$l'p')

cd $out/rcconverted/mapped

#for ((i=1; i<=$testss; i++))

#do

cd $out/rcconverted/mapped/$rcc1

for ((j=1; j<=$gee; j++))
do
$tools/faSomeRecords $rcc1.rcconverted.complement.mapped.fasta $out/genelist/$j.txt $out/finalFiles/$l.$j.rcconverted.fa
#done

done
cd $out/rcconverted/mapped
done

######## rcconverted
cd $out/rcunconverted/mapped
while read no ; do num=$no ; done < ../../listdump/no.txt
for ((n=1; n<=num; n++))
do
pwd
rcuc1=$(cat ../../listdump/rcuc1.txt | cut -d  " " -f1 | sed -n ''$n'p')


cd $out/rcunconverted/mapped

#for ((i=1; i<=$testss; i++))

#do

cd $out/rcunconverted/mapped/$rcuc1

for ((j=1; j<=$gee; j++))
do
$tools/faSomeRecords $rcuc1.rcunconverted.complement.mapped.fasta $out/genelist/$j.txt $out/finalFiles/$n.$j.rcunconverted.fa
#done
done
cd $out/rcunconverted/mapped
done


cd $out
echo eighth done 
./9.automergeFasta.sh
