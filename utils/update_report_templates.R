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
countries_in_data <- covidregionaldata::get_national_data(source = "who") %>% 
  dplyr::select(country, region = un_region) %>% 
  unique() %>% 
  drop_na()

# Get subnational entities
subnational <-
  tibble::tibble(
            area = list.dirs(here::here("covid-rt-estimates/subnational"),
                             recursive = TRUE) %>%
              stringr::str_remove(here::here("covid-rt-estimates/subnational"))
          ) %>%
  filter(str_count(area, "\\/") == 4) %>%
  mutate(area = sub("^\\/", "", area)) %>%
  separate(area, c("country_filename", "data", "national", "area"),
           sep = "\\/") %>%
  mutate(deaths = (data == "deaths")) %>%
  select(country_filename, deaths, area) %>%
  dplyr::mutate(file_name = area %>%
                  stringr::str_replace_all(" ", "-") %>%
                  stringr::str_to_lower(),
                country = stringr::str_to_title(
                                    gsub("-", " ",
                                         sub("-local$", "",
                                             country_filename)))) %>%
  dplyr::left_join(countries_in_data, by = "country") %>%
  dplyr::mutate(region = ifelse(is.na(region), "Unknown", region)) %>% 
  dplyr::filter(!(country %in% "Test"))

# Join and add file_name --------------------------------------------------
countries <- countries %>% 
  dplyr::left_join(countries_in_data, by = "country") %>%
  dplyr::mutate(region = ifelse(is.na(region), "Unknown", region)) %>% 
  dplyr::left_join(countries_with_death_estimates, by = "country") %>% 
  dplyr::mutate(file_name = country %>%
                  stringr::str_replace_all(" ", "-") %>%
                  stringr::str_to_lower()) %>% 
  dplyr::mutate(deaths = tidyr::replace_na(deaths, FALSE))


# Remove countries with regional breakdowns -------------------------------
## Countries with regional breakdowns
regional_breakdowns <- readRDS(here::here("data", "subnational_estimates.rds"))

countries <- countries %>%
  dplyr::filter(!file_name %in% regional_breakdowns) %>%
  dplyr::rowwise() %>%
  dplyr::group_split()

subnational <- subnational %>%
  dplyr::rowwise() %>%
  dplyr::group_split()

## Load function to generate report template
source(here::here("utils", "write_report.R"))
safe_write_report <- purrr::safely(write_report)

## Walk through list and generate
purrr::walk(countries, safe_write_report)

## Walk through list and generate
purrr::walk(subnational, safe_write_report, type = "subnational")
