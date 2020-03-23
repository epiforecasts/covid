require(stringr)
require(magrittr)
require(purrr)

posts <- list.dirs("docs/posts", recursive = FALSE) %>% 
  stringr::str_remove("docs/posts/")


purrr::walk(posts, 
            function(post) {
              unlink(file.path(file.path("docs/posts", post, "nowcast")), recursive = TRUE)
            })
