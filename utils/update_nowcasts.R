require(stringr)
require(magrittr)
require(purrr)

nowcasts <- c("global", "united-kingdom", "germany", "italy", "united-states")


purrr::walk(nowcasts, 
            function(nowcast) {
              source(file.path("_posts", nowcast, "nowcast/update_nowcasts.R"))
            })
