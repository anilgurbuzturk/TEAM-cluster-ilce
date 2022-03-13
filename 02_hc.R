library(tidyverse)

library(writexl)

# Seçilen tüm değişkenleri ölçeklendir
secim_sc <- as.data.frame(scale(secim))

summary(secim_sc) # Tüm değişkenlerin ortalaması 0 ve standart sapma 1 çıkacak.

str(secim_sc)

# Buradaki tüm değerler sürekli sayısal değer 
# Dolayısıyla Öklid Uzaklığı yöntemi kullanılacak

dist_mat <- dist(secim_sc, method = "euclidean")

hclust_ward <- hclust(dist_mat, method = "ward.D")

View(hclust_ward)

hclust_ward$labels <- tr_kume_v3$id

plot(hclust_ward)
rect.hclust(hclust_ward , k = 30)
rect.hclust(hclust_ward , k = 15)
rect.hclust(hclust_ward , k = 12)
rect.hclust(hclust_ward , k = 8)
rect.hclust(hclust_ward , k = 3)
dev.off()


# Orijinal veriden elde edilen küme sonuçlarını "cluster" sütununa ekle

cut_ward <- cutree(hclust_ward, k = 30)

secim_cl <- secim %>%
  mutate(cluster_30 = cut_ward)

count(secim_cl, cluster_30) %>% View()

tr_cl <- cbind(tr_kume_v3[, c(1,2,3,4)], secim_cl) # İlçe isimlerini vs. ekle

View(tr_cl)

# Orijinal veriden elde edilen diğer küme sonuçlarınında sütunlarını ekle

cut_ward30 <- cutree(hclust_ward, k = 30)

cut_ward15 <- cutree(hclust_ward, k = 15)

cut_ward12 <- cutree(hclust_ward, k = 12)

cut_ward8 <- cutree(hclust_ward, k = 8)

cut_ward3 <- cutree(hclust_ward, k = 3)

tr_cl_V2 <- tr_cl %>%
  mutate(cluster_30 = cut_ward30,
         cluster_15 = cut_ward15,
         cluster_12 = cut_ward12,
         cluster_8 = cut_ward8,
         cluster_3 = cut_ward3)

count(tr_cl_V2, cluster_3, cluster_8, cluster_12, cluster_15, cluster_30)

# İşlenen veriyi tekrar excele aktar

write_xlsx(tr_cl_V2, path = "TEAM_ilce_cluster_V2.xlsx")

