#' Write an Rmd template for a specified location
#'
#' @param loc string of location to create Rmd file for
#'
#' @return places an Rmd file in "_posts/<loc>.Rmd"
#' @importFrom stringr str_to_title
#' @importFrom knitr spin
#' @export
#'
#' @examples
#' 
write_rmd <- function(loc = NULL){

locstr <- paste0("Estimates for ",stringr::str_to_title(loc))

x <- paste0("#' ---
#' title:", '"',locstr,'"',"
#' description: |
#'  Identifying changes in the reproduction number, rate of spread, and doubling time during the course of the COVID-19 outbreak whilst accounting for potential biases due to delays in case reporting in Australia.
#'bibliography: library.bib
#'output:
#' distill::distill_article:
#' self_contained: true
#'toc: true
#'toc_depth: 3
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
#+ load-packages, include = FALSE}
library(EpiNow)
library(dplyr)
library(rmarkdown)
library(here)
#'"

x3 <- paste0("

#' National summary

#+
## Control parameters for region-report
summary_tables <- 0
summary_figures <- 0
title_depth <- 3
index <- 1
region <-",loc,"
path <- '_posts/global'
show_title <- FALSE
#'
#'
#+  child = '../../templates/_region-report.Rmd'}")

x <- paste(x,x2,x3)

if(!file.exists(paste0("_posts/",loc)){
  dir.create(paste0("_posts/",loc))
}

write(x, file = paste0("_posts/",loc,"/temp.R"))
knitr::spin(paste0("_posts/",loc,"/temp.R"), knit = FALSE)
file.remove(paste0("_posts/",loc,"/temp.R"))
}


