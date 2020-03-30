require(stringr)
require(magrittr)
require(future)
require(furrr)

posts <- c("_posts/global" , list.dirs("_posts/regional-breakdowns", recursive = FALSE),
           list.dirs("_posts/national-summary", recursive = FALSE))


future::plan("multiprocess")

rendered_output <- furrr::future_map(posts, 
            function(post) {
              post_name <- stringr::str_split(post, "/")[[1]] %>% 
                dplyr::last()
              file.copy("library.bib", file.path(post), overwrite = TRUE)
              
              rmarkdown::render(file.path(post, paste0(post_name, ".Rmd")), quiet = FALSE)
            }, .progress = TRUE)
