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
                                         "#FF0000", "#FD5961", "#FFA3A3", "#C26A6E",
                                         "#C59196", "#D9D9D9", "#FCFFE1", "#FAFF8F",
                                         "#F8E102", "#BEAC02", "#FFBD5D", "#FF9900",
                                         "#A55039", "#C08C58"),
                             domain = ilce_harita@data$k18)

pal_ilce_k12 <- colorNumeric(palette = c("#990099", "#FF57FF", "#FF0000", "#FD5961",
                                         "#FFA3A3", "#D8B6B9", "#FEE09C", "#F8E102",
                                         "#BEAC02", "#FF9900", "#A55039", "#C08C58"),
                             domain = ilce_harita@data$k12)

pal_ilce_k6 <- colorNumeric(palette = c("#D34DA6", "#FF0000", "#D2BCBF",
                                        "#FFC89B", "#CCFF33", "#FF6600"),
                            domain = ilce_harita@data$k6)

labels_ilce_k18 <- sprintf("<strong>%s</strong><br/>Küme: %s<br/>Seçmen: %s<br/>Cumhur: %s<br/>Millet: %s<br/>HDP: %s",
                       ilce_harita@data$il_ilce,
                       ilce_harita@data$k18,
                       ilce_harita@data$secmen,
                       ilce_harita@data$Cİ,
                       ilce_harita@data$Mİ,
                       ilce_harita@data$HDP) %>%
  lapply(htmltools::HTML)

labels_ilce_k12 <- sprintf("<strong>%s</strong><br/>Küme: %s<br/>Seçmen: %s<br/>Cumhur: %s<br/>Millet: %s<br/>HDP: %s",
                          ilce_harita@data$il_ilce,
                          ilce_harita@data$k12,
                          ilce_harita@data$secmen,
                          ilce_harita@data$Cİ,
                          ilce_harita@data$Mİ,
                          ilce_harita@data$HDP) %>%
  lapply(htmltools::HTML)

labels_ilce_k6 <- sprintf("<strong>%s</strong><br/>Küme: %s<br/>Seçmen: %s<br/>Cumhur: %s<br/>Millet: %s<br/>HDP: %s",
                          ilce_harita@data$il_ilce,
                          ilce_harita@data$k6,
                          ilce_harita@data$secmen,
                          ilce_harita@data$Cİ,
                          ilce_harita@data$Mİ,
                          ilce_harita@data$HDP) %>%
  lapply(htmltools::HTML)

leaflet(ilce_harita) %>%
  addTiles() %>%
  addProviderTiles(provider = providers$CartoDB.PositronNoLabels) %>%
  addPolygons(color = "#444444",
              weight = 1,
              opacity = 1,
              fillOpacity = 0.9,
              fillColor = ~pal_ilce_k18(ilce_harita@data$k18),
              highlightOptions = options(weight = 2, 
                                         color = "white", 
                                         bringToFront = TRUE),
              label = labels_ilce_k18,
              labelOptions = labelOptions(style = list("font-weight" = "normal", 
                                                       padding = "3px 8px"),
                                          textsize = "12px", 
                                          direction = "auto"),
              group = "K18 kümeleme") %>%
  addPolygons(color = "#444444",
              weight = 1,
              opacity = 1,
              fillOpacity = 0.9,
              fillColor = ~pal_ilce_k12(ilce_harita@data$k12),
              highlightOptions = options(weight = 2, 
                                         color = "white", 
                                         bringToFront = TRUE),
              label = labels_ilce_k12,
              labelOptions = labelOptions(style = list("font-weight" = "normal", 
                                                       padding = "3px 8px"),
                                          textsize = "12px", 
                                          direction = "auto"),
              group = "K12 kümeleme") %>%
  addPolygons(color = "#444444",
              weight = 1,
              opacity = 1,
              fillOpacity = 0.9,
              fillColor = ~pal_ilce_k6(ilce_harita@data$k6),
              highlightOptions = options(weight = 2, 
                                         color = "white", 
                                         bringToFront = TRUE),
              label = labels_ilce_k6,
              labelOptions = labelOptions(style = list("font-weight" = "normal", 
                                                       padding = "3px 8px"),
                                          textsize = "12px", 
                                          direction = "auto"),
              group = "K6 kümeleme") %>%
  addLayersControl(baseGroups = c("K18 kümeleme", "K12 kümeleme", "K6 kümeleme"),
                   options = layersControlOptions(collapsed = TRUE, autoZIndex = FALSE)) %>%
  addMeasure(position = "bottomleft",
             primaryLengthUnit = "meters",
             primaryAreaUnit = "sqmeters",
             activeColor = "#3D535D",
             completedColor = "#7D4479") %>%
  addEasyButton(easyButton(icon = "fa-crosshairs", 
                           title = "Ben neredeyim?",
                           onClick = JS("function(btn, map){ map.locate({setView: true}); }")))

