require(rnaturalearth)
require(dplyr)
require(ggplot2)
require(sf)

map_us <- function(df, custom_theme) {
  
  regions <- rnaturalearth::ne_states("United States of America", returnclass = "sf")
  
  regions_with_data <- regions %>%
    mutate(region_code = str_remove_all(code_local, "US"),
           abc_code = str_remove_all(iso_3166_2, "US-")) %>%
    left_join(df, by = c("region_code" = "region_code"))
  
  # Map: mainland only
  us_mainland <- ggplot2::ggplot(regions_with_data) +
    geom_sf(ggplot2::aes(fill = `Expected change in daily cases`)) +
    coord_sf(crs = st_crs(4326), xlim = c(-125.0011,	-66.9326), ylim = c(24.9493, 49.5904)) 
  
  
  us_mainland <- custom_theme(us_mainland)
  
  # Create inset maps for non-mainland
  us_alaska <- filter(regions_with_data, abc_code == "AK")
  us_alaska <- ggplot(us_alaska) +
    geom_sf(aes(fill = `Expected change in daily cases`)) +
    coord_sf(datum = NA, xlim = c(-179.148909, -130), ylim = c(51.214183, 71.365162))
  
  us_alaska <- custom_theme(us_alaska) +
    theme(legend.position = "none") +
    labs(title = us_alaska$name)
  
  us_hawaii <- filter(regions_with_data, abc_code == "HI")
  us_hawaii <- ggplot(us_hawaii) +
    geom_sf(aes(fill = `Expected change in daily cases`)) +
    coord_sf(datum = NA, xlim = c(-160.2471, -154.8066), ylim = c(18.9117, 22.235))
     
  
  us_hawaii <- custom_theme(us_hawaii) +
    theme(legend.position = "none") +
    labs(title = us_hawaii$name)
  
  # Map mainland with  insets
  map <- us_mainland +
    annotation_custom(
      grob = ggplotGrob(us_alaska), xmin = -127,  xmax = -117,  ymin = 23,  ymax = 33) +
    annotation_custom(
      grob = ggplotGrob(us_hawaii), xmin = -75,  xmax = -65,  ymin = 22,  ymax = 32) 
  
  return(map)
  
}