.PHONY: all clean

# Default target: build the PDF and DOCX
all: build/paper.pdf build/paper.docx

# Convert Markdown to PDF using Pandoc and Tectonic
build/paper.pdf: paper.md
	@mkdir -p build  # Ensure the target directory exists
	@if grep -q "number-sections: true" paper.md; then \
		pandoc paper.md --template=template/pdf/pdflatex.pandoc-template --lua-filter=lua-filters/pagebreak/pagebreak.lua --filter pandoc-crossref --citeproc -o build/paper.pdf --pdf-engine=tectonic --number-sections; \
	else \
		pandoc paper.md --template=template/pdf/pdflatex.pandoc-template --lua-filter=lua-filters/pagebreak/pagebreak.lua --filter pandoc-crossref --citeproc -o build/paper.pdf --pdf-engine=tectonic; \
	fi

# Convert Markdown to DOCX using Pandoc
build/paper.docx: paper.md
	@mkdir -p build  # Ensure the target directory exists
	@if grep -q "number-sections: true" paper.md; then \
		pandoc paper.md --template=template/docx/docx.pandoc-template --lua-filter=lua-filters/pagebreak/pagebreak.lua --reference-doc=template/docx/styles.docx --filter pandoc-crossref --citeproc -o build/paper.docx --number-sections; \
	else \
		pandoc paper.md --template=template/docx/docx.pandoc-template --lua-filter=lua-filters/pagebreak/pagebreak.lua --reference-doc=template/docx/styles.docx --filter pandoc-crossref --citeproc -o build/paper.docx; \
	fi

# Clean up generated files
clean:
	rm -f build/paper.pdf build/paper.docx paper.tex
