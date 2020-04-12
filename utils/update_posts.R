require(stringr)
require(magrittr)
require(future)
require(furrr)
require(purrr)

posts <- c("_posts/global" , list.dirs("_posts/national", recursive = FALSE))


future::plan("multiprocess")

safe_render <- purrr::safely(rmarkdown::render)

rendered_output <- furrr::future_map(posts, 
            function(post) {
              post_name <- stringr::str_split(post, "/")[[1]] %>% 
                dplyr::last()
              file.copy("library.bib", file.path(post), overwrite = TRUE)
              
              safe_render(file.path(post, paste0(post_name, ".Rmd")), quiet = FALSE)
            }, .progress = TRUE)
