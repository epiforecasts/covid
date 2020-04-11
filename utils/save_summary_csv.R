
# Packages ----------------------------------------------------------------

require(EpiNow)
require(data.table)

save_summary_csv <- function(results_dir = NULL, summary_dir = NULL, 
                             type = "country", incubation_shift = 5) {
  
  
  
  timeseries <- EpiNow::get_timeseries(results_dir, summarised = TRUE)
  
  
  rt <- data.table::as.data.table(timeseries$rt)[rt_type %in% "nowcast" & type %in% "nowcast", 
                      .(region, date = date - lubridate::days(incubation_shift), median,
                        lower_90 = bottom, upper_90 = top, lower_50 = lower, upper_50 = upper)]
  
  data.table::setnames(rt, "region", type)
  
  
  readr::write_csv(rt, paste0(summary_dir, "/rt.csv"))
  
  return(invisible(NULL))
}