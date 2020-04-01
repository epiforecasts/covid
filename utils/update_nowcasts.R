require(stringr)
require(magrittr)
require(purrr)

nowcasts <- c("global", "national/united-kingdom", 
              "national/germany", "national/italy", 
              "national/united-states")


purrr::walk(nowcasts, 
            function(nowcast) {
              source(file.path("_posts", nowcast, "nowcast/update_nowcasts.R"))
            })
