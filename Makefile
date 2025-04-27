.PHONY: all clean

# Default target: build the PDF and DOCX
all: build/paper.latex.pdf build/paper.docx build/paper.html.pdf

# Convert Markdown to PDF using Pandoc and Tectonic
build/paper.latex.pdf: paper.md
	@mkdir -p build  # Ensure the target directory exists
	@if grep -q "number-sections: true" paper.md; then \
		pandoc paper.md --defaults=pandoc-defaults/defaults.latexpdf.yaml --template=template/pdf/pdflatex.pandoc-template --lua-filter=lua-filters/pagebreak/pagebreak.lua --filter pandoc-crossref --citeproc -o build/paper.latex.pdf --pdf-engine=tectonic --number-sections; \
	else \
		pandoc paper.md --defaults=pandoc-defaults/defaults.latexpdf.yaml --template=template/pdf/pdflatex.pandoc-template --lua-filter=lua-filters/pagebreak/pagebreak.lua --filter pandoc-crossref --citeproc -o build/paper.latex.pdf --pdf-engine=tectonic; \
	fi

# Convert Markdown to PDF using weasyprint
build/paper.html.pdf: paper.md
	@mkdir -p build  # Ensure the target directory exists
	@if grep -q "number-sections: true" paper.md; then \
		pandoc paper.md --defaults=pandoc-defaults/defaults.htmlpdf.yaml --css=template/html/style.css --template=template/html/pdfhtml.pandoc-template --lua-filter=lua-filters/pagebreak/pagebreak.lua --filter pandoc-crossref --citeproc -o build/paper.html.pdf --pdf-engine=weasyprint --number-sections; \
	else \
		pandoc paper.md --defaults=pandoc-defaults/defaults.htmlpdf.yaml --css=template/html/style.css --template=template/html/pdfhtml.pandoc-template --lua-filter=lua-filters/pagebreak/pagebreak.lua --filter pandoc-crossref --citeproc -o build/paper.html.pdf --pdf-engine=weasyprint; \
	fi
# Convert Markdown to DOCX using Pandoc
build/paper.docx: paper.md
	@mkdir -p build  # Ensure the target directory exists
	@if grep -q "number-sections: true" paper.md; then \
		pandoc paper.md --defaults=pandoc-defaults/defaults.docx.yaml --template=template/docx/docx.pandoc-template --lua-filter=lua-filters/pagebreak/pagebreak.lua --reference-doc=template/docx/styles.docx --filter pandoc-crossref --citeproc -o build/paper.docx --number-sections; \
	else \
		pandoc paper.md --defaults=pandoc-defaults/defaults.docx.yaml --template=template/docx/docx.pandoc-template --lua-filter=lua-filters/pagebreak/pagebreak.lua --reference-doc=template/docx/styles.docx --filter pandoc-crossref --citeproc -o build/paper.docx; \
	fi

# Clean up generated files
clean:
	rm -f build/*
