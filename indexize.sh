#!/bin/sh
#create index.html from these .html & rtfd-converted-html in same folder

echo "indexize start"
# import JSON.sh
. ./libraries/JSON.sh

#echo $jsonParams
rm htmlList.log
rm index.html

#check exist .html -> line making -> reverse htmllist.log (old ~ new -> new ~ old by date)
find . -type f -name \*.html -print | tail -r >> htmlList.log

#input html header
cat ./html/html_header.html > index.html

#add html body
cat ./html/html_body_head.html >> index.html



#read TITLE by html from each line
#define line-delim as below
IFS="
"

./libraries/JSON.sh < params.json | egrep '\["finder"\]' | cut -d'	' -f2 | sed s/'\"'//g

finder=$(./libraries/JSON.sh < params.json | egrep '\["finder"\]' | cut -d'	' -f2 | sed s/'\"'//g)
picker=$(./libraries/JSON.sh < params.json | egrep '\["picker"\]' | cut -d'	' -f2 | cut -c2-17)

for line in $(< htmlList.log);do
	#read each file and get first-line as title.
	if grep "$finder" $line
	then
	echo $picker
		currentNamePartStr=$(grep "$picker" $line)
		
		#create link-tag Head and Tail
		aTagHead="<a href=\"$line\">"
		aTagTail="</a>"
		
		#./12:01:29 18-37-00.html
		echo $line
		originalTime=$line
		
		echo $aTagHead$currentNamePartStr$aTagTail >> index.html
	fi
done

cat ./html/html_body_tail.html >> index.html

echo "indexize done"