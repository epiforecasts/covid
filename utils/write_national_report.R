#' Write an Rmd template for a national report
#'
#' @param loc string of location to create Rmd file for
#'
#' @return places an Rmd file in "_posts/national-summary/<loc>.Rmd"
#' @importFrom knitr spin
#' @export
#'
#' @examples
#' 
write_national_report <- function(loc = NULL){

locstr <- paste0("Estimates for ", loc)
save_name <- stringr::str_replace(loc, " ", "-")
save_name <- stringr::str_to_lower(save_name)

x <- paste0("#' ---
#' title: ", '"',locstr,'"',"
#' description: |
#'  Identifying changes in the reproduction number, rate of spread, and doubling time during the course of the COVID-19 outbreak whilst accounting for potential biases due to delays in case reporting in ", loc, ".
#'bibliography: library.bib
#'output:
#'  distill::distill_article:
#'    self_contained: true
#'    toc: true
#'    toc_depth: 2
#'--- 
#'
#'")
  
x2 <- "
#+ setup, include = FALSE
knitr::opts_chunk$set(echo = FALSE, eval = TRUE,
                      message = FALSE,
                      warning = FALSE,
                      fig.height = 12, 
                      fig.width = 12,
                      dpi = 320)
#'
#+ load-packages, include = FALSE
library(EpiNow)
library(dplyr)
library(rmarkdown)
library(here)

latest_date <- readRDS(here::here('_posts/global/nowcast/national-summary/latest_date.rds'))
#'"

x3 <- paste0("

#+
## Control parameters for region-report
summary_tables <- 0
summary_figures <- 0
title_depth <- 2
index <- 1
region <-'",loc,"'
region_path <- '_posts/global/nowcast/national'
show_title <- FALSE
#'
#'
#+  child = system.file('templates/_region-report.Rmd', package = 'EpiNow')")

x <- paste(x,x2,x3)

## Remove old template and add new one
unlink(paste0("_posts/national-summary/",save_name), recursive = TRUE, force = TRUE)
dir.create(paste0("_posts/national-summary/",save_name), recursive = TRUE)

## Write character string as an R file to the directory
write(x, file = paste0("_posts/national-summary/",save_name,"/", save_name, ".R"))

## Knit the file into a Rmd using the comments for structure
knitr::spin(paste0("_posts/national-summary/",save_name,"/", save_name, ".R"), knit = FALSE)

## Clean up
file.remove(paste0("_posts/national-summary/",save_name,"/", save_name, ".R"))

return(invisible(NULL))
}


