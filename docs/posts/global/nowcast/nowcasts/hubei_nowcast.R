# Get utils ---------------------------------------------------------------

source("utils/rt_pipeline.R")

# Read in linelist --------------------------------------------------------
linelist <- NCoVUtils::get_international_linelist("China") %>%
  dplyr::filter(date_confirm > as.Date("2020-02-01")) %>%
  dplyr::filter(report_delay < 100)

# Get WHO sit rep case counts ---------------------------------------------

total_cases <- NCoVUtils::get_who_cases(country = "China-Hubei", daily = TRUE)

# Assume that all cases are local -----------------------------------------

## Drop data from 17th and before due to reporting changes
cases <- total_cases %>%
  tibble::as_tibble() %>%
  dplyr::mutate(date = as.Date(date)) %>%
  dplyr::filter(date > as.Date("2020-02-01")) %>%
  dplyr::mutate(import_status = "local")

# Run analysis pipeline and save results ----------------------------------

## Set the target date
target_date <- as.character(max(cases$date))

## Run and save analysis pipeline
rt_pipeline(
  cases = cases,
  linelist = linelist,
  target_folder = file.path("results/hubei", target_date),
  target_date = target_date,
  merge_actual_onsets = FALSE,
  earliest_allowed_onset = "2020-02-01")
