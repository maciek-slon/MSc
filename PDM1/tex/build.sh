PDFLATEXOPT='-synctex=1'
ROOT=$1

if [ $2 == "all" ]; then
	pdflatex ${PDFLATEXOPT} ${ROOT} 
	bibtex ${ROOT}
	makeindex -o ${ROOT}.ind -s ${ROOT}.ist ${ROOT}.idx
	pdflatex ${PDFLATEXOPT} ${ROOT}
	pdflatex ${PDFLATEXOPT} ${ROOT}
fi

if [ $2 == "clean" ]; then
	rm *.aux
	rm *.ind
	rm *.toc
	rm *.app
	rm *.bbl
	rm *.blg
	rm *.ilg
	rm *.idx
	rm *.lof
	rm *.log
	rm *.lol
	rm *.lot
	rm *.out
fi
