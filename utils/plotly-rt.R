require(plotly)
require(crosstalk)
library(vroom)
pal <- c("estimate" = 'blue', "estimate based on partial data" = 'green', "forecast" = 'red')
rt <- vroom('https://github.com/epiforecasts/covid-rt-estimates/raw/master/national/cases/summary/rt.csv') %>% 
  mutate(fillcolor = as.character(pal[type])) %>% 
  group_by(country) %>% 
  highlight_key(~country, group = 'country_name')
p <- rt %>% 
  plot_ly(x = ~date, y = ~median, height = 400) %>% 
  add_ribbons(ymin = ~lower_20, ymax = ~upper_20, fillcolor = ~setNames(fillcolor, type),
              line = list(width = 0),
              opacity = 0.15) %>% 
  add_ribbons(ymin = ~lower_50, ymax = ~upper_50, fillcolor = ~setNames(fillcolor, type),
              line = list(width = 0),
              opacity = 0.15) %>% 
  add_ribbons(ymin = ~lower_90, ymax = ~upper_90, fillcolor = ~setNames(fillcolor, type),
              line = list(width = 0),
              opacity = 0.15) %>% 
  layout(showlegend = TRUE)
bscols(widths = c(12, 12),
       filter_select("id", "Select regions", rt, ~country, multiple = TRUE),
       p
)