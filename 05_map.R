library(tidyverse)

library(leaflet)

library(rgdal)

library(sp)

library(htmltools)

library(readxl)

# 2018 seçimleri için yeni ilçe sınırlarının olduğu harita

ilce2018 <- rgdal::readOGR("ilce2018.json")


# Veri seti ile haritayı birleştir

ilce_harita <- merge(ilce2018, km_ulas_final, by = "id")

class(ilce_harita)

# İlçe harita 16'lı küme

pal_ilce <- colorNumeric(palette = c("#FD0321", "#FD5961", "#FA007D", "#FFA3A3",
                                     "#FFBDFF", "#DDD9C4", "#31869B", "#990099",
                                     "#FF57FF", "#3399FF", "#85C2FF", "#FF9900",
                                     "#FFBD5D", "#FFE3AB", "#FFF9E5", "#DAEEF3"),
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
              highlightOptions = options(weight = 2, 
                                         color = "white", 
                                         bringToFront = TRUE),
              label = labels_ilce,
              labelOptions = labelOptions(style = list("font-weight" = "normal", 
                                                       padding = "3px 8px"),
                                          textsize = "12px", 
                                          direction = "auto"))

# İlçe harita 18'li küme

pal_ilce_18 <- colorNumeric(palette = c("#FD0321", "#FD5961", "#FA007D", "#FFA3A3",
                                     "#FFBDFF", "#DDD9C4", "#31869B", "#990099",
                                     "#FF57FF", "#3399FF", "#85C2FF", "#FF9900",
                                     "#FFBD5D", "#FFE3AB", "#FFF9E5", "#DAEEF3",
                                     "#92CDDC", "#95B3D7"),
                         domain = ilce_harita$cluster_18)


labels_ilce_18 <- sprintf("<strong>%s</strong><br/><strong>%s</strong><br/>Küme: %s",
                       ilce_harita$il_adi, 
                       ilce_harita$ilce_adi, 
                       ilce_harita$cluster_18) %>% 
  lapply(htmltools::HTML)


leaflet(ilce_harita) %>%
  addTiles() %>%
  addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
  addPolygons(color = "#444444",
              weight = 0.8,
              opacity = 1,
              fillOpacity = 0.9,
              fillColor = ~pal_ilce_18(ilce_harita$cluster_18),
              highlightOptions = options(weight = 2, 
                                         color = "white", 
                                         bringToFront = TRUE),
              label = labels_ilce_18,
              labelOptions = labelOptions(style = list("font-weight" = "normal", 
                                                       padding = "3px 8px"),
                                          textsize = "12px", 
                                          direction = "auto"))



