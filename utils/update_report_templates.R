## Packages
require(magrittr)
require(stringr)
require(purrr)
require(tibble)
require(dplyr)
require(tidyr)
require(countrycode)
require(rnaturalearth)
require(covidregionaldata)

# Countries from nowcast folders ------------------------------------------

countries <- tibble::tibble(country = list.dirs(here::here("covid-rt-estimates/national/cases/national"), recursive = FALSE) %>%
                              stringr::str_remove(here::here("covid-rt-estimates/national/cases/national/")))


countries_with_death_estimates <-  tibble::tibble(country = list.dirs(here::here("covid-rt-estimates/national/deaths/national"), recursive = FALSE) %>%
                                                    stringr::str_remove(here::here("covid-rt-estimates/national/deaths/national/")),
                                                  deaths = TRUE)


# Get countries regions ---------------------------------------------------

countries_in_data <- covidregionaldata::get_national_data(source = "ecdc") %>% 
  dplyr::select(country, region = un_region) %>% 
  unique()


# Join and add file_name --------------------------------------------------

countries <- countries %>% 
  dplyr::left_join(countries_in_data, by = "country") %>% 
  dplyr::left_join(countries_with_death_estimates, by = "country") %>% 
  dplyr::mutate(file_name = country %>%
                  stringr::str_replace_all(" ", "-") %>%
                  stringr::str_to_lower()) %>% 
  dplyr::mutate(deaths = tidyr::replace_na(deaths, FALSE))


# Remove countries with regional breakdowns -------------------------------


## Countries with regional breakdowns
regional_breakdowns <- c("Italy", "United Kingdom", "United States", "Germany",
                         "Brazil", "India", "Colombia", "Afghanistan", 
                         "Russia", "Canada")


countries <- countries %>%
  dplyr::filter(!country %in% regional_breakdowns) %>%
  dplyr::rowwise() %>%
  dplyr::group_split()


## Load function to generate report template
source("utils/write_national_report.R")

safe_write_national_report <- purrr::safely(write_national_report)

## Walk through list and generate
purrr::walk(countries, safe_write_national_report)
