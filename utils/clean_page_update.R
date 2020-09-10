## Copy library into root to check for issues
file.copy("_posts/global/library.bib", ".", overwrite = FALSE)


## Clean up an misplaced html files
file.remove(list.files()[grep("*.html", list.files())])