#!/bin/sh
#create index.html from these .html & rtfd-converted-html in same folder

echo "indexize start"
rm htmlList.log
rm htmlListRev.log

rm index.html

#check exist .html -> line making -> output to htmllist.log
find . -type f -name \*.html -print >> htmlList.log

#create html header
header=$(cat << _header_
<!DOCTYPE html>
<html>

  <head>
    <meta charset='utf-8' />
    <meta http-equiv="X-UA-Compatible" content="chrome=1" />
    <meta name="description" content="necomimi Publish : Blog from My dropbox-folder" />

    <link rel="stylesheet" type="text/css" href="stylesheets/basic.css"/>
    <link rel="stylesheet" type="text/less" href="stylesheets/less/stylesheet.less"/>
    <link rel="stylesheet" type="text/less" href="stylesheets/less/attach.less"/>

    <script type="text/javascript" src="javascripts/less-1.3.0.min.js"></script>

    <title>necomimi publish</title>

</head>
_header_)
echo $header >> index.html

bodyHead=$(cat << _body_
<body>
<!-- HEADER -->
<div id="header_wrap" class="outer">
	<header class="inner">
		<h1 id="project_title">necomimi publish</h1>
		<div class="emblem"></div>
    </header>
</div>
<!-- MAIN CONTENT -->
<div id="main_content_wrap" class="outer">
  <section id="main_content" class="inner">
_body_)
echo $bodyHead >> index.html

#reverse htmllist.log
tail -r htmlList.log >> htmlListRev.log

#read TITLE by html from each line
#define line-delim as below
IFS="
"

for line in $(< htmlListRev.log);do
	#read each file and get first-line as title.
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


bodyTail=$(cat << _body_
		</div>
	</section>
	<!-- FOOTER  -->
    <div id="footer_wrap" class="outer">
      <footer class="inner">
        <p class="copyright">necomimi publish maintained by <a href="https://github.com/sassembla">sassembla</a></p>
        <p>Published with <a href="http://pages.github.com">GitHub Pages</a></p>
      </footer>
    </div>
  </body>
</html>
_body_)

echo $bodyTail >> index.html

echo "indexize done"