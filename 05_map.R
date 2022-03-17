library(tidyverse)

library(leaflet)

library(rgdal)

library(sp)

library(htmltools)


# 2018 seçimleri için yeni ilçe sınırlarının olduğu harita

ilce2018 <- rgdal::readOGR("ilce2018.json")


# Veri seti ile haritayı birleştir

ilce_harita <- merge(ilce2018, ilce_recat, by = "id")

class(ilce_harita)

colnames(ilce_harita@data)


# K18, K12 ve K6'lı harita

pal_ilce_k18 <- colorNumeric(palette = c("#990099", "#FF57FF", "#FFBDFF", "#FA007D", 
                                         "#FD0321", "#FD5961", "#FFA3A3", "#C26A6E",
                                         "#C59196", "#D9D9D9", "#FCFFE1", "#FAFF8F",
                                         "#F8E102", "#BEAC02", "#FFBD5D", "#FF9900",
                                         "#8DB4E2", "#92CDDC"),
                             domain = ilce_harita@data$k18)

pal_ilce_k12 <- colorNumeric(palette = c("#990099", "#FF57FF", "#FD0321", "#FD5961", 
                                         "#FFA3A3", "#D8B6B9", "#FEE09C", "#F7BD03",
                                         "#BEAC02", "#FF9900", "#8DB4E2", "#92CDDC"),
                             domain = ilce_harita@data$k12)

pal_ilce_k6 <- colorNumeric(palette = c("#D34DA6", "#FC1456", "#D2BCBF", "#FFC89B",
                                        "#CCFF33", "#CCECFF"),
                            domain = ilce_harita@data$k6)

labels_ilce <- sprintf("<strong>%s</strong><br/>K18'li küme: %s<br/>K12'li küme: %s<br/>K6'lı küme: %s",
                       ilce_harita@data$il_ilce, 
                       ilce_harita@data$k18,
                       ilce_harita@data$k12,
                       ilce_harita@data$k6) %>% 
  lapply(htmltools::HTML)

leaflet(ilce_harita) %>%
  addTiles() %>%
  addProviderTiles(providers$CartoDB.PositronNoLabels) %>%
  addPolygons(color = "#444444",
              weight = 0.8,
              opacity = 1,
              fillOpacity = 0.9,
              fillColor = ~pal_ilce_k18(ilce_harita@data$k18),
              highlightOptions = options(weight = 2, 
                                         color = "white", 
                                         bringToFront = TRUE),
              label = labels_ilce,
              labelOptions = labelOptions(style = list("font-weight" = "normal", 
                                                       padding = "3px 8px"),
                                          textsize = "12px", 
                                          direction = "auto"),
              group = "K18 kümeleme") %>%
  addPolygons(color = "#444444",
              weight = 0.8,
              opacity = 1,
              fillOpacity = 0.9,
              fillColor = ~pal_ilce_k12(ilce_harita@data$k12),
              highlightOptions = options(weight = 2, 
                                         color = "white", 
                                         bringToFront = TRUE),
              label = labels_ilce,
              labelOptions = labelOptions(style = list("font-weight" = "normal", 
                                                       padding = "3px 8px"),
                                          textsize = "12px", 
                                          direction = "auto"),
              group = "K12 kümeleme") %>%
  addPolygons(color = "#444444",
              weight = 0.8,
              opacity = 1,
              fillOpacity = 0.9,
              fillColor = ~pal_ilce_k6(ilce_harita@data$k6),
              highlightOptions = options(weight = 2, 
                                         color = "white", 
                                         bringToFront = TRUE),
              label = labels_ilce,
              labelOptions = labelOptions(style = list("font-weight" = "normal", 
                                                       padding = "3px 8px"),
                                          textsize = "12px", 
                                          direction = "auto"),
              group = "K6 kümeleme") %>%
  addLayersControl(baseGroups = c("K18 kümeleme", "K12 kümeleme", "K6 kümeleme"),
                   options = layersControlOptions(collapsed = TRUE, autoZIndex = FALSE))

?addPolygons
