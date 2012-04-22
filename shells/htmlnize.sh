#!/bin/sh

echo "htmlnize start"
rm rtfds.log

##list up
find . -type d -name \*.rtfd -print -maxdepth 1 >> rtfds.log

#read file-path from each line
#define line-delim as below
IFS="
"

for line in $(< rtfds.log);do
	path=$(echo "$line" | sed -e 's/.rtfd//')
	path=$(echo "$path" | sed -e 's/.\///')
	echo path is $path
	pwd
	#create directry from target-name(without ".rtfd")
	mkdir "$path"
	mv "$line" "$path"

	cd "$path"
	
	#create html from data
	textutil -convert html "$path".rtfd

	targetHtmlFile="$path".html
#	cat $targetHtmlFile
	
	#replace "file:///somefile.jpg" to "somefile.jpg"
	sed -i -e 's/file:\/\/\///g' $targetHtmlFile
	
	rm "$path".html-e
	cd ../
done


echo "htmlnize done"