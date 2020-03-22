# Get utils ---------------------------------------------------------------

source("_posts/global/nowcast/utils/rt_pipeline.R")

# Read in linelist --------------------------------------------------------
linelist <- NCoVUtils::get_international_linelist("China")

# Get WHO sit rep case counts ---------------------------------------------

total_cases <- NCoVUtils::get_who_cases(country = "China", daily = TRUE)


# Assume that all cases are local -----------------------------------------

cases <- EpiNow::get_local_import_case_counts(total_cases, linelist)

# Run analysis pipeline and save results ----------------------------------

## Set the target date
target_date <- as.character(max(cases$date))

## Run and save analysis pipeline
rt_pipeline(
  cases = cases,
  linelist = linelist,
  target_folder = "_posts/global/nowcast/results/china",
  target_date = target_date)
