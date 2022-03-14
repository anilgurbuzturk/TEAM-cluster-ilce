library(tidyverse)

library(ggplot2)


str(km_ulas_final)

head(km_ulas_final, 10)

colnames(km_ulas_final)


# Boxplot Kümelerde Cumhur İttifakı Oy Oranı

km_ulas_final %>%
  ggplot() +
  geom_boxplot(mapping = aes(x = as.factor(cluster_16), y = Cİ,
                             color = as.factor(cluster_16)),
               varwidth = TRUE,
               fill = NA,
               lwd = 1) +
  scale_color_manual(breaks = c("1", "2", "3", "4",
                               "5", "6", "7", "8",
                               "9", "10", "11", "12",
                               "13", "14", "15", "16"),
                    values=c("#FD0321", "#FD5961", "#FA007D", "#FFA3A3",
                             "#FFBDFF", "#DDD9C4", "#31869B", "#990099",
                             "#FF57FF", "#3399FF", "#85C2FF", "#FF9900",
                             "#FFBD5D", "#FFE3AB", "#FFF9E5", "#DAEEF3")) +
  geom_jitter(mapping = aes(x = as.factor(cluster_16), y = Cİ, 
                            color = as.factor(cluster_16)),
              width = 0.2,
              alpha = 0.8,
              size = 1) +
  scale_color_manual(breaks = c("1", "2", "3", "4",
                                  "5", "6", "7", "8",
                                  "9", "10", "11", "12",
                                  "13", "14", "15", "16"),
                       values=c("#FD0321", "#FD5961", "#FA007D", "#FFA3A3",
                                "#FFBDFF", "#DDD9C4", "#31869B", "#990099",
                                "#FF57FF", "#3399FF", "#85C2FF", "#FF9900",
                                "#FFBD5D", "#FFE3AB", "#FFF9E5", "#DAEEF3")) +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(title = "Kümelerde Cumhur İttifakı Oy Oranı",
       subtitle = "K-means yöntemine göre 16'lı küme",
       caption = "2018 Milletvekili Genel Seçimi",
       x = "Kümeler",
       y = "Ak Parti ve MHP oy oranı toplamı")
ggsave("images/km16_ci2018.png", width = 20, height = 10, unit = "cm", dpi = 300)

# Boxplot Kümelerde Millet İttifakı Oy Oranı
km_ulas_final %>%
  mutate(Mİ = `Mİ+HDP` - HDP) %>%
  ggplot() +
  geom_boxplot(mapping = aes(x = as.factor(cluster_16), y = Mİ,
                             color = as.factor(cluster_16)),
               varwidth = TRUE,
               fill = NA,
               lwd = 1) +
  scale_color_manual(breaks = c("1", "2", "3", "4",
                                "5", "6", "7", "8",
                                "9", "10", "11", "12",
                                "13", "14", "15", "16"),
                     values=c("#FD0321", "#FD5961", "#FA007D", "#FFA3A3",
                              "#FFBDFF", "#DDD9C4", "#31869B", "#990099",
                              "#FF57FF", "#3399FF", "#85C2FF", "#FF9900",
                              "#FFBD5D", "#FFE3AB", "#FFF9E5", "#DAEEF3")) +
  geom_jitter(mapping = aes(x = as.factor(cluster_16), y = Mİ, 
                            color = as.factor(cluster_16)),
              width = 0.2,
              alpha = 0.8,
              size = 1) +
  scale_color_manual(breaks = c("1", "2", "3", "4",
                                "5", "6", "7", "8",
                                "9", "10", "11", "12",
                                "13", "14", "15", "16"),
                     values=c("#FD0321", "#FD5961", "#FA007D", "#FFA3A3",
                              "#FFBDFF", "#DDD9C4", "#31869B", "#990099",
                              "#FF57FF", "#3399FF", "#85C2FF", "#FF9900",
                              "#FFBD5D", "#FFE3AB", "#FFF9E5", "#DAEEF3")) +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(title = "Kümelerde Millet İttifakı Oy Oranı",
       subtitle = "K-means yöntemine göre 16'lı küme",
       caption = "2018 Milletvekili Genel Seçimi",
       x = "Kümeler",
       y = "CHP, İYİP ve SP oy oranı toplamı")
ggsave("images/km16_mi2018.png", width = 20, height = 10, unit = "cm", dpi = 300)


