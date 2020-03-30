
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

cases <- get_us_regional_cases() %>% 
  dplyr::rename(region = state)


region_codes <- cases %>% 
  dplyr::select(region, region_code = fips) %>% 
  unique()

saveRDS(region_codes, "_posts/united-states/nowcast/data/region_codes.rds")

cases <- cases %>% 
  dplyr::select(date, region, cases) %>% 
  dplyr::rename(local = cases) %>% 
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
  target_folder = "_posts/regional-breakdowns/united-states/nowcast/regional", 
  samples = 10
)


# Summarise results -------------------------------------------------------

EpiNow::regional_summary(results_dir = "_posts/regional-breakdowns/united-states/nowcast/regional", 
                         summary_dir = "_posts/regional-breakdowns/united-states/nowcast/regional-summary",
                         target_date = "latest",
                         region_scale = "State")



# Run a national nowcast --------------------------------------------------

cases <- cases %>% 
  dplyr::group_by(import_status, date) %>% 
  dplyr::summarise(cases = sum(cases, na.rm = TRUE)) %>% 
  dplyr::ungroup()


## Set the target date
target_date <- as.character(max(cases$date))

## Run and save analysis pipeline
rt_pipeline(
  cases = cases,
  linelist = linelist,
  target_folder = "_posts/global/nowcast/results",
  target_date = target_date, samples = 10)
  
