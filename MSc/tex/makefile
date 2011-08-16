OUTPUT=build
PDFLATEXOPT=-synctex=1 -output-directory=$(OUTPUT)
ROOT=main

all:
	pdflatex $(PDFLATEXOPT) $(ROOT)

ifndef NOBIB
	bibtex $(OUTPUT)/$(ROOT)
endif
	makeindex -s $(OUTPUT)/$(ROOT).ist -t $(OUTPUT)/$(ROOT).glg -o $(OUTPUT)/$(ROOT).gls $(OUTPUT)/$(ROOT).glo
	pdflatex $(PDFLATEXOPT) $(ROOT)
	pdflatex $(PDFLATEXOPT) $(ROOT)

clean:
	rm -f $(OUTPUT)/*.aux
	rm -f $(OUTPUT)/*.ind
	rm -f $(OUTPUT)/*.toc
	rm -f $(OUTPUT)/*.app
	rm -f $(OUTPUT)/*.bbl
	rm -f $(OUTPUT)/*.blg
	rm -f $(OUTPUT)/*.ilg
	rm -f $(OUTPUT)/*.idx
	rm -f $(OUTPUT)/*.ist
	rm -f $(OUTPUT)/*.lof
	rm -f $(OUTPUT)/*.log
	rm -f $(OUTPUT)/*.lol
	rm -f $(OUTPUT)/*.lot
	rm -f $(OUTPUT)/*.out
	rm -f $(OUTPUT)/*.glg
	rm -f $(OUTPUT)/*.glo
	rm -f $(OUTPUT)/*.gls

distclean: clean
	rm -f $(OUTPUT)/*.pdf
	rm -f $(OUTPUT)/*.gz
