# $Id: Makefile 1 2009-10-12 11:18:50Z soohyunc $

TEXFILES=$(wildcard *.tex)
BIBFILE=report.bib
TARGET=article
FIGSDIR=fig

RM	:= rm -f

${TARGET}.pdf:	${TARGET}.ps
	@ps2pdf ${TARGET}.ps

${TARGET}.ps:	${TARGET}.dvi
	@dvips -t a4 -o ${TARGET}.ps ${TARGET}

${TARGET}.dvi:	$(TEXFILES)
	@latex ${TARGET}
	# @bibtex ${TARGET}
	@latex ${TARGET}
	@latex ${TARGET}

clean:
	@echo "Start clean"
	$(RM) *.log *.aux *.ps *.dvi *.bbl *.blg *.log *.pdf *.brf *.toc *.lof *.lot
	$(RM) *.*~

distclean:
	@echo "Start EXHASTIVE clean"
	$(RM) *.log *.aux *.ps *.dvi *.bbl *.blg *.log *.pdf *.brf *.toc *.lof *.lot
	$(RM) *.*~
	$(RM) $(FIGSDIR)/*

wc:
	@echo Approximate word count: \
		`grep -v '^\\\\' $(TEXFILES)|grep -v '^%'|wc -w`

