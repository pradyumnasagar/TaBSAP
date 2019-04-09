#!/bin/bash
mkdir -p data/listdump
echo "please copy the files to be analysed to data/fastq folder"
echo "fastq file name should be numerical ie. 1.fastq 2.fastq 3.fastq etc."
echo "If grouping is enabled the numbering should be in proper order"
echo ""
echo "continue?? (y/n)"
echo ""

echo $PWD > data/wd.txt

read yynn
if echo "$yynn" | grep -iq "^y" ;then
cd data/fastq
counts=$(ls *.fastq)
counts=$(echo "$counts" | wc -l)
cd ../../ || echo "path does not exist" | tee -a data/log/errors.log | exit
echo -n "would you like to group your samples into catogories [eg. normal, tumor](y/n)? "
echo ""
read answer1
echo ""
echo $answer1 > data/listdump/grpyn.txt
if echo "$answer1" | grep -iq "^y" ;then
echo "Sample name should be in the same order [if first  caterory is normal first 'n' files should be normal samples] Read documentation for details. http://github.com/pradyumnasagar/TaBSAP"
echo ""
echo -n "how many categories you would like to do(2-5)?"
echo""
read answer1 > data/listdump/grpnum.txt
if echo "$answer1" | grep -iq "2" ;then
read -p "Enter first category : " name1
read -p "Enter second category : " name2
echo -e "\"$name1\",\"$name2\"" > data/listdump/grpname.txt
echo "there are $counts files to be analysed"
read -p "How many files belongs to category $name1 ? " nameno1
echo "The first $nameno1 files are categorised as $name1"
read -p "How many files belongs to category $name2 ? " nameno2
echo "The rest $nameno2 files are categorised as $name2"
echo -e "$nameno1,$nameno2" > data/listdump/grpnameno.txt
cd scripts/  || echo "path does not exist" | tee -a data/log/errors.log | exit
./run.sh

elif echo "$answer1" | grep -iq "3" ;then
read -p "Enter first category : " name1
read -p "Enter second category : " name2
read -p "Enter third category : " name3
echo "\"$name1\",\"$name2\",\"$name3\"" > data/listdump/grpname.txt
echo "there are $counts files to be analysed"
read -p "How many files belongs to category $name1 ? " nameno1
echo "The first $nameno1 files are categorised as $name1"
read -p "How many files belongs to category $name2 ? " nameno2
echo "The next $nameno2 files are categorised as $name2"
read -p "How many files belongs to category $name3 ? " nameno3
echo "The remaining $nameno3 files are categorised as $name3"
echo -e "$nameno1,$nameno2,$nameno3" > data/listdump/grpnameno.txt
cd scripts/ || echo "path does not exist" | tee -a data/log/errors.log | exit
./run.sh

elif echo "$answer1" | grep -iq "4" ;then
read -p "Enter first category : " name1
read -p "Enter second category : " name2
read -p "Enter third category : " name3
read -p "Enter fourth category : " name4
echo "\"$name1\",\"$name2\",\"$name3\",\"$name4\"" > data/listdump/grpname.txt
echo "there are $counts files to be analysed"
read -p "How many files belongs to category $name1 ? " nameno1
echo "The first $nameno1 files are categorised as $name1"
read -p "How many files belongs to category $name2 ? " nameno2
echo "The next $nameno2 files are categorised as $name2"
read -p "How many files belongs to category $name3 ? " nameno3
echo "The next $nameno3 files are categorised as $name3"
read -p "How many files belongs to category $name4 ? " nameno4
echo "The remaining $nameno4 files are categorised as $name4"
echo -e "$nameno1,$nameno2,$nameno3,$nameno4" > data/listdump/grpnameno.txt
cd scripts/ || echo "path does not exist" | tee -a data/log/errors.log | exit
./run.sh

elif echo "$answer1" | grep -iq "5" ;then
read -p "Enter first category : " name1
read -p "Enter second category : " name2
read -p "Enter third category : " name3
read -p "Enter fourth category : " name4
read -p "Enter fifth category : " name5
echo "\"$name1\",\"$name2\",\"$name3\",\"$name4\",\"$name5\"" > data/listdump/grpname.txt
echo "there are $counts files to be analysed"
read -p "How many files belongs to category $name1 ? " nameno1
echo "The first $nameno1 files are categorised as $name1"
read -p "How many files belongs to category $name2 ? " nameno2
echo "The next $nameno2 files are categorised as $name2"
read -p "How many files belongs to category $name3 ? " nameno3
echo "The next $nameno3 files are categorised as $name3"
read -p "How many files belongs to category $name4 ? " nameno4
echo "The fnext $nameno4 files are categorised as $name4"
read -p "How many files belongs to category $name5 ? " nameno5
echo "The remaining $nameno5 files are categorised as $name5"
echo -e "$nameno1,$nameno2,$nameno3,$nameno4,$nameno5" > data/listdump/grpnameno.txt
cd scripts/ || echo "path does not exist" | tee -a data/log/errors.log | exit
./run.sh

else
echo "inapropropriate input"
cat scripts/no.txt
fi
else
echo "Starting without groups"
cd scripts/
./run.sh


fi
else
cat scripts/no.txt
fi
