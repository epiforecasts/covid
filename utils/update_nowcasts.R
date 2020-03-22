require(stringr)
require(magrittr)
require(purrr)

nowcasts <- list.dirs("_posts", recursive = FALSE) %>% 
  stringr::str_remove("_posts/")


purrr::walk(nowcasts, 
            function(nowcast) {
              source(file.path("_posts", nowcast, "nowcast/update_nowcasts.R"))
            })
