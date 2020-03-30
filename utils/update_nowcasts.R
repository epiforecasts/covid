require(stringr)
require(magrittr)
require(purrr)

nowcasts <- c("global", "regional-breakdowns/united-kingdom", 
              "regional-breakdowns/germany", "regional-breakdowns/italy", 
              "regional-breakdowns/united-states")


purrr::walk(nowcasts, 
            function(nowcast) {
              source(file.path("_posts", nowcast, "nowcast/update_nowcasts.R"))
            })
