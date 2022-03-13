library(readxl)

library(tidyverse)

tr_kume_v3 <- read_excel("tr_kume_v3.xlsx",
                         sheet = "Sheet1",
                         col_types = c("numeric", "text", "text", 
                                       "text", "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric", 
                                       "numeric", "numeric", "numeric"))

View(tr_kume_v3)

str(tr_kume_v3)

# Veri içerisinden sadece ilçelere ilişkin bilgileri al
# Bunlar aynı zamanda kümelemede kullanılacak değişkenler

colnames(tr_kume_v3)

secim <- tr_kume_v3 %>%
  select(sege2017, belediye_meclis_cumhur_2019, 
         cb_selahattin_2018, milletv_gecerli_oy_2018, 
         milletv_akp_2018, milletv_iyi_oran_2018,
         milletv_mhp_oy_oran_2018, milletv_saadet_oran_2018, 
         referandum_evet_2017, kasim_akp_2015, 
         haziran_hdp_2015, belediye_chp_2014, referandum_evet_2010, 
         akp_15_18_fark, referandum_10_17_fark, 
         log_SeçmenCami, yas_CocukBagm, ci_muh_katsayi)


