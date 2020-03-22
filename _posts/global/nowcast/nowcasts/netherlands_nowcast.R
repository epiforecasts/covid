# Get utils ---------------------------------------------------------------

source("_posts/global/nowcast/utils/get_combined_linelist.R")
source("_posts/global/nowcast/utils/rt_pipeline.R")

# Read in linelist --------------------------------------------------------
linelist <- get_combined_linelist()

# Read in international linelist --------------------------------------------------------
int_linelist <- NCoVUtils::get_international_linelist("Netherlands")

# Get WHO sit rep case counts ---------------------------------------------

total_cases <- NCoVUtils::get_who_cases("Netherlands", daily = TRUE)

# Join imported and local cases -------------------------------------------

cases <- EpiNow::get_local_import_case_counts(total_cases, int_linelist,
                                              cases_from = "2020-02-27")

# Run analysis pipeline and save results ----------------------------------

## Set the target date
target_date <- as.character(max(cases$date))

## Run and save analysis pipeline
rt_pipeline(
  cases = cases,
  linelist = linelist,
  target_folder = "_posts/global/nowcast/results/netherlands",
  target_date = target_date,
  merge_actual_onsets = FALSE)
