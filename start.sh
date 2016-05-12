#!/bin/bash

echo -n "would you like to group your samples into catogories [eg. normal, tumor](y/n)? "
read answer1 > listdump/grpyn.txt
if echo "$answer1" | grep -iq "^y" ;then
echo -n "how many catogories you would like to do(2-5)? "
read answer1 > listdump/grpnum.txt
if echo "$answer1" | grep -iq "2" ;then
read -p "Enter your name : " name1 
read -p "Enter your name : " name2 
echo -e "$name1\n$name2" > listdump/grpname.txt
./run.sh
elif echo "$answer1" | grep -iq "3" ;then
read -p "Enter your name : " name1 
read -p "Enter your name : " name2 
read -p "Enter your name : " name3 
echo "$name1\n$name2\n$name3" > listdump/grpname.txt
./run.sh

elif echo "$answer1" | grep -iq "4" ;then
read -p "Enter your name : " name1 
read -p "Enter your name : " name2 
read -p "Enter your name : " name3 
read -p "Enter your name : " name4 
echo "$name1\n$name2\n$name3\n$name4" > listdump/grpname.txt
./run.sh

elif echo "$answer1" | grep -iq "5" ;then
read -p "Enter your name : " name1 
read -p "Enter your name : " name2 
read -p "Enter your name : " name3 
read -p "Enter your name : " name4 
read -p "Enter your name : " name5
echo "$name1\n$name2\n$name3\n$name4\n$name5" > listdump/grpname.txt
./run.sh



else 
echo "inapropropriate input"
cat no.txt
fi
else 
echo "continuing without groups"
./run.sh
fi


