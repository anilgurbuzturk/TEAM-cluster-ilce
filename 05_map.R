library(tidyverse)

library(leaflet)

library(rgdal)

library(sp)

library(htmltools)

library(readxl)

# 2018 seçimleri için yeni ilçe sınırlarının olduğu harita

ilce2018 <- rgdal::readOGR("ilce2018.json")


# Veri seti ile haritayı birleştir

ilce_harita <- merge(ilce2018, km_ulas, by = "id")

class(ilce_harita)

# İlçe harita

pal_ilce <- colorNumeric(palette = "viridis",
                         domain = ilce_harita$cluster_16)

labels_ilce <- sprintf("<strong>%s</strong><br/><strong>%s</strong><br/>Küme: %s",
                       ilce_harita$il_adi, 
                       ilce_harita$ilce_adi, 
                       ilce_harita$cluster_16) %>% 
  lapply(htmltools::HTML)


leaflet(ilce_harita) %>%
  addTiles() %>%
  addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
  addPolygons(color = "#444444",
              weight = 0.8,
              opacity = 1,
              fillOpacity = 0.9,
              fillColor = ~pal_ilce(ilce_harita$cluster_16),
              highlight = highlightOptions(weight = 2, color = "white", bringToFront = TRUE),
              label = labels_ilce,
              labelOptions = labelOptions(style = list("font-weight" = "normal", 
                                                       padding = "3px 8px"),
                                          textsize = "12px", 
                                          direction = "auto"))


