WIN_SUFFIX = .exe
SHELL_SUFFIX = $(suffix $(SHELL))

name=cv2
ifeq ($(WIN_SUFFIX),$(SHELL_SUFFIX))
        os=windows
	cmdsep=&
	viewer=AcroRd32
else
        os=linux
	cmdsep=;
	viewer=open
endif

all: cv2.pdf cv2.en.pdf

%.pdf: %.tex
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<
	pdflatex -interaction=nonstopmode $<

view: all
	$(viewer) cv2.pdf
	$(viewer) cv2.en.pdf

clean:
	rm -f *.idx *.dvi *.log *.aux *.ps *.pdf *.bbl *.blg *.ilg *.ind *.lof *.out *.toc *.snm *.nav cv2.synctex.gz

