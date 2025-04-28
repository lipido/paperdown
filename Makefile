.PHONY: all clean

# Variables
PANDOC_COMMON_FLAGS = --lua-filter=lua-filters/pagebreak/pagebreak.lua --filter pandoc-crossref --citeproc
MKDIR_BUILD = @mkdir -p build

# Default target: build the PDF and DOCX
all: build/paper.latex.pdf build/paper.docx build/paper.html.pdf

# Convert Markdown to PDF using Pandoc and Tectonic
build/paper.latex.pdf: paper.md
	$(MKDIR_BUILD)
	@pandoc paper.md \
		--defaults=pandoc-defaults/defaults.latexpdf.yaml \
		--template=template/pdf/pdflatex.pandoc-template \
		$(PANDOC_COMMON_FLAGS) \
		-o $@ \
		--pdf-engine=tectonic

# Convert Markdown to PDF using weasyprint
build/paper.html.pdf: paper.md
	$(MKDIR_BUILD)
	@pandoc paper.md \
		--defaults=pandoc-defaults/defaults.htmlpdf.yaml \
		--css=template/html/style.css \
		--template=template/html/pdfhtml.pandoc-template \
		$(PANDOC_COMMON_FLAGS) \
		-o $@ \
		--pdf-engine=weasyprint

# Convert Markdown to DOCX using Pandoc
build/paper.docx: paper.md
	$(MKDIR_BUILD)
	@pandoc paper.md \
		--defaults=pandoc-defaults/defaults.docx.yaml \
		--template=template/docx/docx.pandoc-template \
		--reference-doc=template/docx/styles.docx \
		$(PANDOC_COMMON_FLAGS) \
		-o $@
# Clean up generated files
clean:
	rm -f build/*
