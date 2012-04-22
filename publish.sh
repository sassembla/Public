#!/bin/sh

echo "start"

rm htmllist.log
rm index.html

#check exist .html -> line making -> output to htmllist.log
find . -type f -name \*.html -print >> htmllist.log

#create html header
header=$(cat << _header_
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01//EN" "http://www.w3.org/TR/html4/strict.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  <meta http-equiv="Content-Style-Type" content="text/css">
  <title></title>
  <meta name="Generator" content="Cocoa HTML Writer">
  <meta name="CocoaVersion" content="1138.32">
  <link rel="stylesheet" type="text/css" href="stylesheets/basic.css"/>
  <link rel="stylesheet" type="text/less" href="stylesheets/less/stylesheet.less"/>
  <link rel="stylesheet" type="text/less" href="stylesheets/less/attach.less"/>
  <script type="text/javascript" src="javascripts/less-1.3.0.min.js"></script>
</head>
_header_)
echo $header >> index.html

bodyHead=$(cat << _body_
<body>
_body_)
echo $bodyHead >> index.html


#read TITLE by html from each line
#define line-delim as below
IFS="
"

for line in $(< htmllist.log);do
	#read each file and get first-line as title.
	#echo $line
	
	if grep "p.p1 {margin: 0.0px 0.0px 0.0px 0.0px; font: 22.0px" $line
	then
	  	#echo "here is title with formatted-p1-tag"
		currentNamePartStr=$(grep "<p class=\"p1\">" $line)
		
		#create link-tag Head and Tail
		aTagHead="<a href=\"$line\">"
		aTagTail="</a>"
		
		echo $aTagHead$currentNamePartStr$aTagTail >> index.html
	fi
done


wait

bodyTail=$(cat << _body_
</body>
_body_)

echo $bodyTail >> index.html

