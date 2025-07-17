# CV Build System with Nix Integration
# Usage: make        - Build PDF
#        make clean  - Clean generated files

# Check if we're in nix-shell, if not, re-run in nix-shell
ifndef IN_NIX_SHELL
pdf:
	nix-shell --run "make pdf"

clean:
	nix-shell --run "make clean"

all: pdf

else
# We're in nix-shell, do the actual work
pdf: cv_short.pdf

cv_short.pdf: cv_short.tex sections/*.tex
	latexmk -pdf -interaction=nonstopmode cv_short.tex
	latexmk -c

clean:
	latexmk -c
	rm -f *.pdf

all: pdf

endif

.PHONY: pdf clean all