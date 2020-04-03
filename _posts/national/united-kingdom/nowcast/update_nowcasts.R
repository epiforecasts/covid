
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

cases <- NCoVUtils::get_uk_nhs_region_cases()

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
  regional_delay = FALSE,
  target_folder = "_posts/national/united-kingdom/nowcast/regional", 
  merge_onsets = FALSE
)


# Summarise results -------------------------------------------------------

EpiNow::regional_summary(results_dir = "_posts/national/united-kingdom/nowcast/regional", 
                         summary_dir = "_posts/national/united-kingdom/nowcast/regional-summary",
                         target_date = "latest",
                         region_scale = "Region")