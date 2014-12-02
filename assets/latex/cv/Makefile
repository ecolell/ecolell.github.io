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
	cd model1 $(cmdsep) make $(cmdsep) cd ..
	cd model2 $(cmdsep) make $(cmdsep) cd ..

clean:
	cd model1 $(cmdsep) make clean $(cmdsep) cd ..
	cd model2 $(cmdsep) make clean $(cmdsep) cd ..
