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

all: Geoestadistica-slide.pdf

document/Geoestadistica-book.pdf:	
	cd document $(cmdsep) make $(cmdsep) cd ..

Geoestadistica-slide.dvi: document/Geoestadistica-book.pdf Geoestadistica-slide.tex
	latex -interaction=nonstopmode Geoestadistica-slide.tex
	#bibtex Geoestadistica-slide
	#makeindex Geoestadistica-slide.idx
	latex -interaction=nonstopmode Geoestadistica-slide.tex
	latex -interaction=nonstopmode Geoestadistica-slide.tex

Geoestadistica-slide.ps: Geoestadistica-slide.dvi
	dvips -o Geoestadistica-slide.ps Geoestadistica-slide.dvi

Geoestadistica-slide.pdf: Geoestadistica-slide.ps
	ps2pdf Geoestadistica-slide.ps

view: all
	$(viewer) Geoestadistica-slide.pdf

clean:
	cd document $(cmdsep) make clean $(cmdsep) cd ..
	rm -f *.idx *.dvi *.log *.aux *.ps *.pdf *.bbl *.blg *.ilg *.ind *.lof *.out *.toc *.snm *.nav

