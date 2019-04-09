#list of diretories:
TaBSAPdir=$(sed -n '1p' ../data/wd.txt)
scriptdir=$PWD
datadir=$TaBSAPdir/data
#Main folder where scripts are located [change it with current path where script is present]
refs=$datadir/ref
#Reference files folder
raw1=$datadir/fastq
#Path  to fastq input(samples)
faout=$datadir/faout
#Path to Trimmed files
tools=$TaBSAPdir/tools
#Path to the inbuilt tools
con=$datadir/converted
#Path to Path to Reads Mapped with converted Reference
qb4=$datadir/qb4
#Path to FastQC output Before trimming
qaf=$datadir/qaf
#Path to FastQC output After trimming
lists=$datadir/listdump
#Path for the list of files create during analysis
gnlist=$datadir/genelist
#path to reference gene list(inividual files for each gene)
finfile=$datadir/finalFiles
#Path to output from faSomeRecords
mrg=$datadir/mergedData
#Path to Merged fasta files
name=$datadir/name
#Merged files with Gene names
Total_mem=$(free -g | awk 'NR==2 {print $2}')
java_mem=$(expr $Total_mem / 2)
cd $tools
if [ -f ngm.zip ]
then
unzip ngm.zip
else
echo ""
fi
rm -f $tools/ngm.zip
cd $TaBSAPdir
chmod -R 0777 *

echo creating required directories
mkdir -p fastq/
mkdir -p ref/
mkdir -p qb4/
mkdir -p qaf/
mkdir -p faout/
mkdir -p listdump/
mkdir -p genelist/
mkdir -p finalFiles/
mkdir -p mergedData/
mkdir -p converted/
mkdir -p converted/unmapped/
mkdir -p converted/mapped/
mkdir -p unconverted/
mkdir -p unconverted/bam/
mkdir -p unconverted/unmapped/
mkdir -p unconverted/mapped/
mkdir -p unconverted/fastq/
mkdir -p rcconverted/
mkdir -p rcconverted/bam/
mkdir -p rcconverted/unmapped/
mkdir -p rcconverted/mapped/
mkdir -p rcconverted/fastq/
mkdir -p rcunconverted/
mkdir -p rcunconverted/fastq/
mkdir -p rcunconverted/bam/
mkdir -p rcunconverted/unmapped/
mkdir -p rcunconverted/mapped/
mkdir -p rcunconverted/finalUnmapped/
mkdir -p name/
mkdir -p biqout/
mkdir -p biqref/
mkdir -p postbiq/
mkdir -p tsv/
mkdir -p heatmap/
echo creating directory complete
cd $raw1/
#get no of fastq files
ls *.fastq | wc -l | sed 's/^#.*//' > $lists/file.txt
#---------#
echo 'number of samples to be analysed :'
cat $datadir/listdump/file.txt
#---------#
#list name of input files
ls -1 *.fastq | sort -V | sed 's/^#.*//' > ../listdump/list.txt

cd $datadir/
while read tests ; do testss=$tests ; done < listdump/file.txt
for ((i=1; i<=$testss; i++))
do
cd $raw1/
list=$(cat ../listdump/list.txt | cut -d  " " -f1 | sed -n ''$i'p')
done


cd $refs/
sed '/^>/! s/CG/X/g'  uc.fa | sed '/^>/! s/C/T/g'  | sed '/^>/! s/X/CG/g' > converted.fa
$tools/fastx/fastx_reverse_complement  -i uc.fa -o rcuc.fa
$tools/fastx/fastx_reverse_complement  -i converted.fa -o rcc.fa
ls -1 *.fa | sort -V | sed 's/^#.*//' > ../listdump/ref.txt
ref=$(cat ../listdump/ref.txt | cut -d  " " -f1 | sed -n ''1'p')
grep '>' $ref > ../listdump/glist.txt | sort -t: -n -k2
awk '{gsub(">", "");print}' ../listdump/glist.txt  > ../listdump/genelist.txt
cd $datadir/

echo 'Reference sequence genes:'
cat $datadir/listdump/genelist.txt
cd listdump/
cat genelist.txt | wc -l > gno.txt
while read gen ; do gee=$gen ; done < gno.txt
for ((j=1; j<=$gee; j++))
do
genes=$(cat genelist.txt | cut -d  " " -f1 | sed -n ''$j'p')
mkdir -p ../postbiq/$genes
rename $'\r' '' ../postbiq/*
done
cd $datadir
while read tes ; do tess=$tes ; done < listdump/gno.txt
for ((im=1; im<=$tess; im++))
do
cat listdump/genelist.txt | cut -d  " " -f1 | sed -n ''$im'p' > genelist/$im.txt
done
cd listdump/
cd ..
cd $out
