library(leaflet)
library(rgdal)
library(htmltools)
library(data.table)
library(sf)
library(leaflet.extras)

##' Make a leaflet from EpiNow2 summary output
##'
##' @param map a shapefile
##' @param table a summary table generated by EpiNow2, with a geography column
##' (see the \code{geography_column} argument) that matches the correponding
##' column in the summary table
##' @param label_style whether labels are to displayed as \code{"label"}, i.e.
##' hover on mouse over, or \code{"popup"}, i.e. on click.
##' @param link_text text to display with any link, given by the \code{link}
##' column in the \code{table} argument
##' @param geography_column column in \code{table} that gives the links to show
##' in the popup/label.
##' @param ... any parameters to pass to \code{leafletOptions}
##' @param tiles whether to add tiles to the map
##' @return a leaflet
epi_leaflet <- function(map, table, label_style = c("popup", "label"),
                        link_text = NULL, geography_column = "Country",
                        ...) {
  values <- c(
    "Increasing" = "#e75f00",
    "Likely increasing" = "#fd9e49",
    "Stable" = "#9fa5ad",
    "Likely decreasing" = "#5fa2ce",
    "Decreasing" = "#1170aa"
  )

  if (!is.null(link_text) && label_style == "label") {
    warning("`link_text` given and `label_style` set to `label`. Link ",
            "will not be clickable.")
  }

  label_style <- match.arg(label_style, choices = c("popup", "label"))

  pal <- colorFactor(values, names(values), ordered = TRUE)

  map <- merge(map, table, by = geography_column)

  label_format <-
    paste0("<strong>%s</strong><br/>",
           "Reproduction number: %s<br/>",
           "Rate of growth per day: %s<br/>",
           "Doubling/halving time in days: %s<br/>",
           "Estimated new cases: %s",
           if_else(is.null(link_text), "",
                   paste0("<br/>", "<a href=\"%s\" target=\"_blank\">",
                          link_text, "</a>")))

  label_elements <-
    list(map[[geography_column]],
         map$`Effective reproduction no.`,
         map$`Rate of growth`,
         map$`Doubling/halving time (days)`,
         map$`New confirmed cases by infection date`)
  if (!is.null(link_text)) {
    label_elements <- c(label_elements, list(map$link))
  }

  labels <- do.call(sprintf, c(label_format, label_elements)) %>%
   lapply(HTML)

  label_options <- list(
    labels,
    labelOptions(
      style = list("font-weight" = "normal", padding = "3px 8px"),
      textsize = "15px",
      direction = "auto"))

  names(label_options) <- paste0(label_style, c("", "Options"))

  polygon_options <-
    list(fillColor = pal(map$`Expected change in daily cases`),
         opacity = 1, weight = 0.5, color = "white", fillOpacity = 1,
         highlight = highlightOptions(bringToFront = TRUE, weight = 3))

  tiled_map <- map %>%
    st_transform(CRS("+proj=longlat +datum=WGS84")) %>%
    leaflet(options = leafletOptions(...)) %>%
    addTiles()

  do.call(addPolygons, c(list(tiled_map), polygon_options, label_options)) %>%
    addLegend(pal = pal, values = factor(names(values), levels = names(values)),
              opacity = 0.7, title = NULL,
              position = "bottomright") %>%
    addFullscreenControl("bottomleft")
}
