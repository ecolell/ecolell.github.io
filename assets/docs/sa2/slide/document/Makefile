WIN_SUFFIX = .exe
SHELL_SUFFIX = $(suffix $(SHELL))

ifeq ($(WIN_SUFFIX),$(SHELL_SUFFIX))
        os=windows
	cmdsep=&
	viewer=AcroRd32
else
        os=linux
	cmdsep=;
	viewer=evince
endif

all: Geoestadistica-book.pdf

graphs:
	cd graph $(cmdsep) octave init.$(os).m $(cmdsep) cd ..

Geoestadistica-book.dvi: graphs Geoestadistica-book.tex
	latex -interaction=nonstopmode Geoestadistica-book.tex
	bibtex Geoestadistica-book
	makeindex Geoestadistica-book.idx
	latex -interaction=nonstopmode Geoestadistica-book.tex
	latex -interaction=nonstopmode Geoestadistica-book.tex

Geoestadistica-book.ps: Geoestadistica-book.dvi
	dvips -o Geoestadistica-book.ps Geoestadistica-book.dvi

Geoestadistica-book.pdf: Geoestadistica-book.ps
	ps2pdf Geoestadistica-book.ps

view: all
	$(viewer) Geoestadistica-book.pdf

clean:
	rm -f *.idx *.dvi *.log *.aux *.ps *.pdf *.bbl *.blg *.ilg *.ind *.lof *.out *.toc graph/*.eps

