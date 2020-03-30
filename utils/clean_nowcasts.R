require(stringr)
require(magrittr)
require(purrr)

posts <- c(list.dirs("docs/posts", recursive = FALSE), 
           list.dirs("docs/posts/regional-breakdowns", recursive = FALSE))


purrr::walk(posts, 
            function(post) {
              unlink(file.path(file.path(post, "nowcast")), recursive = TRUE)
            })
