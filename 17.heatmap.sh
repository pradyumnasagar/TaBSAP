#!/bin/bash
source 0.autonames.sh

while read gen ; do gee=$gen ; done < listdump/gno.txt
for ((hm=1; hm<=$gee; hm++))
do
heatmap=$(cat listdump/postbiq.txt | cut -d  " " -f1 | sed -n ''$hm'p')
cd $out/heatmap
cp ../heatmap.R heatmap$heatmap.R
sed -i "s/mappp/${heatmap}/g" heatmap$heatmap.R
R < heatmap$heatmap.R --save
cd $out
done
cd $out/heatmap
