require(tibble)
require(dplyr)
require(countrycode)
require(rnaturalearth)


# Countries from nowcast folders ------------------------------------------



countries <- tibble::tibble(country = list.dirs("_posts/global/nowcast/national", recursive = FALSE) %>%
                              stringr::str_remove("_posts/global/nowcast/national/")) %>% 
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
  dplyr::select(country, file_name, region_un)


# Built yaml region -------------------------------------------------------

generate_yaml_entry <- function(country, file) {
  
  paste0(
    "         - text: ", "'", country, "' \n            href: posts/national/", file, "/index.html"
  )
}

national_yaml <- countries %>%
  dplyr::mutate(yaml = purrr::map2_chr(country, file_name, generate_yaml_entry)) %>% 
  dplyr::group_by(region_un) %>% 
  tidyr::nest() %>% 
  dplyr::mutate(region_title = paste0("       - text: '", region_un, "' \n         menu: \n"),
                region_block = purrr::map_chr(data,
                                              ~ paste(.$yaml, collapse = "\n"))) %>% 
  dplyr::ungroup() %>% 
  dplyr::mutate(region_yaml = paste(region_title, region_block, collapse = "\n")) %>% 
  {paste(.$region_yaml, collapse = "\n")}

national_yaml <- paste("    - text: 'National' \n    menu: \n", national_yaml, collapse = "\n")

writeLines(national_yaml, con = "tmp.yaml")


