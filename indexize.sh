#!/bin/sh
#create index.html from these .html & rtfd-converted-html in same folder

echo "indexize start"
# import JSON.sh
. ./libraries/JSON.sh

./libraries/JSON.sh < params.json


#echo $jsonParams
rm htmlList.log
rm index.html

#check exist .html -> line making -> reverse htmllist.log (old ~ new -> new ~ old by date)
find . -type f -name \*.html -print | tail -r >> htmlList.log

#add html header
cat ./html/html_header.html > index.html

#add html body
cat ./html/html_body_head.html >> index.html



#read TITLE by html from each line
#define line-delim as below
IFS="
"
echo $jsonParams | tokenize | parse | egrep '\["finder"\]' | sed s/'\["finder"\]	'//

finder=$(echo $jsonParams | tokenize | parse | egrep '\["finder"\]' | sed s/'\["finder"\]	'//)
picker=$(echo $jsonParams | tokenize | parse | egrep '\["picker"\]' | sed s/'\["picker"\]	'//)

echo a is $finder
echo b is "p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 22.0px"

for line in $(< htmlList.log);do
	#read each file and get first-line as title.
	if grep "p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 22.0px" $line
	then
		currentNamePartStr=$(grep "<p class=\"p1\">" $line)
		
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