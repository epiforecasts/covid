require(stringr)
require(magrittr)
require(furrr)
require(future)

posts <- c("_posts/global" , list.dirs("_posts/regional-breakdowns", recursive = FALSE))


future::plan("multiprocess")

rendered_posts <- furrr::future_map(posts, 
            function(post) {
              post_name <- stringr::str_split(post, "/")[[1]] %>% 
                dplyr::last()
              file.copy("library.bib", file.path(post), overwrite = TRUE)
              rmarkdown::render(file.path(post, paste0(post_name, ".Rmd")))
            }, .progress = TRUE)
