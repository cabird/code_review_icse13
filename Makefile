# Makefile for a latex paper
LATEX = pdflatex
PAPER = paper

all: $(PAPER).pdf

# Run once, then re-run until it's happy
# Input redirected from /dev/null is like hitting ^C at first error
$(PAPER).pdf: $(PAPER).tex paper.bib Figures
	$(LATEX) $(PAPER).tex </dev/null
	bibtex $(PAPER)
	$(LATEX) $(PAPER).tex </dev/null
	$(LATEX) $(PAPER).tex </dev/null

# put the list of figures here
Figures: 

clean:
	rm -f *.aux *.log $(PAPER).ps $(PAPER).pdf *.dvi *.blg *.bbl *.lof *.lot *.toc *~
