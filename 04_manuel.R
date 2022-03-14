dir.create("images")

library(tidyverse)

library(readxl)

km_ulas <- read_excel("TEAM_ilce_kmeans_ulas.xlsx",
                                    sheet = "Sheet1",
                                    col_types = c("numeric", "text", "text", 
                                                  "text", "numeric", "numeric", "numeric", 
                                                  "numeric", "numeric", "numeric", 
                                                  "numeric", "numeric", "numeric", 
                                                  "numeric", "numeric", "numeric", 
                                                  "numeric", "numeric"))

head(km_ulas, n = 10)


# 30 kümeyi 16'ya indir

km_ulas <- km_ulas %>%
  mutate(cluster_16 = recode(km_30, 
                            "1" = "15", "2" = "12", "3" = "12",
                            "4" = "10", "5" = "5", "6" = "9",
                            "7" = "1", "8" = "10", "9" = "13",
                            "10" = "12", "11" = "9", "12" = "16",
                            "13" = "6", "14" = "2", "15" = "4",
                            "16" = "3", "17" = "4", "18" = "10",
                            "19" = "13", "20" = "11", "21" = "13",
                            "22" = "9", "23" = "8", "24" = "14",
                            "25" = "9", "26" = "10", "27" = "10",
                            "28" = "8", "29" = "12", "30" = "7"))

count(km_ulas, cluster_16, sort = TRUE)


# Karakter sınıfında olanları sayıya çrevi

km_ulas$cluster_16 <- as.numeric(km_ulas$cluster_16)



