library(purrr, quietly = TRUE)
library(RtD3, quietly = TRUE)
library(data.table, quietly = TRUE)

join_RtD3_data <- function(rtData, country,
                           base_url = 'https://raw.githubusercontent.com/epiforecasts/covid-rt-estimates/master/national/cases/summary',
                           region_id = "country") {

  # Read in each summary folder
  rtData_national <- RtD3::readInEpiNow2(path = base_url, region_var = region_id)
  
  # Make sure all regions have the same id
  rtData_national$summaryData <- rtData_national$summaryData[, region := Region]
  
  ## Make country filter all regions if missing
  if (missing(country)) {
    country <- unique(rtData_national[[1]]$region)
  }
  
  # Join the subregional and national estimates together.
  rtData <- purrr::map2(rtData, rtData_national, 
                        ~ data.table::rbindlist(list(
                          .x, 
                          .y[region %in% country]),
                        use.names = TRUE, fill = TRUE))
  
  return(rtData)
}