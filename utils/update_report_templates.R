## Packages
require(magrittr)
require(stringr)
require(purrr)
require(tibble)
require(dplyr)
require(countrycode)
require(rnaturalearth)


# Countries from nowcast folders ------------------------------------------



countries <- tibble::tibble(country = list.dirs("_nowcasts/covid-global/national", recursive = FALSE) %>%
                              stringr::str_remove("_nowcasts/covid-global/national/")) %>%
  dplyr::mutate(file_name = country %>%
                  stringr::str_replace_all(" ", "-") %>%
                  stringr::str_to_lower(),
                country_code = countrycode::countrycode(country,
                                                        origin = "country.name",
                                                        destination = "iso3c"))

# Get shape file ----------------------------------------------------------

## Country level
world <- rnaturalearth::ne_countries(scale='medium',
                                     returnclass = 'sf')


# Link countries with regions ---------------------------------------------


countries <- countries %>%
  dplyr::left_join(world,
                   by = c("country_code" = "iso_a3")
  ) %>%
  dplyr::select(country, file_name, region = region_un) 



# Manual country fix ------------------------------------------------------

countries <- countries %>% 
  dplyr::mutate(region = region %>% 
                  ifelse(country %in% "Kosovo", "Europe", .)) %>% 
  unique()



# Remove countries with regional breakdowns -------------------------------


## Countries with regional breakdowns
regional_breakdowns <- c("Italy", "United Kingdom", "United States of America", "Germany")


countries <- countries %>%
  dplyr::filter(!country %in% regional_breakdowns) %>%
  dplyr::rowwise() %>%
  dplyr::group_split()


## Load function to generate report template
source("utils/write_national_report.R")

## Walk through list and generate
purrr::walk(countries, write_national_report)