# Boxplot Kümelerde HDP Oy Oranı
km_ulas_final %>%
  ggplot() +
  geom_boxplot(mapping = aes(x = as.factor(cluster_16), y = HDP,
                             color = as.factor(cluster_16)),
               varwidth = TRUE,
               fill = NA,
               lwd = 1) +
  scale_color_manual(breaks = c("1", "2", "3", "4",
                                "5", "6", "7", "8",
                                "9", "10", "11", "12",
                                "13", "14", "15", "16"),
                     values=c("#FD0321", "#FD5961", "#FA007D", "#FFA3A3",
                              "#FFBDFF", "#DDD9C4", "#31869B", "#990099",
                              "#FF57FF", "#3399FF", "#85C2FF", "#FF9900",
                              "#FFBD5D", "#FFE3AB", "#FFF9E5", "#DAEEF3")) +
  geom_jitter(mapping = aes(x = as.factor(cluster_16), y = HDP, 
                            color = as.factor(cluster_16)),
              width = 0.2,
              alpha = 0.8,
              size = 1) +
  scale_color_manual(breaks = c("1", "2", "3", "4",
                                "5", "6", "7", "8",
                                "9", "10", "11", "12",
                                "13", "14", "15", "16"),
                     values=c("#FD0321", "#FD5961", "#FA007D", "#FFA3A3",
                              "#FFBDFF", "#DDD9C4", "#31869B", "#990099",
                              "#FF57FF", "#3399FF", "#85C2FF", "#FF9900",
                              "#FFBD5D", "#FFE3AB", "#FFF9E5", "#DAEEF3")) +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(title = "Kümelerde HDP Oy Oranı",
       subtitle = "K-means yöntemine göre 16'lı küme",
       caption = "2018 Milletvekili Genel Seçimi",
       x = "Kümeler",
       y = "HDP oy oranı")
ggsave("images/km16_hdp2018.png", width = 20, height = 10, unit = "cm", dpi = 300)


# Scatter Plot İlçelerin Çocuk Bağımlılık Oranına Göre Dağılımı

km_ulas_final %>%
  mutate(ci_muh_katsayi = tr_kume_v3$ci_muh_katsayi,
         egitim = tr_kume_v3$egitim_YuksekokulUzeri,
         cocuk = tr_kume_v3$yas_CocukBagm) %>%
  ggplot() +
  geom_point(mapping = aes(x = sege2017, y = cocuk,
                           color = as.factor(cluster_16),
                           size = `Kayıtlı seçmen sayısı`),
             alpha = 0.8) +
  scale_color_manual(breaks = c("1", "2", "3", "4",
                                "5", "6", "7", "8",
                                "9", "10", "11", "12",
                                "13", "14", "15", "16"),
                     values=c("#FD0321", "#FD5961", "#FA007D", "#FFA3A3",
                              "#FFBDFF", "#DDD9C4", "#31869B", "#990099",
                              "#FF57FF", "#3399FF", "#85C2FF", "#FF9900",
                              "#FFBD5D", "#FFE3AB", "#FFF9E5", "#DAEEF3")) +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(title = "SEGE Değeri ve Çocuk Bağımlılık Oranına Göre İlçelerin Dağılımı",
       caption = "SEGE: Sosyo-Ekonomik Gelişmişlik Endeksi
                  Çocuk bağm oranı: 0-14 yaşın 15-64 yaşa oranı",
       x = "SEGE değeri",
       y = "Çocuk bağımlılık oranı")
ggsave("images/km16_sege_cocuk.png", width = 20, height = 10, unit = "cm", dpi = 300)
  


# Scatter Plot İlçelerin Eğitim Durumuna Göre Dağılımı

km_ulas_final %>%
  mutate(ci_muh_katsayi = tr_kume_v3$ci_muh_katsayi,
         egitim = tr_kume_v3$egitim_YuksekokulUzeri,
         cocuk = tr_kume_v3$yas_CocukBagm) %>%
  ggplot() +
  geom_point(mapping = aes(x = sege2017, y = egitim,
                           color = as.factor(cluster_16),
                           size = `Kayıtlı seçmen sayısı`),
             alpha = 0.8) +
  scale_color_manual(breaks = c("1", "2", "3", "4",
                                "5", "6", "7", "8",
                                "9", "10", "11", "12",
                                "13", "14", "15", "16"),
                     values=c("#FD0321", "#FD5961", "#FA007D", "#FFA3A3",
                              "#FFBDFF", "#DDD9C4", "#31869B", "#990099",
                              "#FF57FF", "#3399FF", "#85C2FF", "#FF9900",
                              "#FFBD5D", "#FFE3AB", "#FFF9E5", "#DAEEF3")) +
  theme_minimal() +
  theme(legend.position = "none") +
  labs(title = "SEGE Değeri ve Üniversite Mezunu Oranına Göre İlçelerin Dağılımı",
       caption = "SEGE: Sosyo-Ekonomik Gelişmişlik Endeksi
                  Üniversite mezunu: Önlisans, lisans veya lisansüstü mezunu",
       x = "SEGE değeri",
       y = "Üniversite mezunu oranı")
ggsave("images/km16_sege_egitim.png", width = 20, height = 10, unit = "cm", dpi = 300)





