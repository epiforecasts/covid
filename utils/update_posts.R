require(stringr)
require(magrittr)
require(future)
require(furrr)
require(purrr)

posts <- c("_posts/global" , list.dirs("_posts/national", recursive = FALSE))



## Copy in bib file for references
purrr::walk(posts, ~ file.copy("library.bib", file.path(.), overwrite = TRUE))


## Set up processing
future::plan("multisession")

## Make rendering safe to errors
safe_render <- purrr::safely(rmarkdown::render)

## Render posts in parallel
rendered_output <- furrr::future_map(posts, 
            function(post) {
              post_name <- stringr::str_split(post, "/")[[1]] %>% 
                dplyr::last()
              safe_render(file.path(post, paste0(post_name, ".Rmd")), quiet = FALSE)
            }, .progress = TRUE)



file.copy("_posts/global/library.bib", ".", overwrite = FALSE)