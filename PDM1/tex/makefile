PDFLATEXOPT=-synctex=1 #-output-directory=..
ROOT=main

all:
	pdflatex $(PDFLATEXOPT) $(ROOT)

ifndef NOBIB
	bibtex $(ROOT)
endif
	makeindex -s $(ROOT).ist -t $(ROOT).glg -o $(ROOT).gls $(ROOT).glo
	makeindex -o $(ROOT).ind -s $(ROOT).ist $(ROOT).idx
	pdflatex $(PDFLATEXOPT) $(ROOT)
	pdflatex $(PDFLATEXOPT) $(ROOT)

clean:
	rm -f *.aux
	rm -f *.ind
	rm -f *.toc
	rm -f *.app
	rm -f *.bbl
	rm -f *.blg
	rm -f *.ilg
	rm -f *.idx
	rm -f *.lof
	rm -f *.log
	rm -f *.lol
	rm -f *.lot
	rm -f *.out
	rm -f *.glg
	rm -f *.glo
	rm -f *.gls
