# Get utils ---------------------------------------------------------------

source("utils/rt_pipeline.R")

# Read in linelist --------------------------------------------------------
message("Downloading linelist data")
gsheets_url <- paste0("https://docs.google.com/spreadsheets/d/",
                                  "1nKRkOwnGV7RgsMnsYE6l96u4xxl3ZaNiTluPKEPaWm8")
url <- paste0(gsheets_url, "/export?format=csv&gid=0")

linelist <- suppressWarnings(
  suppressMessages(
  readr::read_csv(url) %>%
  dplyr::mutate(import_status =
           dplyr::if_else(!is.na(source) & source == "import", "imported", "local"),
         report_delay =
           as.integer(as.Date(date_confirm) - as.Date(date_onset))) %>%
  ## remove annoying column
  dplyr::select(-`KCDC_no (https://www.cdc.go.kr/board/board.es?mid=a20501000000&bid=0015)`) %>%
  dplyr::mutate(case = 1:dplyr::n())
)) %>%
  tidyr::drop_na(date_confirm)


# Get WHO sit rep case counts ---------------------------------------------

total_cases <- NCoVUtils::get_who_cases(country = "RepublicofKorea", daily = TRUE)


# Join imported and local cases -------------------------------------------

cases <- EpiNow::get_local_import_case_counts(total_cases, linelist)

# Run analysis pipeline and save results ----------------------------------
## Set the target date
target_date <- as.character(max(cases$date))

## Run and save analysis pipeline
rt_pipeline(
  cases = cases,
  linelist = linelist,
  target_folder = file.path("results/south-korea", target_date),
  target_date = target_date,
  start_rate_of_spread_est = "2020-02-03")
