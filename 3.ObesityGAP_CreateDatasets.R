#---------------------
## UNIR BASES DE DATOS
#---------------------

datos_sindiff <- obesity_diff %>% 
  filter(year %in% c(1995, 2000, 2005, 2010, 2016)) %>% 
  left_join(obesity_both) %>% 
  left_join(gii) %>% 
  left_join(gni) %>% 
  left_join(urban_pop) %>% 
  left_join(fertility_rate) %>% 
  left_join(food_supply) %>% 
  left_join(gini) %>% 
  left_join(smoking_diff) %>% 
  arrange(country, year) %>% 
  mutate(log_gni = log(gni)) %>% 
  select(-gni) %>% 
  group_by(country) %>% 
  tidyr::fill(gini, .direction = "downup")

datos_diff <- obesity_diff %>% 
  filter(year %in% c(1995, 2000, 2005, 2010, 2016)) %>% 
  left_join(obesity_both) %>% 
  left_join(life_expectancy_diff) %>%
  left_join(labour_participation_diff) %>% 
  left_join(secondary_education_diff) %>% 
  left_join(share_fem_parliament) %>% 
  left_join(gni) %>% 
  left_join(urban_pop) %>% 
  left_join(fertility_rate) %>% 
  left_join(food_supply) %>% 
  left_join(gini) %>% 
  left_join(smoking_diff) %>% 
  arrange(country, year) %>% 
  mutate(log_gni = log(gni)) %>% 
  select(-gni) %>% 
  group_by(country) %>% 
  tidyr::fill(gini, .direction = "downup")

