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



