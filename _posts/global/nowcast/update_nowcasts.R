
# Packages -----------------------------------------------------------------
require(EpiNow)
require(NCoVUtils)
require(furrr)
require(future)
require(dplyr)
require(tidyr)
require(magrittr)



# Get cases ---------------------------------------------------------------

NCoVUtils::reset_cache()

cases <- NCoVUtils::get_ecdc_cases() %>% 
  NCoVUtils::format_ecdc_data()

cases <- cases %>% 
  dplyr::rename(local = cases) %>% 
  dplyr::mutate(imported = 0) %>% 
  tidyr::gather(key = "import_status", value = "cases", local, imported)

# Get linelist ------------------------------------------------------------

linelist <-  NCoVUtils::get_international_linelist()

# Set up cores -----------------------------------------------------

future::plan("multiprocess", workers = future::availableCores())

data.table::setDTthreads(threads = 1)

# Run pipeline ----------------------------------------------------

EpiNow::regional_rt_pipeline(
  cases = cases, 
  linelist = linelist, 
  target_folder = "_posts/global/nowcast/national",
  case_limit = 100,
  samples = 10
)


# Summarise results -------------------------------------------------------

EpiNow::regional_summary(results_dir = "_posts/global/nowcast/national", 
                         summary_dir = "_posts/global/nowcast/national-summary",
                         target_date = "latest",
                         region_scale = "Country/Region")