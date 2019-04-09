#!/bin/bash

source 0.autonames.sh

cd $out/finalFiles

for ((i=1; i<=$testss; i++))
do
  for ((j=1; j<=$gee; j++))
  do
    echo $testss
    cat $i.$j.converted.fa $i.$j.unconverted.fa $i.$j.rcconverted.fa $i.$j.rcunconverted.fa  > $i.$j.merged.fa

  done
  cd $out/finalFiles
  pwd
done
pwd
mv *merged* ../mergedData
cd $out
echo script nine done
./10.autorenameFasta.sh
