#!/bin/sh
#create index.html from these .html & rtfd-converted-html in same folder

echo "indexize start"

#delete logs
rm htmlList.log
rm index.html

#check exist .html -> line making -> reverse htmllist.log (old ~ new -> new ~ old by date)
find . -type f -name \*.html -print | tail -r >> htmlList.log

#input html header
cat ./htmlResource/html_header.html > index.html

#add html body
cat ./htmlResource/html_body_head.html >> index.html



#read TITLE by html from each line
#define line-delim as below
IFS="
"

#read "params.json"
marker=$(./libraries/JSON.sh < params.json | egrep '\["marker"\]' | cut -d'	' -f2 | sed s/'\"'//g)
picker=$(./libraries/JSON.sh < params.json | egrep '\["picker"\]' | cut -d'	' -f2 | cut -c2-17)

for line in $(< htmlList.log);do
	#read each file and get first-line as title.
	if grep "$marker" $line
	then
	#get namePart
		currentNamePartStr=$(grep "$picker" $line)
		
		#create link-tag Head and Tail
		aTagHead="<a href=\"$line\">"
		aTagTail="</a>"
		
		#wrote-date like 12/04/23 1:23:37
		wroteDate=$(echo "\"$line\"" | cut -d '/' -f2 | sed s/'.html\"'// | sed s/':'/'\/'/g | sed s/'-'/':'/g)

		#updated-date like (updated 3min ago)
		updatedDate=$"under configuration"
	
#		ls -l $line
#		modf_time=$(ls -l $line)
#		time_hr=`echo hr $time_hrmin | cut -d ':' -f1`
#		time_min=`echo min $time_hrmin | cut -d ':' -f2`
#		echo $time_month $time_day $time_hr $time_min
# 		"updated "$updatedDate
		
		echo $aTagHead$currentNamePartStr$aTagTail "wrote "$wroteDate >> index.html
	fi
done

cat ./htmlResource/html_body_tail.html >> index.html

echo "indexize done"