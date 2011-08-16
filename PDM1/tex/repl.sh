#!/bin/bash

cd $1
echo "Removing eps and md5 files..."
rm *.eps
rm *.md5
files=`ls | grep \\.tex`
filecount=`ls | grep \\.tex | wc -l`
echo $filecount .tex files to process...
filearray=($files)
echo "Now seding in files..."
i=0
for file in $files; do
	i=`expr $i + 1`
	isto=`expr $i \* 100`
	perc=`expr $isto / $filecount`
	echo -ne \\r $perc% 
	if [ -f $file ]; then
		sed -e's/\\section{/\\appsection{/g' -e's/\\subsection{/\\appsubsection{/g' -e's/Dokumentacja przestrzeni nazw //g' -e's/Dokumentacja klasy //g' -e's/Dokumentacja szablonu klasy //g' $file > $file.tmp && mv $file.tmp $file

		# remove date
		sed -n '
		# if the first line copy the pattern to the hold buffer
		1h
		# if not the first line then append the pattern to the hold buffer
		1!H
		# if the last line then ...
		$ {
		        # copy from the hold to the pattern buffer
		        g
		        # do the search and replace
		        s/\\begin{DoxyDate}.*\\end{DoxyDate}//g
		        # print
		        p
		}
		' $file > $file.tmp && mv $file.tmp $file

		# remove author
		sed -n '
		# if the first line copy the pattern to the hold buffer
		1h
		# if not the first line then append the pattern to the hold buffer
		1!H
		# if the last line then ...
		$ {
		        # copy from the hold to the pattern buffer
		        g
		        # do the search and replace
		        s/\\begin{DoxyAuthor}.*\\end{DoxyAuthor}//g
		        # print
		        p
		}
		' $file > $file.tmp && mv $file.tmp $file

	fi
done
echo " done!"
