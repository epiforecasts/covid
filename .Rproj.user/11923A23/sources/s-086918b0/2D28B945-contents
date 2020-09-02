
# Knitr options -----------------------------------------------------------

knitr::opts_chunk$set(echo = FALSE, eval = TRUE,
                      message = FALSE,
                      warning = FALSE,
                      fig.height = 12,
                      fig.width = 12,
                      dpi = 300)

# Load packages -----------------------------------------------------------

library(EpiNow2)
library(covidregionaldata)
library(RtD3)
library(dplyr)
library(magrittr)
library(rnaturalearth)
library(sf)
library(rmarkdown)
library(here)
library(stringr)
library(ggplot2)


# Options ----------------------------------------------------------------


## Force data.table to use numerics for integer.
options(datatable.integer64 = "numeric")

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

# Build widget ------------------------------------------------------------

if (!exists("region_var")) {
  region_var <- "region"
}

base_path <- "https://raw.githubusercontent.com/epiforecasts/covid-rt-estimates/master/subnational/"
# Read in each summary folder
rtData <- list("Cases" = RtD3::readInEpiNow2(path = paste0(base_path, folder, "/cases/summary"),
                                             region_var = region_var))


# Add in national level data
source(here::here("utils", "get_national_RtD3_data.R"))

rtData <- get_national_RtD3_data(rtData, country = region)

widget <- RtD3::summaryWidget(
  geoData = geoData,
  rtData = rtData,
  activeArea = region
)

widget_caption <- paste0("*The results of the latest reproduction number estimates
                         (based on estimated confirmed cases with a date of infection on 
                         the ", latest_date , ") can be summarised by whether confirmed 
                         cases are likely increasing or decreasing. This represents the 
                         strength of the evidence that the reproduction number in each region 
                         is greater than or less than 1, respectively (see the
                         [methods](https://epiforecasts.io/covid/methods.html) for details).
                         Click on a subnational area (or search) to see subnational level estimates. 
                         This interactive visualisation is powered by RtD3[@rtd3].*")
