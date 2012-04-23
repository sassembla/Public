#!/bin/sh
#create index.html from these .html & rtfd-converted-html in same folder

echo "indexize start"
# JSON.sh
. ./libraries/JSON.sh


# libraries/JSON.sh
./libraries/JSON.sh json_parse < params.json


rm htmlList.log
rm index.html

#check exist .html -> line making -> reverse htmllist.log (old ~ new -> new ~ old by date)
find . -type f -name \*.html -print | tail -r >> htmlList.log

#add html header
cat html_header.html > index.html

#add html body
cat html_body_head.html >> index.html



#read TITLE by html from each line
#define line-delim as below
IFS="
"

finder=$(cat finder.txt)
picker=$(cat picker.txt)

for line in $(< htmlList.log);do
	#read each file and get first-line as title.
	if grep $finder $line
	then
		currentNamePartStr=$(grep $picker $line)
		
		#create link-tag Head and Tail
		aTagHead="<a href=\"$line\">"
		aTagTail="</a>"
		
		#./12:01:29 18-37-00.html
		echo $line
		originalTime=$line
		
		echo $aTagHead$currentNamePartStr$aTagTail >> index.html
	fi
done

cat html_body_tail.html >> index.html

echo "indexize done"