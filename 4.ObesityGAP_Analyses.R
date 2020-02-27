#-------------
## REGRESIONES
#-------------

lm(obesity_diff ~ value_both + gii + year + country, data = datos_sindiff) %>% tidy()
lm(obesity_diff ~ value_both + gii + gini + log_gni + year + country, data = datos_sindiff) %>% tidy()
lm(obesity_diff ~ value_both + gii + smoking_diff + urban_pop + fertility_rate + food_supply + year + country, data = datos_sindiff) %>% tidy()
lm(obesity_diff ~ value_both + gii + gini + log_gni + smoking_diff + urban_pop + fertility_rate + food_supply + year + country, data = datos_sindiff) %>% tidy()

lm(obesity_diff ~ value_both + life_expectancy_diff + labour_participation_diff + secondary_education_diff + share_fem_parliament + 
     year + country, data = datos_diff) %>% tidy()
lm(obesity_diff ~ value_both + life_expectancy_diff + labour_participation_diff + secondary_education_diff + share_fem_parliament +
     gini + log_gni + 
     year + country, data = datos_diff) %>% tidy()
lm(obesity_diff ~ value_both + life_expectancy_diff + labour_participation_diff + secondary_education_diff + share_fem_parliament +
     smoking_diff + urban_pop + log_gni + fertility_rate + food_supply +
     year + country, data = datos_diff) %>% tidy()
lm(obesity_diff ~ value_both + life_expectancy_diff + labour_participation_diff + secondary_education_diff + share_fem_parliament +
     gini + smoking_diff + urban_pop + log_gni + fertility_rate + food_supply +
     year + country, data = datos_diff) %>% tidy()