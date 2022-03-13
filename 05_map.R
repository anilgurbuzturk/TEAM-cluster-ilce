library(tidyverse)

library(leaflet)

library(rgdal)

library(sp)

library(htmltools)

library(readxl)

# 2018 seçimleri için yeni ilçe sınırlarının olduğu harita

ilce2018 <- rgdal::readOGR("ilce2018.json")


# Veri seti ile haritayı birleştir

ilce_harita <- merge(ilce2018, tr_cl_V2, by = "id")

View(ilce_harita)


# İlçe harita

pal_ilce_8 <- colorFactor(c("forestgreen", "red4", "orangered3", "plum",
                          "yellow1", "moccasin", "yellow", "magenta4"), 
                        domain = ilce_harita$cluster_8)

pal_ilce <- colorFactor(c("moccasin", "indianred3", "red4", "orangered2",
                          "yellow1", "plum", "yellow", "orange3",
                          "orange", "forestgreen", "tomato",
                          "gold", "lightyellow", "magenta4", "mediumorchid3"), 
                        domain = ilce_harita$cluster_15)
pal_ilce <- colorNumeric(palette = "viridis",
                         domain = ilce_harita$cluster_30)

labels_ilce <- sprintf("<strong>%s</strong><br/><strong>%s</strong><br/>Küme: %s",
                       ilce_harita$il_adi, 
                       ilce_harita$ilce_adi, 
                       ilce_harita$cluster_30) %>% 
  lapply(htmltools::HTML)

labels_ilce_8 <- sprintf("<strong>%s</strong><br/><strong>%s</strong><br/>Küme: %s",
                       ilce_harita$il_adi, 
                       ilce_harita$ilce_adi, 
                       ilce_harita$cluster_8) %>% 
  lapply(htmltools::HTML)


leaflet(ilce_harita) %>%
  addTiles() %>%
  addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
  addPolygons(color = "#444444",
              weight = 0.8,
              opacity = 1,
              fillOpacity = 0.9,
              fillColor = ~pal_ilce(ilce_harita$cluster_30),
              highlight = highlightOptions(weight = 2, color = "white", bringToFront = TRUE),
              label = labels_ilce,
              labelOptions = labelOptions(style = list("font-weight" = "normal", 
                                                       padding = "3px 8px"),
                                          textsize = "12px", 
                                          direction = "auto"))



# Kmeans

ilce_harita_km <- merge(ilce2018, tr_km, by = "id")

pal_ilce_km <- colorFactor(c("forestgreen", "mediumorchid3", "gold", "red4",
                             "yellow1", "orange", "yellow", "lightyellow",
                             "plum", "moccasin", "orange3",
                             "tomato", "magenta4", "orangered2", "indianred3"), 
                        domain = ilce_harita_km$`km15$cluster`)

pal_ilce_km_8 <- colorFactor(c("moccasin", "yellow", "forestgreen", "plum",
                            "yellow1", "magenta4", "red4", "orangered3"), 
                          domain = ilce_harita_km$`km8$cluster`)

pal_ilce_km_30 <- colorNumeric(palette = "viridis",
                         domain = ilce_harita_km$`km30$cluster`)

labels_ilce_km <- sprintf("<strong>%s</strong><br/><strong>%s</strong><br/>Küme: %s",
                       ilce_harita_km$il_adi, 
                       ilce_harita_km$ilce_adi, 
                       ilce_harita_km$`km15$cluster`) %>% 
  lapply(htmltools::HTML)

labels_ilce_km_30 <- sprintf("<strong>%s</strong><br/><strong>%s</strong><br/>Küme: %s",
                          ilce_harita_km$il_adi, 
                          ilce_harita_km$ilce_adi, 
                          ilce_harita_km$`km30$cluster`) %>% 
  lapply(htmltools::HTML)

leaflet(ilce_harita_km) %>%
  addTiles() %>%
  addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
  addPolygons(color = "#444444",
              weight = 0.8,
              opacity = 1,
              fillOpacity = 0.9,
              fillColor = ~pal_ilce_km_30(ilce_harita_km$`km30$cluster`),
              highlight = highlightOptions(weight = 2, color = "white", bringToFront = TRUE),
              label = labels_ilce_km_30,
              labelOptions = labelOptions(style = list("font-weight" = "normal", 
                                                       padding = "3px 8px"),
                                          textsize = "12px", 
                                          direction = "auto"))
