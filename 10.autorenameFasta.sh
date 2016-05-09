#!/bin/bash
source 0.autonames.sh

cd $out/mergedData
for ((io=1; io<=$testss; io++))
do
for ((jo=1; jo<=$gee; jo++))
do
pwd
merg=$(cat ../listdump/genelist.txt | cut -f1 | sed -n ''$jo'p')
cp $io.$jo.merged.fa $out/name/$io.$merg.merged.fa
done
echo copied
done
cd $out/name/
rename $'\r' '' *
echo script ten done