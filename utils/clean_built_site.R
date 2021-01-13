require(stringr)
require(magrittr)
require(purrr)

remove_folders <- list.dirs("_posts/national", recursive = FALSE) %>% 
  stringr::str_remove("_posts/national/")
## Countries with regional breakdowns
regional_breakdowns <- readRDS(here::here("data", "subnational_estimates.rds"))

## Drop these countries
remove_folders <- setdiff(remove_folders, regional_breakdowns)

purrr::walk(remove_folders, 
           function(folder) {
             unlink(file.path("_posts/national", folder), recursive = TRUE)
           })

## Remove subnational
remove_folders <- list.dirs("_posts/subnational", recursive = FALSE) %>% 
  stringr::str_remove("_posts/subnational/")

purrr::walk(remove_folders, 
            function(folder) {
              unlink(file.path("_posts/subnational", folder), recursive = TRUE)
            })
