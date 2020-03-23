
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

cases <- get_germany_regional_cases()


region_codes <- cases %>% 
  dplyr::select(region, region_code) %>% 
  unique()

saveRDS(region_codes, "_posts/germany/nowcast/data/region_codes.rds")

cases <- cases %>% 
  dplyr::rename(local = cases) %>% 
  dplyr::mutate(imported = 0) %>% 
  tidyr::gather(key = "import_status", value = "cases", local, imported)

# Get linelist ------------------------------------------------------------

linelist <- NCoVUtils::get_international_linelist("Germany")

# Set up cores -----------------------------------------------------

future::plan("multiprocess", workers = future::availableCores())

data.table::setDTthreads(threads = 1)

# Run pipeline ----------------------------------------------------

EpiNow::regional_rt_pipeline(
  cases = cases, 
  linelist = linelist, 
  regional_delay = FALSE,
  target_folder = "_posts/germany/nowcast/results", 
  merge_onsets = FALSE
)


# Summarise results -------------------------------------------------------

EpiNow::regional_summary(results_dir = "_posts/germany/nowcast/results", 
                         summary_dir = "_posts/germany/nowcast/summary",
                         target_date = "latest",
                         region_scale = "Region")