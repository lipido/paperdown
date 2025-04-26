.PHONY: all clean

# Default target: build the PDF
all: paper.pdf

# Convert Markdown to PDF using Pandoc and Tectonic
paper.pdf: paper.md
	@mkdir -p build  # Ensure the target directory exists
	@if grep -q "number-sections: true" paper.md; then \
		pandoc paper.md --filter pandoc-crossref --citeproc -o build/paper.pdf --pdf-engine=tectonic --number-sections; \
	else \
		pandoc paper.md --filter pandoc-crossref --citeproc -o build/paper.pdf --pdf-engine=tectonic; \
	fi

# Clean up generated files
clean:
	rm -f paper.pdf paper.tex
