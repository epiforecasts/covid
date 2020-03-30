## Packages
library(magrittr)
library(stringr)
library(purrr)

## Get all countries that are present
countries <- list.dirs("_posts/global/nowcast/national", recursive = FALSE) %>%
  stringr::str_remove("_posts/global/nowcast/national/")


## Countries with regional breakdowns
regional_breakdowns <- c("Italy", "United Kingdom", "United States of America", "Germany")

## Drop these countries
countries <- setdiff(countries, regional_breakdowns)


## Load function to generate report template
source("utils/write_national_report.R")

## Walk through list and generate
purrr::walk(countries, write_national_report)