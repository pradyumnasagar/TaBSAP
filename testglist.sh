while read tests ; do testss=$tests ; done < listdump/gno.txt
for ((i=1; i<=$testss; i++))
do
cat listdump/genelist.txt | cut -d  " " -f1 | sed -n ''$i'p' > genelist/$i.txt
done

