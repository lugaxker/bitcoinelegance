MODE = --shell-escape

.PHONY: all
all: bitcoinelegance.pdf

.PHONY: pdf
pdf: bitcoinelegance.pdf

bitcoinelegance.pdf: bitcoinelegance.tex chapters/*.tex front/*.tex back/bibliography.bib
	pdflatex $(MODE) $<
	biber bitcoinelegance
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

backcover.pdf: appendix/backcover.tex
	pdflatex $(MODE) $<

appendix.pdf: appendix/appendix.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

.PHONY: clean
clean:
	$(RM) *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.out *.brf *.blg *.bbl *.nav *.snm *.vrb *.bcf *.xml *.ent
	$(RM) */*.ps */*.dvi */*.aux */*.toc */*.idx */*.ind */*.ilg */*.log */*.out */*.brf */*.blg */*.bbl */*.nav */*.snm */*.vrb */*.bcf */*.xml */*.ent

.PHONY: distclean
distclean: clean
	$(RM) *.pdf
