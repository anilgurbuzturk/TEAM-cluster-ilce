dir.create(path = "old")


library(tidyverse)

library(readxl)


ilce_recat <- read_excel(path = "TEAM_ilce_kmeans.recat_17.03.22.xlsx", 
                         sheet = "final", 
                         col_types = c("numeric", "text", "text", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric"))

View(ilce_recat)

head(x = ilce_recat, n = 10)

str(object = ilce_recat)


