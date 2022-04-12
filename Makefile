MODE = --shell-escape

.PHONY: all
all: bitcoinelegance.pdf

.PHONY: pdf
pdf: bitcoinelegance.pdf

bitcoinelegance.pdf: bitcoinelegance.tex chapters/*.tex
	pdflatex $(MODE) $<
	pdflatex $(MODE) $<

.PHONY: clean
clean:
	$(RM) *.ps *.dvi *.aux *.toc *.idx *.ind *.ilg *.log *.out *.brf *.blg *.bbl *.nav *.snm *.vrb
	$(RM) */*.ps */*.dvi */*.aux */*.toc */*.idx */*.ind */*.ilg */*.log */*.out */*.brf */*.blg */*.bbl */*.nav */*.snm */*.vrb

.PHONY: distclean
distclean: clean
	$(RM) *.pdf
