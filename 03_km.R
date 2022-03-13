library(tidyverse)

library(factoextra)

library(cluster)

library(writexl)


# Seçilen tüm değişkenleri ölçeklendir

secim_km <- as.data.frame(scale(secim))

summary(secim_km) # Tüm değişkenlerin ortalaması 0 ve standart sapma 1 çıkacak.

str(secim_km)


# Estimating the optimal number of clusters

fviz_nbclust(secim_km, kmeans, method = "wss")
dev.off()


# K-means clustering with 30 clusters

km30 <- kmeans(secim_km, centers = 30, nstart = 50)

print(km30) # Print the results


# Orijinal veriden elde edilen küme sonuçlarını "cluster" sütununa ekle

tr_km <- cbind(tr_kume_v3[, c(1,2,3,4)], cluster_30 = km30$cluster)

head(tr_km)

count(tr_km, cluster_30)


# İşlenen veriyi tekrar excele aktar

write_xlsx(tr_km, path = "TEAM_ilce_kmeans.xlsx")


