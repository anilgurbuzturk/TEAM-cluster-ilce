library(tidyverse)

library(writexl)

str(km_ulas)

km_16 <- km_ulas %>%
  filter(cluster_16 == 16) %>%
  select(id, cluster_16)

km_16 <- merge(x = km_16, y = tr_kume_v3, by = "id")

nrow(km_16)

secim_16 <- km_16 %>%
  select(sege2017, belediye_meclis_cumhur_2019, 
         cb_selahattin_2018, milletv_gecerli_oy_2018, 
         milletv_akp_2018, milletv_iyi_oran_2018,
         milletv_mhp_oy_oran_2018, milletv_saadet_oran_2018, 
         referandum_evet_2017, kasim_akp_2015, 
         haziran_hdp_2015, belediye_chp_2014, referandum_evet_2010, 
         akp_15_18_fark, referandum_10_17_fark, 
         log_SeçmenCami, yas_CocukBagm, ci_muh_katsayi)

secim_16_km <- as.data.frame(scale(secim_16))

sub_km_16 <- kmeans(secim_16_km, centers = 3, nstart = 25)

print(sub_km_16)

sub_km_16 <- cbind(km_16[, c(1, 3, 4)], subcluster_16 = sub_km_16$cluster)

head(sub_km_16, 20)

count(sub_km_16, subcluster_16)

write_xlsx(sub_km_16, path = "TEAM_ilce_km_subcluster_16.xlsx")


km_ulas_final <- km_ulas %>%
  left_join(sub_km_16[, c(1, 4)], by = "id")

km_ulas_final <- km_ulas_final %>%
  mutate(cluster_18 = case_when(cluster_16 == "1" ~ "1",
                                cluster_16 == "2" ~ "2",
                                cluster_16 == "3" ~ "3",
                                cluster_16 == "4" ~ "4",
                                cluster_16 == "5" ~ "5",
                                cluster_16 == "6" ~ "6",
                                cluster_16 == "7" ~ "7",
                                cluster_16 == "8" ~ "8",
                                cluster_16 == "9" ~ "9",
                                cluster_16 == "10" ~ "10",
                                cluster_16 == "11" ~ "11",
                                cluster_16 == "12" ~ "12",
                                cluster_16 == "13" ~ "13",
                                cluster_16 == "14" ~ "14",
                                cluster_16 == "15" ~ "15",
                                subcluster_16 == "1" ~ "16",
                                subcluster_16 == "2" ~ "17",
                                subcluster_16 == "3" ~ "18"))

km_ulas_final$cluster_18 <- as.numeric(km_ulas_final$cluster_18)


###
km_16_v2 <- km_ulas %>%
  filter(cluster_16 == 16) %>%
  select(id, cluster_16)

km_16_v2 <- merge(x = km_16_v2, y = tr_kume_v3, by = "id")

nrow(km_16_v2)

secim_16_v2 <- km_16_v2 %>%
  select(sege2017, belediye_meclis_cumhur_2019, 
         cb_selahattin_2018, milletv_gecerli_oy_2018, 
         milletv_akp_2018, milletv_iyi_oran_2018,
         milletv_mhp_oy_oran_2018, milletv_saadet_oran_2018, 
         referandum_evet_2017, kasim_akp_2015, 
         haziran_hdp_2015, belediye_chp_2014, referandum_evet_2010, 
         akp_15_18_fark, referandum_10_17_fark, 
         log_SeçmenCami, yas_CocukBagm, ci_muh_katsayi)

secim_16_km_v2 <- as.data.frame(scale(secim_16_v2))

sub_km_16_v2 <- kmeans(secim_16_km_v2, centers = 6, nstart = 25)

sub_km_16_v2 <- cbind(km_16_v2[, c(1, 3, 4)], subcluster_16 = sub_km_16_v2$cluster)

head(sub_km_16_v2, 20)

count(sub_km_16_v2, subcluster_16)

write_xlsx(sub_km_16_v2, path = "TEAM_ilce_km_subcluster_16_v2.xlsx")


####
colnames(km_ulas)

count(km_ulas, km_30) %>%
  View()

km_20 <- km_ulas %>%
  filter(km_30 == 20) %>%
  select(id, km_30)

km_20 <- merge(x = km_20, y = tr_kume_v3, by = "id")

nrow(km_20)

secim_20 <- km_20 %>%
  select(sege2017, belediye_meclis_cumhur_2019, 
         cb_selahattin_2018, milletv_gecerli_oy_2018, 
         milletv_akp_2018, milletv_iyi_oran_2018,
         milletv_mhp_oy_oran_2018, milletv_saadet_oran_2018, 
         referandum_evet_2017, kasim_akp_2015, 
         haziran_hdp_2015, belediye_chp_2014, referandum_evet_2010, 
         akp_15_18_fark, referandum_10_17_fark, 
         log_SeçmenCami, yas_CocukBagm, ci_muh_katsayi)

