require(stringr)
require(magrittr)
require(purrr)

posts <- c(list.dirs("docs/posts", recursive = FALSE), 
           list.dirs("docs/posts/national", recursive = FALSE))


purrr::walk(posts, 
            function(post) {
              unlink(file.path(file.path(post, "nowcast")), recursive = TRUE)
            })


remove_folders <- list.dirs("_posts/national", recursive = FALSE) %>% 
  stringr::str_remove("_posts/national/")

## Countries with regional breakdowns
regional_breakdowns <- c("italy", "united-kingdom", "united-states", "germany",
                         "india", "brazil", "colombia", "afghanistan", 
                         "russia")

## Drop these countries
remove_folders <- setdiff(remove_folders, regional_breakdowns)

purrr::walk(remove_folders, 
           function(folder) {
             unlink(file.path("_posts/national", folder), recursive = TRUE)
           })