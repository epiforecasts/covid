# Get utils ---------------------------------------------------------------

source("_posts/global/nowcast/utils/get_combined_linelist.R")
source("_posts/global/nowcast/utils/rt_pipeline.R")

# Read in international linelist --------------------------------------------------------
linelist <- NCoVUtils::get_international_linelist("United States")

# Get WHO sit rep case counts ---------------------------------------------

total_cases <- NCoVUtils::get_who_cases("UnitedStatesofAmerica", daily = TRUE)

# Join imported and local cases -------------------------------------------

cases <- EpiNow::get_local_import_case_counts(total_cases, linelist,
                                              cases_from = "2020-02-22")

# Run analysis pipeline and save results ----------------------------------

## Set the target date
target_date <- as.character(max(cases$date))

## Run and save analysis pipeline
rt_pipeline(
  cases = cases,
  linelist = linelist,
  target_folder = "_posts/global/nowcast/results/united-states",
  target_date = target_date,
  merge_actual_onsets = TRUE)
