#!/bin/bash
source 0.autonames.sh

while read gen ; do gee=$gen ; done < listdump/gno.txt
for ((hm=1; hm<=$gee; hm++))
do


  cd $out/heatmap
  heatmap=$(cat ../listdump/postbiq.txt | cut -d  " " -f1 | sed -n ''$hm'p')
  totll=$(cat ../listdump/file.txt | cut -d  " " -f1 | sed -n ''1'p')
  yesno=$(cat ../listdump/grpyn.txt | cut -d  " " -f1 | sed -n ''1'p')
  grpname=$(cat ../listdump/grpname.txt | cut -d  " " -f1 | sed -n ''1'p')
  grpnameno=$(cat ../listdump/grpnameno.txt | cut -d  " " -f1 | sed -n ''1'p')




  if echo "$yesno" | grep "y"
  then
    cp ../heatmapcat.R heatmapcat$heatmap.R
    sed -i "s/mappp/${heatmap}/g" heatmapcat$heatmap.R
    sed -i "s/grpname/${grpname}/g" heatmapcat$heatmap.R
    sed -i "s/grpcat/${grpnameno}/g" heatmapcat$heatmap.R
    sed -i "s/totll/${totll}/g" heatmapcat$heatmap.R
    R < heatmapcat$heatmap.R --save



  else
    cp ../heatmap.R heatmap$heatmap.R
    sed -i "s/mappp/${heatmap}/g" heatmap$heatmap.R
    R < heatmap$heatmap.R --save

  fi
done
cd $out
cd $out/heatmap
