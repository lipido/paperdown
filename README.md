# Paperdown: Writing Papers in Markdown

## Overview

Paperdown is a project designed to simplify the process of writing academic papers using Markdown. It leverages Pandoc to convert Markdown files into high-quality PDFs and DOCX documents, while supporting advanced features such as cross-references, automatic numbering, and bibliography generation. This approach allows researchers to focus on content creation without worrying about formatting.

## Features

- **Markdown simplicity**: Write your paper in plain Markdown, making it easy to edit and version control.
- **Cross-references and automatic numbering**: Automatically number and reference tables, figures, equations, and listings.
- **Automatic section numbering**: Sections and subsections are numbered automatically (can be disabled in the metadata section of the `paper.md`).
- **Bibliography generation**: Automatically generate a bibliography from the `references.bib` file (recommendation: use Zotero externally and export your bibliography to `references.bib` with the Better Bibtex plugin of Zotero). Supports citation styles via `.csl` files, such as `vancouver-brackets.csl`, which is specified in the `paper.md` metadata section.

## Getting Started

### Prerequisites

Ensure you have the following installed:
- [Conda](https://docs.conda.io/en/latest/)

### Setting Up the Environment

1. Clone this repository:
   ```bash
   git clone https://github.com/your-repo/paperdown.git
   cd paperdown
   ```

2. Create the Conda environment:
   ```bash
   conda env create -f environment.yml
   ```

3. Activate the environment:
   ```bash
   conda activate paperdown
   ```

### Generating the PDF and DOCX

1. Write your paper in `paper.md`.

2. Use `make` to generate the PDF and DOCX:
   ```bash
   make
   ```

   This will use Pandoc to convert `paper.md` into both a PDF and a DOCX document, applying the specified citation style and formatting. The generated files will be located in the `build/` directory:
   - PDF: `build/paper.pdf`
   - DOCX: `build/paper.docx`

### File Structure

- `paper.md`: The main Markdown file for the paper.
- `references.bib`: The bibliography file (exported from Zotero using Better BibTeX).
- `citation-styles/`: Contains Citation Style Language (CSL) files for formatting references.
- `environment.yml`: Specifies the Conda environment dependencies.

## Example Features

### Cross-references
You can reference tables, figures, equations, and listings using labels. For example:
- Table: `Table [-@tbl:results]`
- Figure: `Figure [-@fig:setup]`
- Equation: `Equation [-@eq:fundamental]`
- Listing: `Listing [-@lst:bubblesort]`

### Bibliography
The bibliography is automatically generated from `references.bib`. Export your references from Zotero using the Better BibTeX plugin.

To cite a paper in the main text, use the following syntax:
- Inline citation: `[@citationKey]` (e.g., "As shown in [@asgariContinuousDistributedRepresentation2015]...")
- Parenthetical citation: `[-@citationKey]` (e.g., "This method is effective [-@asgariContinuousDistributedRepresentation2015].")

### Automatic Numbering
Sections, tables, figures, and listings are automatically numbered, ensuring consistency throughout the document.

### Page breaks
Add `\newpage` to create a page break in your markdown. Thanks to the [pagebreak lua filter](https://github.com/pandoc-ext/pagebreak), this LaTeX command is translated not only to PDF output, but also to another formats such as DOCX.

### Templates
Pandoc uses a template engine to translate the markdown metadata content (at the start of the `paper.md`) to low level formats, in this case, OpenXML for DOCX and LaTeX for PDF (since tectonic pdf-engine is used, see the Makefile).

For convenience, we have dumped the default templates in the `template` subdir, in order to freely edit them to customize your output:

- `template/pdf/pdflatex.pandoc-template`: controls how LaTeX content is generated from the Markdown meta-data contents.
- `template/docx/docx.pandoc-template`: controls how OpenXML is generated from the Markdown meta-data contents.
- `template/docx/styles.docx`: A DOCX to edit only customize the styles.

## Contributing

Feel free to submit issues or pull requests to improve this project.

## License

This project is licensed under the MIT License.
