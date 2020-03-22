
# Packages -----------------------------------------------------------------
require(EpiNow)
require(NCoVUtils)
require(furrr)
require(future)
require(readr)
require(dplyr)
require(tidyr)
require(purrr)
require(magrittr)



# Get cases ---------------------------------------------------------------

NCoVUtils::reset_cache()

cases <- NCoVUtils::get_italy_regional_cases()


region_codes <- cases %>% 
  dplyr::select(region, region_code) %>% 
  unique() %>% 
  dplyr::mutate(region_code = as.numeric(region_code))

saveRDS(region_codes, "_posts/italy/nowcast/data/region_codes.rds")

cases <- cases %>% 
  dplyr::rename(local = cases) %>% 
  dplyr::select(-region_code) %>% 
  dplyr::mutate(imported = 0) %>% 
  tidyr::gather(key = "import_status", value = "cases", local, imported)

# Get linelist ------------------------------------------------------------

linelist <- #' Get a combined linelist based on multiple countries data
    NCoVUtils::get_international_linelist("Germany") %>%
      dplyr::bind_rows(NCoVUtils::get_international_linelist("Italy")) %>%
      dplyr::bind_rows(NCoVUtils::get_international_linelist("France")) %>%
      dplyr::bind_rows(NCoVUtils::get_international_linelist("Spain")) %>%
      dplyr::bind_rows(NCoVUtils::get_international_linelist("Autria")) %>%
      dplyr::bind_rows(NCoVUtils::get_international_linelist("Netherlands")) %>%
      dplyr::bind_rows(NCoVUtils::get_international_linelist("Belgium")) %>%
      tidyr::drop_na(report_delay)

# Set up cores -----------------------------------------------------

future::plan("multiprocess", workers = future::availableCores())

data.table::setDTthreads(threads = 1)

# Run pipeline ----------------------------------------------------

EpiNow::regional_rt_pipeline(
  cases = cases, 
  linelist = linelist, 
  regional_delay = FALSE,
  target_folder = "_posts/italy/nowcast/results", 
  merge_onsets = FALSE
)


# Summarise results -------------------------------------------------------


EpiNow::regional_summary(results_dir = "_posts/italy/nowcast/results", 
                         summary_dir = "_posts/italy/nowcast/summary",
                         target_date = "latest",
                         region_scale = "Region")