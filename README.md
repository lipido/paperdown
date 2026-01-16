# Paperdown: Writing Papers in Markdown

## Overview

Paperdown is a project designed to simplify the process of writing academic papers using Markdown. It leverages Pandoc to convert Markdown files into high-quality PDFs and DOCX documents, while supporting advanced features such as cross-references, automatic numbering, and bibliography generation. This approach allows researchers to focus on content creation without worrying about formatting.

## Features

- **Markdown simplicity**: Write your paper in plain Markdown, making it easy to edit and version control.
- **Cross-references and automatic numbering**: Automatically number and reference tables, figures, equations, and listings.
- **Automatic section numbering**: Sections and subsections are numbered automatically (can be disabled in the `paper.md` metadata).
- **Bibliography generation**: Generate a bibliography automatically from the `references.bib` file. Use Zotero with the Better BibTeX plugin to export your bibliography. Citation styles (e.g., `vancouver-brackets.csl`) are specified in the `paper.md` metadata.

## Getting Started

### Prerequisites

Ensure the following are installed:
- [Conda](https://docs.conda.io/en/latest/)
- [CodeBraid Preview VSCode extension](https://marketplace.visualstudio.com/items?itemName=gpoore.codebraid-preview) (highly recommended): Provides a live preview of Markdown using Pandoc, supporting advanced features like cross-references and bibliographies. It is preconfigured (`.vscode/settings.json`) to integrate with your HTML+PDF templates and CSS styles (located in `template/html`).
   - Note: you do not need to install Pandoc system-wide for this extension, you can reuse the Conda environment (see next section).

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
   To update an existing environment:
   ```bash
   conda env update -f environment.yml
   ```
   
3. Activate the environment:
   ```bash
   conda activate paperdown
   ```

4. If using the CodeBraid Preview extension, launch VSCode from the terminal **within the Conda environment** to avoid installing Pandoc system-wide, as the extension can invoke it directly:
   ```bash   
   code .
   ```

### Generating the PDF and DOCX

1. Write your paper in `paper.md`.

2. Use `make` to generate the PDF and DOCX:
   ```bash
   make
   ```

   This will use Pandoc to convert `paper.md` into two PDF documents (one via LaTeX/Tectonic, another via HTML/WeasyPrint) and a DOCX document, applying the specified citation style and formatting. The generated files will be located in the `build/` directory:
   - LaTeX-based PDF: `build/paper.latex.pdf`
   - HTML-based PDF: `build/paper.html.pdf` (more customizable via CSS)
   - DOCX: `build/paper.docx`

### File Structure

- `paper.md`: The main Markdown file for the paper.
- `references.bib`: The bibliography file (exported from Zotero using Better BibTeX).
- `citation-styles/`: Contains Citation Style Language (CSL) files for formatting references.
- `environment.yml`: Specifies the Conda environment dependencies.
- `pandoc-defaults/`: Contains YAML files with default Pandoc options for different output formats (e.g., `defaults.latexpdf.yaml`, `defaults.htmlpdf.yaml`, `defaults.docx.yaml`), reducing the need to modify the `Makefile`.
- `template/`: Contains templates for customizing the output formats.

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
Pandoc uses a template engine to translate the markdown metadata content (at the start of the `paper.md`) to low level formats. This project uses templates for LaTeX (via Tectonic for PDF), HTML (via WeasyPrint for PDF), and OpenXML (for DOCX).

For convenience, we have dumped the default templates in the `template` subdir, in order to freely edit them to customize your output:

- `template/pdf/pdflatex.pandoc-template`: controls how LaTeX content is generated from the Markdown meta-data contents for the LaTeX-based PDF.
- `template/html/pdfhtml.pandoc-template`: controls how HTML content is generated for the HTML-based PDF.
- `template/html/style.css`: CSS file to customize the appearance of the HTML-based PDF output. This offers more flexibility for styling compared to the LaTeX route.
- `template/docx/docx.pandoc-template`: controls how OpenXML is generated from the Markdown meta-data contents for the DOCX output.
- `template/docx/styles.docx`: A DOCX file used as a reference to define styles for the DOCX output. Edit this file to customize DOCX styles.

### Live preview with CodeBraid Preview
You can take advantage of this extension, that allows you to see a more camera-ready version of the Markdown, as well as supporting all the features (cross-references, bibliography, etc).

There is a current limitation: equations are not correctly numbered and cross-referenced in the live preview, since CodeBraid forces to use `katex` a formula engine, which do not support cross-referencing. Don't worry, the generated PDFs and DOCX work correctly.

#### Knowing issues
- Cross-references may occasionally fail. Renaming the cross-reference or rephrasing the table's caption and/or its identifier often resolves the issue. Avoid using the word "table" in the table's caption to minimize problems.

## Contributing

Feel free to submit issues or pull requests to improve this project.

## License

This project is licensed under the MIT License.
