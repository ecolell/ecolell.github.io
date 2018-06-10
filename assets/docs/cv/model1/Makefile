WIN_SUFFIX = .exe
SHELL_SUFFIX = $(suffix $(SHELL))

name=cv1
ifeq ($(WIN_SUFFIX),$(SHELL_SUFFIX))
        os=windows
	cmdsep=&
	viewer=AcroRd32
else
        os=linux
	cmdsep=;
	viewer=evince
endif

all: cv1.pdf

cv1.dvi: cv1.tex
	latex -interaction=nonstopmode $(name).tex
	#bibtex $(name)
	#makeindex $(name).idx
	latex -interaction=nonstopmode $(name).tex
	latex -interaction=nonstopmode $(name).tex

cv1.ps: cv1.dvi
	dvips -o $(name).ps $(name).dvi

cv1.pdf: cv1.ps
	ps2pdf $(name).ps

view: all
	$(viewer) $(name).pdf

clean:
	rm -f *.idx *.dvi *.log *.aux *.ps *.pdf *.bbl *.blg *.ilg *.ind *.lof *.out *.toc *.snm *.nav cv1.synctex.gz
