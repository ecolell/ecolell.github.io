WIN_SUFFIX = .exe
SHELL_SUFFIX = $(suffix $(SHELL))

name=Thesis
pdf=	Figures/ContextAwareSystems.pdf \
	Figures/SUComponent.pdf \
	Figures/Meteoroid.pdf \
	Figures/FeedbackControlSystem.pdf \
	Figures/BasicAdaptationCycle.pdf \
	Figures/Screenshot_2012-06-03-01-43-29.pdf \
	Figures/ConditionComposite.pdf \
	Figures/ListenerAbstraction.pdf \
	Figures/TriggerNotification.pdf \
	Figures/SequenceNotificationDiagram.pdf \
	Figures/SequenceNotificationFalseDiagram.pdf \
	Figures/ProxyObjectHierarchy.pdf \
	Figures/ServerSerializer.pdf \
	Figures/ServerBuilders.pdf \
	Figures/UMLClassDiagram.pdf \
	Figures/UMLWAStoreModelClassDiagram.pdf \
	Figures/bookstoreNetResultSeasideUMLSequenceDiagram.pdf \
	Figures/bookstoreNetfillCartSeasideUMLSequenceDiagram.pdf \
	Figures/bookstoreNetSeasideUMLSequenceDiagram.pdf \
	Figures/satImageWithPolygon.pdf \
	Figures/devicePostures.pdf

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
		pdflatex=pdflatex
	endif
endif

all: Thesis.pdf

sync: all
	cp Thesis.pdf ~/Google\ Drive/Thesis/
	cp Thesis.pdf ~/Dropbox/Thesis/

Thesis.pdf: $(name).tex $(name).aux $(name).bbl $(pdf)
	#makeindex $(name).idx
	$(pdflatex) -f -interaction=nonstopmode $(name).tex
	$(pdflatex) -f -interaction=nonstopmode $(name).tex
	mptopdf -f -interaction=nonstopmode $(name).uml.mp
	$(pdflatex) -f -interaction=nonstopmode $(name).tex
	$(pdflatex) -f -interaction=nonstopmode $(name).tex

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

Thesis.bbl: $(name).aux References/Bibliography.bib
	bibtex $(name)

Thesis.aux: $(name).tex $(pdf)
	cp Missing\ Packages/*.sty .
	$(pdflatex) -f -interaction=nonstopmode $(name).tex

view: all
	$(viewer) $(name).pdf &

clean:
	rm -f *.idx *.dvi *.log *.aux *.ps *.pdf *.bbl *.blg *.ilg *.ind *.lof *.out *.toc *.snm *.nav *.lot Figures/*.eps Figures/*.pdf *.mp *.uml* *.sty


