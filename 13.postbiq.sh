#!/bin/bash
source 0.autonames.sh
cd $out/biqout/
cp ../listdump/genelist.txt ../listdump/postbiq.txt
sed 's/\$r/\n/' ../listdump/postbiq.txt
pwd
while read gen ; do gee=$gen ; done < ../listdump/gno.txt
for ((yj=1; yj<=$gee; yj++))
do
mvbiq=$(cat ../listdump/postbiq.txt | cut -d  " " -f1 | sed -n ''$yj'p')
mkdir -p ../postbiq/$mvbiq
rename $'\r' '' ../postbiq/*
cp -R *$mvbiq*  ../postbiq/$mvbiq/
echo $mvbiq
done
cd $out
./15.resfile.sh
