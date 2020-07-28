# LOAD WORLD MAP
# library(ggplot2)
# library(sf)
# library(rnaturalearth)
# library(rnaturalearthdata)
# #set map theme
# theme_set(theme_bw())
#
#
# world <- ne_countries(scale = 'medium', returnclass = 'sf')
#
# ggplot(data = world) +
#    geom_sf(color='black',fill='green') +
#   ggtitle('Contraceptive Prevalence')

# library(sp)
# library(sf)
# library(ggplot2)
# library(ggiraph)
# l <- leaflet() %>%
#   setView(lat = 50.85045, lng = 4.34878, zoom=13) %>%
#   addTiles(group="OSM") %>%
#   addProviderTiles(providers$CartoDB.DarkMatter, group="Dark") %>%
#   addProviderTiles(providers$CartoDB.Positron, group="Light") %>%
#   addLayersControl(baseGroups=c('OSM','Dark','Light'))
#
# frameWidget(l)

library(purrr)

.libPaths() %>%
  set_names() %>%
  map(function(lib) {
    .packages(all.available = TRUE, lib.loc = lib) %>%
      keep(function(pkg) {
        f <- system.file('Meta', 'tmap.rds', package = pkg, lib.loc = lib)
        tryCatch({readRDS(f); FALSE}, error = function(e) TRUE)
      })
  })