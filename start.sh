#!/bin/bash
mkdir -p listdump
echo "please copy the files to be analysed to fastq folder"
echo "continue?? (y/n)"
echo ""
read yynn
if echo "$yynn" | grep -iq "^y" ;then
cd fastq
counts=$(ls *.fastq)
counts=$(echo "$counts" | wc -l)
cd ../
echo -n "would you like to group your samples into catogories [eg. normal, tumor](y/n)? "
echo ""
read answer1
echo "" 
echo $answer1 > listdump/grpyn.txt
if echo "$answer1" | grep -iq "^y" ;then
echo "Sample name should be in the same order [if first  caterory is normal first 'n' files should be normal samples] Read documentation for details. http://github.com/pradyumnasagar/TaBSAP"
echo ""
echo -n "how many categories you would like to do(2-5)?"
echo""
read answer1 > listdump/grpnum.txt
if echo "$answer1" | grep -iq "2" ;then
read -p "Enter first category : " name1 
read -p "Enter second category : " name2 
echo -e "\"$name1\",\"$name2\"" > listdump/grpname.txt
echo "there are $counts files to be analysed"
read -p "How many files belongs to category $name1 ? " nameno1
echo "The first $nameno1 files are categorised as $name1"
read -p "How many files belongs to category $name2 ? " nameno2
echo "The rest $nameno2 files are categorised as $name2"
echo -e "$nameno1,$nameno2" > listdump/grpnameno.txt
./run.sh

elif echo "$answer1" | grep -iq "3" ;then
read -p "Enter first category : " name1 
read -p "Enter second category : " name2 
read -p "Enter third category : " name3 
echo "\"$name1\",\"$name2\",\"$name3\"" > listdump/grpname.txt
echo "there are $counts files to be analysed"
read -p "How many files belongs to category $name1 ? " nameno1
echo "The first $nameno1 files are categorised as $name1"
read -p "How many files belongs to category $name2 ? " nameno2
echo "The next $nameno2 files are categorised as $name2"
read -p "How many files belongs to category $name3 ? " nameno3
echo "The remaining $nameno3 files are categorised as $name3"
echo -e "$nameno1,$nameno2,$nameno3" > listdump/grpnameno.txt
./run.sh

elif echo "$answer1" | grep -iq "4" ;then
read -p "Enter first category : " name1 
read -p "Enter second category : " name2 
read -p "Enter third category : " name3 
read -p "Enter fourth category : " name4 
echo "\"$name1\",\"$name2\",\"$name3\",\"$name4\"" > listdump/grpname.txt
echo "there are $counts files to be analysed"
read -p "How many files belongs to category $name1 ? " nameno1
echo "The first $nameno1 files are categorised as $name1"
read -p "How many files belongs to category $name2 ? " nameno2
echo "The next $nameno2 files are categorised as $name2"
read -p "How many files belongs to category $name3 ? " nameno3
echo "The next $nameno3 files are categorised as $name3"
read -p "How many files belongs to category $name4 ? " nameno4
echo "The remaining $nameno4 files are categorised as $name4"
echo -e "$nameno1,$nameno2,$nameno3,$nameno4" > listdump/grpnameno.txt
./run.sh

elif echo "$answer1" | grep -iq "5" ;then
read -p "Enter first category : " name1 
read -p "Enter second category : " name2 
read -p "Enter third category : " name3 
read -p "Enter fourth category : " name4 
read -p "Enter fifth category : " name5
echo "\"$name1\",\"$name2\",\"$name3\",\"$name4\",\"$name5\"" > listdump/grpname.txt
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
echo -e "$nameno1,$nameno2,$nameno3,$nameno4,$nameno5" > listdump/grpnameno.txt
./run.sh

else 
echo "inapropropriate input"
cat no.txt
fi
else 
echo "Starting without groups"
./run.sh
 

fi
else 
cat no.txt
fi


