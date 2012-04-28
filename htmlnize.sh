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


#add default.less into 
function addCSSLoader() {
	echo not yet implemented prefectly.
	
	#get code-marker
	codeMarker=$(../libraries/JSON.sh < ../params.json | egrep '\["codeMarker"\]' | cut -d'	' -f2 | sed s/\"//g)
	
	#later create codeMarker
	expression=$(grep "$codeMarker" $1 | cut -d " " -f5)
	
	echo $expression
	
	#change <p class="$expression"> to	<p class="code">
#	sed -i -e 's/<p class=$expression>/<pre class=\"code\">/' -e 's/<\/p>/<\/pre>/' $1
	sed -i -e 's/<p class=$expression>/<pre class=\"code\">/' $1
	
	echo not work yet.
	#
	
	rm $1-e
	echo " css loader added";
}


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
	addCSSLoader $targetHtmlFile
	
	
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
	addCSSLoader $targetHtmlFile
	
	cd ../
done


echo "htmlnize done"