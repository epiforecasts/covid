
# Knitr options -----------------------------------------------------------

knitr::opts_chunk$set(echo = FALSE, eval = TRUE,
                      message = FALSE,
                      warning = FALSE,
                      fig.height = 12,
                      fig.width = 12,
                      dpi = 300)

# Load packages -----------------------------------------------------------

library(EpiNow2)
library(dplyr)
library(magrittr)
library(rnaturalearth)
library(sf)
library(rmarkdown)
library(here)
library(stringr)
library(ggplot2)

# Load summary data -------------------------------------------------------

summary_table <- data.table::fread(here::here("covid-rt-estimates", "subnational", 
                                              folder, "cases", 
                                              "summary", "summary_table.csv"))
latest_date <- readRDS(here::here("covid-rt-estimates", "subnational", folder,
                                  "cases", "summary", "latest_date.rds"))



# Region report control parameters ----------------------------------------

summary_tables <- 0
summary_figures <- 1
title_depth <- 3
index <- 1
region_path <- "covid-rt-estimates/national/cases/national"
show_title <- FALSE
report_forecast <- TRUE
interactive <- TRUE

# Region summary control parameters ---------------------------------------

standalone <- FALSE

