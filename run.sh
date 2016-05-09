sh 0.autonames.sh

echo -n "We have some tools by default but please make sure you have all the other necessary tools(y/n)? "
read answer
if echo "$answer" | grep -iq "^y" ;then
dos2unix *sh
chmod 777 *sh
./1.autoQuality.sh
else
cat no.txt
fi



