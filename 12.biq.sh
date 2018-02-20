#!/bin/bash
source 0.autonames.sh
cd $out/name/
ls *.fa | wc -l | sed 's/^#.*//' > ../listdump/biqno.txt
ls -1 *.fa | sort -V | sed 's/^#.*//' > ../listdump/biq.txt
cd $out/listdump/
sed "s/^[0-9][0-9]*\.//g" biq.txt | sed "s/.merged//g" > biref.txt
#cat obbbbb.txt
cd $out/biqref

cd $out	
while read biqno ; do biqnoo=$biqno ; done < listdump/biqno.txt
for ((ib=1; ib<=$biqnoo; ib++))
do
cd $out/name/
biq=$(cat ../listdump/biq.txt | cut -d  " " -f1 | sed -n ''$ib'p')
biqref=$(cat ../listdump/biref.txt | cut -d  " " -f1 | sed -n ''$ib'p')
cd $out/biqref/
 
java -jar -Xms1g -Xmx"$java_mem"g  $tools/biqht/BiQ_Analyzer.jar -nogui -rseq $out/biqref/$biqref -bseq $out/name/$biq -outdir $out/biqout/$biq 

#java -server -XX:+UseConcMarkSweepGC -XX:+UseParNewGC -XX:+CMSIncrementalPacing -XX:ParallelGCThreads=16 -XX:+AggressiveOpts -Xms12G -Xmx16G -jar  $tools/biqht/BiQ_Analyzer.jar -nogui -rseq $out/biqref/$biqref -bseq $out/name/$biq -outdir $out/biqout/$biq

echo BiQ_Analyzer running done for $biq
done
#done
cd $out
./13postbiq.sh
