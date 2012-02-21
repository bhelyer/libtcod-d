# Gnu make Makefile for libtcod-d

DMD = dmd

ifeq ""      '$(COMSPEC)'

	Platform := Unix
	E := @echo
	
else ifneq ""  '$(SHLVL)'

	Platform := Msys
	E := @echo
	
else
	Platform := Windows
	# Note trailing '.'
	E := @echo.
	
endif

ifeq ""    '$(MAKECMDGOALS)'

define message
Do not run make!

The makefile in this directory is used to generate the source code, NOT to
build anything needed to use the library. The archived version should include
the generated source code, so you should only need to start using the library.

Run 'make gen' if you're working on libtcod-d. If you're trying to USE 
libtcod-d, see the examples/ directory for a sample Makefile
endef
$(error $(message))
endif

# For now, 32 bit is the default model
# PS: copied from phobos
ifeq (,$(MODEL))
	MODEL:=32
endif

functions.d_gen := source/tcod/c/functions.d
generated_sources := $(functions.d_gen)

.PHONY: gen
gen: $(generated_sources) ;

genfuncs.d := source/genfunctionsmod.d
function_list.txt := source/functionlist.txt

$(functions.d_gen) : $(genfuncs.d) $(function_list.txt)
	$(DMD) -m$(MODEL) -run $(genfuncs.d) \
		< $(function_list.txt) \
		> $@

.PHONY: clean
clean :: 
	rm $(generated_sources)

