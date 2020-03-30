# Get utils ---------------------------------------------------------------

source("_posts/global/nowcast/utils/rt_pipeline.R")

# Read in linelist --------------------------------------------------------
linelist <- NCoVUtils::get_international_linelist("China")

# Get WHO sit rep case counts ---------------------------------------------

total_cases <- NCoVUtils::get_who_cases(country = "China", daily = TRUE)

hubei_cases <-  NCoVUtils::get_who_cases(country = "China-Hubei", daily = TRUE)

total_cases$cases <- total_cases$cases - hubei_cases$cases

total_cases <- total_cases

# Assume that all cases are local -----------------------------------------

## Drop data from 17th and before due to reporting changes
cases <- EpiNow::get_local_import_case_counts(total_cases, linelist,
                                              cases_from = "2020-02-01")

# Run analysis pipeline and save results ----------------------------------

## Set the target date
target_date <- as.character(max(cases$date))

## Run and save analysis pipeline
rt_pipeline(
  cases = cases,
  linelist = linelist,
  target_folder = "_posts/global/nowcast/results/china-excluding-hubei",
  target_date = target_date,
  earliest_allowed_onset = "2020-02-01")
