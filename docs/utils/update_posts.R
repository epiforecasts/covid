require(stringr)
require(magrittr)
require(purrr)

posts <- list.dirs("_posts", recursive = FALSE) %>% 
  stringr::str_remove("_posts/")


purrr::walk(posts, 
            function(post) {
              file.copy("library.bib", file.path("_posts", post))
              rmarkdown::render(file.path("_posts", post, paste0(post, ".Rmd")))
            })
