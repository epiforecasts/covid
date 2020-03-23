require(stringr)
require(magrittr)
require(furrr)
require(future)

posts <- list.dirs("_posts", recursive = FALSE) %>% 
  stringr::str_remove("_posts/")


future::plan("multiprocess")

rendered_posts <- furrr::future_map(posts, 
            function(post) {
              file.copy("library.bib", file.path("_posts", post), overwrite = TRUE)
              rmarkdown::render(file.path("_posts", post, paste0(post, ".Rmd")))
            }, .progress = TRUE)
