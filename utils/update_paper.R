require(rmarkdown)


## Copy master bib into resources folder
file.copy("library.bib", "_paper/resources/", overwrite = TRUE)

## Render into word and pdf
rmarkdown::render("_paper/paper.Rmd", output_format = c("pdf_document", "bookdown::word_document2"))