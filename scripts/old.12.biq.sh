#!/bin/bash
source 0.autonames.sh
cd $out/name/
ls *.fa | wc -l | sed 's/^#.*//' > ../listdump/biqno.txt
ls -1 *.fa | sort -V | sed 's/^#.*//' > ../listdump/biq.txt




cd $out/biqref
for biqrefe in *.fa
do
  cd $out
  while read biqno ; do biqnoo=$biqno ; done < listdump/biqno.txt
  for ((ib=1; ib<=$biqnoo; ib++))
  do
    cd $out/name/
    biq=$(cat ../listdump/biq.txt | cut -d  " " -f1 | sed -n ''$ib'p')
    biqref=$(cat ../listdump/biqref.txt | cut -d  " " -f1 | sed -n ''$ib'p')
    cd $out/biqout/

    java -server -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=16 -XX:+AggressiveOpts -Xms12G -Xmx16G -jar  $tools/biqht/BiQ_Analyzer.jar -nogui -rseq $out/biqref/$biqrefe -bseq $out/name/$biq -outdir $out/biqout/$biq

    echo BiQ_Analyzer running done for $biq
  done
done
cd $out
./13postbiq.sh
