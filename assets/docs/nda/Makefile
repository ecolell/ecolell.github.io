WIN_SUFFIX = .exe
SHELL_SUFFIX = $(suffix $(SHELL))

name=	nda.es.pdf \
	nda.en.pdf

ifeq ($(WIN_SUFFIX),$(SHELL_SUFFIX))
        os=windows
	cmdsep=&
	viewer=AcroRd32
else
        os=linux
	cmdsep=;
	viewer=evince
endif

all: nda.es.pdf nda.en.pdf

%.pdf: %.ps
	ps2pdf $< $@

%.ps: %.dvi
	dvips $<

%.dvi: %.tex
	latex -interaction=nonstopmode $<
	#bibtex $<
	#makeindex $(name).idx
	latex -interaction=nonstopmode $<
	latex -interaction=nonstopmode $<

	

view: all
	$(viewer) $(name)

clean:
	rm -f *.idx *.dvi *.log *.aux *.ps nda*.pdf *.bbl *.blg *.ilg *.ind *.lof *.out *.toc *.snm *.nav


