
# Knitr options -----------------------------------------------------------
knitr::opts_chunk$set(echo = FALSE, eval = TRUE,
                      message = FALSE,
                      warning = FALSE,
                      fig.height = 12,
                      fig.width = 12,
                      dpi = 300)

# Load packages -----------------------------------------------------------
library(EpiNow2)
library(data.table)
library(covidregionaldata)
library(dplyr)
library(magrittr)
library(rnaturalearth)
library(sf)
library(rmarkdown)
library(here)
library(stringr)
library(ggplot2)
library(DT)

interactive <- TRUE

# Load summary data -------------------------------------------------------
summary_table <- data.table::fread(here::here("covid-rt-estimates", "subnational", 
                                              folder, "cases", 
                                              "summary", "summary_table.csv"))

summary_table$`Expected change in daily cases` <- 
  factor(summary_table$`Expected change in daily cases`, 
         levels = c("Increasing", "Likely increasing", "Stable", "Likely decreasing", "Decreasing"))

latest_date <- readRDS(here::here("covid-rt-estimates", "subnational", folder,
                                  "cases", "summary", "latest_date.rds"))

# Build widget ------------------------------------------------------------
if (!exists("region_var")) {
  region_var <- "region"
}

  # Read in each summary folder
base_path <- "https://raw.githubusercontent.com/epiforecasts/covid-rt-estimates/master/"
subnational_unit <- "Region"