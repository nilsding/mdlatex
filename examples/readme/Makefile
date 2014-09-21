all:
	ruby ../../mdlatex.rb README.md > readme_md.latex
	xelatex -shell-escape readme.latex

.PHONY: clean

clean:
	rm -f readme_md.latex *.aux *.pdf *.log *.pyg
