dir.create(path = "old")


library(tidyverse)

library(readxl)


ilce_recat <- read_excel(path = "TEAM_ilce_kmeans.recat_19.03.22.xlsx", 
                         sheet = "final", 
                         col_types = c("numeric", "text", "text", 
                                       "text", "text", "text", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric"))

ilce_recat <- ilce_recat[, 1:24]

View(ilce_recat)

ilce_recat$AKP4 <- round(ilce_recat$AKP4, digits = 2)

ilce_recat$MHP4 <- round(ilce_recat$MHP4, digits = 2)

ilce_recat$CHP4 <- round(ilce_recat$CHP4, digits = 2)

ilce_recat$İYİP4 <- round(ilce_recat$İYİP4, digits = 2)

ilce_recat$SP4 <- round(ilce_recat$SP4, digits = 2)

ilce_recat$HDP <- round(ilce_recat$HDP, digits = 2)

ilce_recat$DİĞER <- round(ilce_recat$DİĞER, digits = 2)

ilce_recat$GOY2 <- round(ilce_recat$GOY2, digits = 2)

ilce_recat$oysuz <- round(ilce_recat$oysuz, digits = 2)

ilce_recat$Cİ <- round(ilce_recat$Cİ, digits = 2)

ilce_recat$Mİ <- round(ilce_recat$Mİ, digits = 2)


head(x = ilce_recat, n = 10)

str(object = ilce_recat)

count(ilce_recat, k20)