secim_20_km <- as.data.frame(scale(secim_20))

sub_km_20 <- kmeans(secim_20_km, centers = 2, nstart = 25)

sub_km_20 <- cbind(km_20[, c(1, 3, 4)], subcluster_20 = sub_km_20$cluster)

head(sub_km_20, 20)

count(sub_km_20, subcluster_20)

write_xlsx(sub_km_20, path = "TEAM_ilce_km_subcluster_20.xlsx")


####
colnames(km_ulas)

km_24 <- km_ulas %>%
  filter(km_30 == 24) %>%
  select(id, km_30)

km_24 <- merge(x = km_24, y = tr_kume_v3, by = "id")

nrow(km_24)

secim_24 <- km_24 %>%
  select(sege2017, belediye_meclis_cumhur_2019, 
         cb_selahattin_2018, milletv_gecerli_oy_2018, 
         milletv_akp_2018, milletv_iyi_oran_2018,
         milletv_mhp_oy_oran_2018, milletv_saadet_oran_2018, 
         referandum_evet_2017, kasim_akp_2015, 
         haziran_hdp_2015, belediye_chp_2014, referandum_evet_2010, 
         akp_15_18_fark, referandum_10_17_fark, 
         log_SeçmenCami, yas_CocukBagm, ci_muh_katsayi)

secim_24_km <- as.data.frame(scale(secim_24))

sub_km_24 <- kmeans(secim_24_km, centers = 2, nstart = 25)

sub_km_24 <- cbind(km_24[, c(1, 3, 4)], subcluster_24 = sub_km_24$cluster)


count(sub_km_24, subcluster_24)

write_xlsx(sub_km_24, path = "TEAM_ilce_km_subcluster_24.xlsx")


####
colnames(km_ulas)

km_30 <- km_ulas %>%
  filter(km_30 == 30) %>%
  select(id, km_30)

km_30 <- merge(x = km_30, y = tr_kume_v3, by = "id")

nrow(km_30)

secim_30 <- km_30 %>%
  select(sege2017, belediye_meclis_cumhur_2019, 
         cb_selahattin_2018, milletv_gecerli_oy_2018, 
         milletv_akp_2018, milletv_iyi_oran_2018,
         milletv_mhp_oy_oran_2018, milletv_saadet_oran_2018, 
         referandum_evet_2017, kasim_akp_2015, 
         haziran_hdp_2015, belediye_chp_2014, referandum_evet_2010, 
         akp_15_18_fark, referandum_10_17_fark, 
         log_SeçmenCami, yas_CocukBagm, ci_muh_katsayi)

secim_30_km <- as.data.frame(scale(secim_30))

sub_km_30 <- kmeans(secim_30_km, centers = 2, nstart = 25)

sub_km_30 <- cbind(km_30[, c(1, 3, 4)], subcluster_30 = sub_km_30$cluster)


count(sub_km_30, subcluster_30)

write_xlsx(sub_km_30, path = "TEAM_ilce_km_subcluster_30.xlsx")

####
colnames(ilce_recat)

km1_2_3 <- ilce_recat %>%
  filter(k18 == 1 | k18 == 2 | k18 == 3) %>%
  select(id, subcluster, k6, k12, k18)

km1_2_3 <- merge(x = km1_2_3, y = tr_kume_v3, by = "id")

nrow(km1_2_3)

secim_km1_2_3 <- km1_2_3 %>%
  select(sege2017, belediye_meclis_cumhur_2019, 
         cb_selahattin_2018, milletv_gecerli_oy_2018, 
         milletv_akp_2018, milletv_iyi_oran_2018,
         milletv_mhp_oy_oran_2018, milletv_saadet_oran_2018, 
         referandum_evet_2017, kasim_akp_2015, 
         haziran_hdp_2015, belediye_chp_2014, referandum_evet_2010, 
         akp_15_18_fark, referandum_10_17_fark, 
         log_SeçmenCami, yas_CocukBagm, ci_muh_katsayi)

secim_km1_2_3 <- as.data.frame(scale(secim_km1_2_3))

sub_km1_2_3 <- kmeans(secim_km1_2_3, centers = 3, nstart = 25)

sub_km1_2_3 <- cbind(km1_2_3[, c(1, 3, 4)], subcluster1_2_3 = sub_km1_2_3$cluster)

count(sub_km1_2_3, subcluster1_2_3)

write_xlsx(sub_km1_2_3, path = "TEAM_ilce_km_sub_1_2_3.xlsx")



