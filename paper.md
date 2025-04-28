---
title: "The Future of Writing Papers"
abstract: |
  Paperdown is a project designed to simplify the process of writing academic papers using Markdown.
  It leverages Pandoc to convert Markdown files into high-quality PDFs and DOCX documents, while
  supporting advanced features such as cross-references, automatic numbering, and bibliography
  generation. This approach allows researchers to focus on content creation without worrying
  about formatting.
author:
- Daniel Glez-Peña
- John Doe
date: "2025-04-25"
bibliography: references.bib
csl: citation-styles/vancouver-brackets.csl  # (Citation Style Language file for formatting)
---

# Introduction

Write your introduction here [@acunerozbabacanTransientProteinProtein2011] [@asgariContinuousDistributedRepresentation2015].

# Materials and methods

The following formula [@eq:foundamental] represents...

$$
\int_{a}^{b} f(x) \, dx = F(b) - F(a)
$$ {#eq:foundamental}

The pseudocode for the Bubble Sort algorithm is shown in Listing [-@lst:bubblesort]:

```plaintext {#lst:bubblesort caption="Pseudo code of bubble sort"}
procedure BubbleSort(A: list of items)
    n := length(A)
    for i from 1 to n - 1 do
        for j from 0 to n - i - 1 do
            if A[j] > A[j + 1] then
                swap(A[j], A[j + 1])
            end if
        end for
    end for
end procedure
```
The following Listing [-@lst:javahelloworld] shows a small Java program.

```java {#lst:javahelloworld caption="A Java Hello World program"}
class HelloWorld {
    public static void main(String[] args) {
        System.out.println("hello!");
    }
}
```

\newpage
# Results

As Figure [-@fig:setup] shows...

![Experimental setup and results visualization.](figures/figure1.png){#fig:setup}

The experimental results demonstrate significant improvements across all metrics.

Table [-@tbl:earth] and Table [-@tbl:antarcticavsearth] summarize the measures.

+---------------------+----------+
| Property            | Earth    |
+=============+=======+==========+
|             | min   | -89.2 °C |
| Temperature +-------+----------+
| 1961-1990   | mean  | 14 °C    |
|             +-------+----------+
|             | max   | 56.7 °C  |
+-------------+-------+----------+
Table: Temparatures in the earth from 1961 to 1990  {#tbl:earth}


+---------------------+-----------------------+
| Location            | Temperature 1961-1990 |
|                     | in degree Celsius     |
|                     +-------+-------+-------+
|                     | min   | mean  | max   |
+=====================+=======+=======+=======+
| Antarctica          | -89.2 | N/A   | 19.8  |
+---------------------+-------+-------+-------+
| Earth               | -89.2 | 14    | 56.7  |
+---------------------+-------+-------+-------+
Table: Temperatures Antartica vs Earth {#tbl:antarcticavsearth}

# Conclusion

Write your conclusion here.

# References
<!-- pandoc will place the references at the end of the paper -->
