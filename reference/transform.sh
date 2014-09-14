#!/bin/bash

clear

echo "Here we go!"

echo "Maybe deleting old HTML files"
if [ -d html ]
then
		echo "Deleting old HTML files"
		rm -r html
		mkdir html
else
		echo "Didn't have any old HTML files to delete"
fi

echo "Fixing the code block syntax and exporting HTML for"
for f in md/*.md
do
	prefix=$(basename "$f")
	extension="${prefix##*.}"
	filename="${prefix%.*}"
	
	# perl -pi -e 's/````java/````/g' $f
	# echo "BeautifulSoup parsing and String replacing in python"
	# python formatter.py $filename.html
	# echo "mv-ing $filename to the correct directory"
	# mv md/$filename.html html/$filename.html
	# sed -ie 's/code/word/g' html/$filename.html

	echo "mv-ing $filename"
	markdown $f > html/$filename.html

	echo "getting my <pre> tags ready to prettyprint"
	perl -pi -e 's/<pre>/<pre class="prettyprint lang-java">/g' html/$filename.html
done