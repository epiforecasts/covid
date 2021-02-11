
# get function for updating Rt estimates
source("https://raw.githubusercontent.com/epiforecasts/covid-rt-estimates/master/R/get_estimates.R")

get_estimates("../covid-rt-estimates", include = c("csv","rds", "png"))