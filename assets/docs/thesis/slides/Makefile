WIN_SUFFIX = .exe
SHELL_SUFFIX = $(suffix $(SHELL))

name=Slide
pdf=	Figures/MVCContinuations.pdf \
	Figures/ControlFlow.pdf \
	Figures/States.pdf \
	Figures/Seaside.pdf \
	Figures/DesignPatternAdapter.pdf \
	Figures/DesignPatternComposite.pdf \
	Figures/DesignPatternPublishSubscriber.pdf \
	Figures/DesignPatternBuilder.pdf

ifeq ($(WIN_SUFFIX),$(SHELL_SUFFIX))
        os=windows
	cmdsep=&
	viewer=AcroRd32
	inkscape=inkscape
	dia=dia
else
	platform=$(shell uname -s)
	os=linux
	cmdsep=;
	ifeq ($(platform),Linux)
		inkscape=inkscape
		dia=dia
		viewer=evince
	else
		inkscape=/Applications/Inkscape.app/Contents/Resources/bin/inkscape
			dia=/Applications/Dia.app/Contents/Resources/bin/dia
		viewer=open
		pdflatex=/usr/texbin/pdflatex
	endif
endif

all: Slide.pdf

sync: all
	cp Slide.pdf ~/Google\ Drive/Thesis/
	cp Slide.pdf ~/Dropbox/Thesis/

Slide.pdf: $(name).tex $(name).aux $(name).bbl $(pdf)
	#makeindex $(name).idx
	$(pdflatex) -synctex=1 -interaction=nonstopmode $(name).tex
	$(pdflatex) -synctex=1 -interaction=nonstopmode $(name).tex
	#mptopdf -f -interaction=nonstopmode $(name).uml.mp
	$(pdflatex) -synctex=1 -interaction=nonstopmode $(name).tex
	$(pdflatex) -synctex=1 -interaction=nonstopmode $(name).tex

#Thesis.ps: Thesis.dvi
#	dvips -o $(name).ps $(name).dvi

#Thesis.pdf: Thesis.ps
#	ps2pdf $(name).ps

%.eps: %.dia
	$(dia) -e $@ -t eps $<

%.eps: %.svg
	$(inkscape) $< -E $@

%.eps: %.png
	convert $< $@ 

%.pdf: %.eps
	epstopdf $<

Slide.bbl: $(name).aux Bibliography.bib
	bibtex $(name)

Slide.aux: $(name).tex $(pdf)
	cp ../doc/Missing\ Packages/*.sty .
	$(pdflatex) -synctex=1 -interaction=nonstopmode $(name).tex

view: all
	$(viewer) $(name).pdf &

clean:
	rm -f *.idx *.dvi *.log *.aux *.ps *.pdf *.bbl *.blg *.ilg *.ind *.lof *.out *.toc *.snm *.nav *.lot Figures/*.eps Figures/*.pdf *.mp *.uml* *.sty


