MODULE = comrepth
BIBLIO = $(MODULE)

SHELL = /bin/bash

.SUFFIXES: .pdf

.tex.pdf:
	pdflatex $*
	bibtex $*
	pdflatex $*
	pdflatex $*

all:	$(MODULE).pdf

tar:	$(MODULE).tgz

$(MODULE).pdf: $(MODULE).tex $(BIBLIO).bib

clean:
	rm -fv *.log *.aux *.blg *.out *.snm *.nav *.toc
	rm -fv *.mpx *.mpo *.vrb *.dvi *.1
	rm -fv *.tmp *.bck *~

veryclean: clean
	rm -fv $(MODULE).pdf 
	rm -fv $(MODULE).bbl 
	rm -fv $(MODULE).tgz 

#  for packing it all up.
$(MODULE).tgz: all
	tar zcvf $@ -C .. $(MODULE)/$(MODULE).{tex,bbl,pdf} $(MODULE)/$(BIBLIO).{bib}
