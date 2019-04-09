while read tests ; do testss=$tests ; done < ../data/listdump/gno.txt
for ((i=1; i<=$testss; i++))
do
  cat ../data/listdump/genelist.txt | cut -d  " " -f1 | sed -n ''$i'p' > ../data/genelist/$i.txt
done
