library(purrr, quietly = TRUE)
library(RtD3, quietly = TRUE)
library(data.table, quietly = TRUE)

get_national_RtD3_data <- function(rtData, country) {

  # Define the base URL/file path for the estimates
  base_url <- 'https://raw.githubusercontent.com/epiforecasts/covid-rt-estimates/master/national/'
  
  # Read in each summary folder
  rtData_national <- RtD3::readInEpiNow2(path = paste0(base_url, "cases/summary"),
                                                        region_var = "country")
  
  # Make sure all regions have the same id
  rtData_national$summaryData <- rtData_national$summaryData[, region := Region]
  
  # Join the subregional and national estimates together.
  rtData$Cases <- purrr::map2(rtData$Cases, rtData_national, 
                        ~ data.table::rbindlist(list(
                          .x, 
                          .y[region %in% country]),
                        use.names = TRUE, fill = TRUE))
  
  return(rtData)
}