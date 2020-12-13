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

all:
	$(MAKE) -C model1 all
	$(MAKE) -C model2 all


view:
	$(MAKE) -C model1 view
	$(MAKE) -C model2 view


macos-install:
	sudo port install \
		texlive-lang-cjk \
		texlive-lang-spanish \
		texlive-lang-chinese \
		texlive-fonts-recommended \
		texlive-latex-recommended \
		texlive-xetex

clean:
	cd model1 $(cmdsep) make clean $(cmdsep) cd ..
	cd model2 $(cmdsep) make clean $(cmdsep) cd ..
