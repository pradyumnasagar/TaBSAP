#!/bin/bash
source 0.autonames.sh
#source 13.postbiq.sh

while read gen ; do gee=$gen ; done < listdump/gno.txt
for ((tj=1; tj<=$gee; tj++))
do
  mvbiq=$(cat listdump/postbiq.txt | cut -d  " " -f1 | sed -n ''$tj'p')
  mkdir -p $out/tsv/$mvbiq
  echo $mvbiq
  cd $out/postbiq/$mvbiq
  t=1
  for dir in */;
  do
    cp "$dir"/results.tsv ../../tsv/$mvbiq/result$t.tsv
    ((t++))
  done
  cd $out
done
while read gen ; do gee=$gen ; done < listdump/gno.txt
for ((jj=1; jj<=$gee; jj++))
do
  mbiq=$(cat listdump/postbiq.txt | cut -d  " " -f1 | sed -n ''$jj'p')
  cd $out/tsv/$mbiq
  pwd
  echo $mbiq
  for re in result*
  do
  cat $re | cut -f4 | sed '1d' | sed 's/./&\t/g' > $re.new.tsv
done
cd $out
done
while read gen ; do gee=$gen ; done < listdump/gno.txt
for ((kj=1; kj<=$gee; kj++))
do
  sumbiq=$(cat listdump/postbiq.txt | cut -d  " " -f1 | sed -n ''$kj'p')
  cd $out/tsv/$sumbiq
  ht=1
  for resul in *new.tsv
  do
  awk -f $out/16.percent.sh $resul > sums.$resul
done
((ht++))
cd $out
done
while read gen ; do gee=$gen ; done < listdump/gno.txt
for ((me=1; me<=$gee; me++))
do
  merged=$(cat listdump/postbiq.txt | cut -d  " " -f1 | sed -n ''$me'p')
  cd $out/tsv/$merged
  for FILE in sums*.tsv
  do
    tail -1 $FILE | head -1 >> out.tsv | sed -e's/percent//g' out.tsv > outp.tsv
    sed -e's/^\t//g' outp.tsv > output.tsv
    sed 's/  */	/g' output.tsv  >$merged.tsv
    #awk '($1="")1' OFS="\t" $merged.tsv > tmp.$merged.tsv | mv tmp.$merged.tsv $merged.tsv
    awk 'NR==1{for(i=1; i<=NF; i++) h=h OFS "CpG" i; print h}{$1="sample" NR OFS $1}1' OFS='\t' $merged.tsv > temp.$merged.tsv && mv temp.$merged.tsv $merged.tsv
    cp $merged.tsv $out/heatmap/
  done
  cd $out
done
