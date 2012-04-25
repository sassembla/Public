#!/bin/sh

echo "htmlnize start"
rm rtfds.log


#	.rtfd	#

#list up
find . -type d -name \*.rtfd -print -maxdepth 1 >> rtfds.log

#read file-path from each line
#define line-delim as below
IFS="
"

for line in $(< rtfds.log);do
	path=$(echo "$line" | sed -e 's/.rtfd//')
	path=$(echo "$path" | sed -e 's/.\///')
	echo path is $path
	
	#create directry from target-name(without ".rtfd")
	mkdir "$path"
	mv "$line" "$path"

	cd "$path"
	
	#create html from .rtfd
	textutil -convert html "$path".rtfd

	targetHtmlFile="$path".html
	
	#replace "file:///somefile.jpg" to "somefile.jpg"
	sed -i -e 's/file:\/\/\///g' $targetHtmlFile
	
	#delete dust..
	rm "$path".html-e
	cd ../
done




#	.rtf	#
rm rtfs.log

#list up
find . -type f -name \*.rtf -print -maxdepth 1 >> rtfs.log

#read file-path from each line
for line in $(< rtfs.log);do
	path=$(echo "$line" | sed -e 's/.rtf//')
	path=$(echo "$path" | sed -e 's/.\///')
	echo path is $path
	
	#create directry from target-name(without ".rtf")
	mkdir "$path"
	mv "$line" "$path"

	cd "$path"
	
	#create html from .rtf
	textutil -convert html "$path".rtf

	targetHtmlFile="$path".html
	
	cd ../
done



echo "htmlnize done"