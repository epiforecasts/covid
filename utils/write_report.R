#' Write an Rmd template for a (sub-)national report
#'
#' @param details A single line data.frame countaining an area's or country's details
#' @param type Whether it is a "national" or "subnational" report
#'
#' @return places an Rmd file in "_posts/national/<loc>.Rmd" or "_posts/subnational/<country>/<loc>.Rmd"
#' @importFrom knitr spin
#' @export
#'
#' @examples
#'
write_report <- function(details = NULL, type = c("national", "subnational")) {

  type <- match.arg(type, choices = c("national", "subnational"))

  region <- details$region
  save_name <- paste0(details$file_name, ".R")
  if (type == "national") {
    loc <- details$country
    locstr <- paste0("Estimates for ", loc)
    deaths <- details$deaths
    summary_folder <- "national"
  } else if (type == "subnational") {
    loc <- details$area
    country <- details$country
    locstr <- paste0("Estimates for ", loc, " (", country, ")")
    deaths <- details$deaths
    summary_folder <- file.path("subnational", details$country_filename)
  }

x <- paste0("#' ---
#' title: ", '"',locstr,'"',"
#' description: |
#'  Identifying changes in the reproduction number, rate of spread, and doubling time during the course of the COVID-19 outbreak whilst accounting for potential biases due to delays in case reporting in ", loc, ". These results are impacted by changes in testing effort, increases and decreases in testing effort will increase and decrease reproduction number estimates respectively.
#'bibliography: library.bib
#'output:
#'  distill::distill_article:
#'    self_contained: true
#'    toc: true
#'    toc_depth: 2
#'categories:
#'  - '", region, "'
#'---
#'
#'
#'*Using data available up to the:* `r Sys.Date()`
#'
#'*Note that it takes time for infection to cause symptoms, to get tested for SARS-CoV-2 infection, for a positive test to return and ultimately to enter the case data presented here. In other words, today’s case data are only informative of new infections about two weeks ago. This is reflected in the plots below, which are by date of infection.*
#'
#'*Estimates are available to download [here](https://dataverse.harvard.edu/dataverse/covid-rt).*
#'
#'*See our see [Methods](https://epiforecasts.io/covid/methods) or our [paper](https://wellcomeopenresearch.org/articles/5-112/) for an explanation of how these estimates are derived.*
#'")

x2 <- paste0("
#+ setup, include = FALSE
knitr::opts_chunk$set(echo = FALSE, eval = TRUE,
                      message = FALSE,
                      warning = FALSE,
                      fig.height = 12,
                      fig.width = 12,
                      dpi = 300)
#'
#+ load-packages, include = FALSE
library(EpiNow2)
library(dplyr)
library(magrittr)
library(rmarkdown)
library(here)

latest_date <- readRDS(here::here('covid-rt-estimates/", summary_folder, "/cases/summary/latest_date.rds'))

#'
#'")

x3 <- paste0("

#+
## Control parameters for region-report
summary_tables <- 0
summary_figures <- 0
title_depth <- 3
index <- 1
region <- \"", loc, "\"
region_path <- \"covid-rt-estimates/", summary_folder, "/cases/national\"
show_title <- FALSE
report_forecast <- TRUE
#'
#'
#+  child = system.file('templates/_region-report.Rmd', package = 'EpiNow2')")

x4 <- paste0("
#+
#'
summary_tables <- 1
summary_figures <- 1
case_def <- 'death'
region_path <- 'covid-rt-estimates/", summary_folder, "/deaths/national'
#'
#' ## Estimates based on reported deaths
#'
#+  child = system.file('templates/_region-report.Rmd', package = 'EpiNow2')")

x <- paste(x,x2,x3)

## Add new template
  suppressWarnings(dir.create(file.path("_posts", summary_folder),
                              recursive = TRUE))

## Write character string as an R file to the directory
  write(x, file = file.path("_posts", summary_folder, save_name))

## Knit the file into a Rmd using the comments for structure
  knitr::spin(file.path("_posts", summary_folder, save_name), knit = FALSE)

## Clean up
  file.remove(file.path("_posts", summary_folder, save_name))

return(invisible(NULL))
}
