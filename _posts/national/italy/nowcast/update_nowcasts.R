
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

saveRDS(region_codes, "_posts/regional-breakdowns/italy/nowcast/data/region_codes.rds")

cases <- cases %>% 
  dplyr::rename(local = cases) %>% 
  dplyr::select(-region_code) %>% 
  dplyr::mutate(imported = 0) %>% 
  tidyr::gather(key = "import_status", value = "cases", local, imported)

# Get linelist ------------------------------------------------------------

linelist <- NCoVUtils::get_international_linelist()

# Set up cores -----------------------------------------------------

future::plan("multiprocess", workers = future::availableCores())

data.table::setDTthreads(threads = 1)

# Run pipeline ----------------------------------------------------

EpiNow::regional_rt_pipeline(
  cases = cases, 
  linelist = linelist, 
  regional_delay = FALSE,
  target_folder = "_posts/regional-breakdowns/italy/nowcast/regional", 
  merge_onsets = FALSE,
  samples = 10
)


# Summarise results -------------------------------------------------------


EpiNow::regional_summary(results_dir = "_posts/regional-breakdowns/italy/nowcast/regional", 
                         summary_dir = "_posts/regional-breakdowns/italy/nowcast/regional-summary",
                         target_date = "latest",
                         region_scale = "Region")