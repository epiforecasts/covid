
# Packages -----------------------------------------------------------------
require(stringr)
require(furrr)
require(future)
require(data.table)

# Find nowcast files ------------------------------------------------------
files <- list.files("_posts/global/nowcast/nowcasts")
nowcasts <- files[stringr::str_detect(files, "nowcast.R")]

# Set up cores -----------------------------------------------------

future::plan("multiprocess", workers = future::availableCores())

data.table::setDTthreads(threads = 1)

# Run nowcasts ------------------------------------------------------------

message("Nowcasts found: ", paste(nowcasts, sep = " ", collapse = " "))

casts <- furrr::future_map(nowcasts, function(nowcast) {
  message("Running nowcast for: ", nowcast)

  source(file.path("_posts/global/nowcast/nowcasts", nowcast))

  return(NULL)
}, .progress = TRUE)


# Summarise results -------------------------------------------------------


EpiNow::regional_summary(results_dir = "_posts/global/nowcast/results", 
                         summary_dir = "_posts/global/nowcast/summary",
                         target_date = "latest",
                         region_scale = "Country/Region")
