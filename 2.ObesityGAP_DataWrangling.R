setwd("C:/Users/pablo.aguirre/Downloads/")

#---------------------
## DATOS BANCO MUNDIAL
#---------------------

# SMOKING PREVALENCE

smoking_male <- smoking_male %>% 
  mutate(
    country = dplyr::recode(country,
                            "Bahamas, The" = "Bahamas",
                            "Egypt, Arab Rep." = "Egypt",
                            "Gambia, The" = "Gambia",
                            "Iran, Islamic Rep." = "Iran",
                            "Korea, Rep." = "Korea",
                            "Kyrgyz Republic" = "Kyrgyzstan",
                            "Yemen, Rep." = "Yemen")) %>% 
  select(country, year = date, smoking_male = value)

smoking_female <- smoking_female %>% 
  mutate(
    country = dplyr::recode(country,
                            "Bahamas, The" = "Bahamas",
                            "Egypt, Arab Rep." = "Egypt",
                            "Gambia, The" = "Gambia",
                            "Iran, Islamic Rep." = "Iran",
                            "Korea, Rep." = "Korea",
                            "Kyrgyz Republic" = "Kyrgyzstan",
                            "Yemen, Rep." = "Yemen")) %>% 
  select(country, year = date, smoking_female = value)

smoking_diff <- smoking_female %>% 
  left_join(smoking_male) %>% as_tibble() %>% 
  mutate(smoking_diff = smoking_female - smoking_male) %>% 
  mutate(year = as.numeric(year))


rm(smoking_female, smoking_male)

# GINI INDEX

gini <- gini %>% 
  mutate(
    country = dplyr::recode(country,
                            "Bahamas, The" = "Bahamas",
                            "Cote d'Ivoire" = "Cote dIvoire",
                            "Congo, Dem. Rep." = "Congo DR",
                            "Egypt, Arab Rep." = "Egypt",
                            "Gambia, The" = "Gambia",
                            "Iran, Islamic Rep." = "Iran",
                            "Korea, Rep." = "Korea",
                            "Kyrgyz Republic" = "Kyrgyzstan",
                            "Micronesia, Fed. Sts." = "Micronesia",
                            "St. Lucia" = "Saint Lucia",
                            "Venezuela, RB" = "Venezuela",
                            "Yemen, Rep." = "Yemen")) %>% 
  select(country, year = date, gini = value) %>% as_tibble() %>% 
  mutate(year = as.numeric(year))

# GROSS NATIONAL INCOME

gni <- gni %>% 
  mutate(
    country = dplyr::recode(country,
                            "Bahamas, The" = "Bahamas",
                            "Cote d'Ivoire" = "Cote dIvoire",
                            "Congo, Dem. Rep." = "Congo DR",
                            "Egypt, Arab Rep." = "Egypt",
                            "Gambia, The" = "Gambia",
                            "Iran, Islamic Rep." = "Iran",
                            "Korea, Rep." = "Korea",
                            "Kyrgyz Republic" = "Kyrgyzstan",
                            "Micronesia, Fed. Sts." = "Micronesia",
                            "St. Kitts and Nevis" = "Saint Kitts and Nevis",
                            "St. Lucia" = "Saint Lucia",
                            "St. Vincent and the Grenadines" = "Saint Vincent and the Grenadines",
                            "Venezuela, RB" = "Venezuela",
                            "Yemen, Rep." = "Yemen",
                            "Macao SAR, China" = "Macao",
                            "Hong Kong SAR, China" = "Hong Kong")) %>% 
  select(country, year = date, gni = value) %>% as_tibble() %>% 
  mutate(year = as.numeric(year))

# URBAN POPULATION

urban_pop <- urban_pop %>% 
  mutate(
    country = dplyr::recode(country,
                            "Bahamas, The" = "Bahamas",
                            "Cote d'Ivoire" = "Cote dIvoire",
                            "Congo, Dem. Rep." = "Congo DR",
                            "Egypt, Arab Rep." = "Egypt",
                            "Gambia, The" = "Gambia",
                            "Iran, Islamic Rep." = "Iran",
                            "Korea, Rep." = "Korea",
                            "Korea, Dem. PeopleÔÇÖs Rep." = "Korea DR",
                            "Kyrgyz Republic" = "Kyrgyzstan",
                            "Micronesia, Fed. Sts." = "Micronesia",
                            "St. Kitts and Nevis" = "Saint Kitts and Nevis",
                            "St. Lucia" = "Saint Lucia",
                            "St. Vincent and the Grenadines" = "Saint Vincent and the Grenadines",
                            "Venezuela, RB" = "Venezuela",
                            "Yemen, Rep." = "Yemen",
                            "Macao SAR, China" = "Macao",
                            "Hong Kong SAR, China" = "Hong Kong")) %>% 
  select(country, year = date, urban_pop = value) %>% as_tibble() %>% 
  mutate(year = as.numeric(year))

# FERTILITY RATE

fertility_rate <- fertility_rate %>% 
  mutate(
    country = dplyr::recode(country,
                            "Bahamas, The" = "Bahamas",
                            "Cote d'Ivoire" = "Cote dIvoire",
                            "Congo, Dem. Rep." = "Congo DR",
                            "Egypt, Arab Rep." = "Egypt",
                            "Gambia, The" = "Gambia",
                            "Iran, Islamic Rep." = "Iran",
                            "Korea, Rep." = "Korea",
                            "Korea, Dem. PeopleÔÇÖs Rep." = "Korea DR",
                            "Kyrgyz Republic" = "Kyrgyzstan",
                            "Micronesia, Fed. Sts." = "Micronesia",
                            "St. Kitts and Nevis" = "Saint Kitts and Nevis",
                            "St. Lucia" = "Saint Lucia",
                            "St. Vincent and the Grenadines" = "Saint Vincent and the Grenadines",
                            "Venezuela, RB" = "Venezuela",
                            "Yemen, Rep." = "Yemen",
                            "Macao SAR, China" = "Macao",
                            "Hong Kong SAR, China" = "Hong Kong")) %>% 
  select(country, year = date, fertility_rate = value) %>% as_tibble() %>% 
  mutate(year = as.numeric(year))


rm(new_cache)

#------------
## DATOS UNDP
#------------

# LIFE EXPECTANCY

life_expectancy_male <- life_expectancy_male %>%
  mutate(
    Country = dplyr::recode(Country,
                            "Bolivia (Plurinational State of)" = "Bolivia",
                            "C\xf4te d'Ivoire" = "Cote dIvoire",
                            "Congo (Democratic Republic of the)" = "Congo DR",
                            "Congo, Rep." = "Congo",
                            "Czechia" = "Czech Republic",
                            "Eswatini (Kingdom of)" = "Eswatini",
                            "Iran (Islamic Republic of)" = "Iran",
                            "Korea (Republic of)" = "Korea",
                            "Korea (Democratic People's Rep. of)" = "Korea DR",
                            "Lao People's Democratic Republic" = "Lao PDR",
                            "Micronesia (Federated States of)" = "Micronesia",
                            "Moldova (Republic of)" = "Moldova",
                            "Tanzania (United Republic of)" = "Tanzania",
                            "Venezuela (Bolivarian Republic of)" = "Venezuela",
                            "Viet Nam" = "Vietnam",
                            "Hong Kong, China (SAR)" = "Hong Kong")) %>% 
  slice(-1) %>% select(country = Country, starts_with("19"), starts_with("20")) %>% 
  pivot_longer(2:14, names_to = "year", values_to = "life_expectancy_male") %>% 
  mutate(life_expectancy_male = as.numeric(life_expectancy_male))

life_expectancy_female <- life_expectancy_female %>%
  mutate(
    Country = dplyr::recode(Country,
                            "Bolivia (Plurinational State of)" = "Bolivia",
                            "C\xf4te d'Ivoire" = "Cote dIvoire",
                            "Congo (Democratic Republic of the)" = "Congo DR",
                            "Congo, Rep." = "Congo",
                            "Czechia" = "Czech Republic",
                            "Eswatini (Kingdom of)" = "Eswatini",
                            "Iran (Islamic Republic of)" = "Iran",
                            "Korea (Republic of)" = "Korea",
                            "Korea (Democratic People's Rep. of)" = "Korea DR",
                            "Lao People's Democratic Republic" = "Lao PDR",
                            "Micronesia (Federated States of)" = "Micronesia",
                            "Moldova (Republic of)" = "Moldova",
                            "Tanzania (United Republic of)" = "Tanzania",
                            "Venezuela (Bolivarian Republic of)" = "Venezuela",
                            "Viet Nam" = "Vietnam",
                            "Hong Kong, China (SAR)" = "Hong Kong")) %>% 
  slice(-1) %>% select(country = Country, starts_with("19"), starts_with("20")) %>% 
  pivot_longer(2:14, names_to = "year", values_to = "life_expectancy_female") %>% 
  mutate(life_expectancy_female = as.numeric(life_expectancy_female))

life_expectancy_diff <- life_expectancy_female %>% 
  left_join(life_expectancy_male) %>% 
  mutate(life_expectancy_diff = life_expectancy_female - life_expectancy_male) %>% 
  select(country, year, life_expectancy_diff) %>% 
  mutate(year = as.numeric(year))

rm(life_expectancy_female, life_expectancy_male)

# SECONDARY EDUCATION

secondary_education_male <- secondary_education_male %>%
  mutate(
    Country = dplyr::recode(Country,
                            "Bolivia (Plurinational State of)" = "Bolivia",
                            "C\xf4te d'Ivoire" = "Cote dIvoire",
                            "Congo (Democratic Republic of the)" = "Congo DR",
                            "Congo, Rep." = "Congo",
                            "Czechia" = "Czech Republic",
                            "Eswatini (Kingdom of)" = "Eswatini",
                            "Iran (Islamic Republic of)" = "Iran",
                            "Korea (Republic of)" = "Korea",
                            "Lao People's Democratic Republic" = "Lao PDR",
                            "Micronesia (Federated States of)" = "Micronesia",
                            "Moldova (Republic of)" = "Moldova",
                            "Tanzania (United Republic of)" = "Tanzania",
                            "Venezuela (Bolivarian Republic of)" = "Venezuela",
                            "Viet Nam" = "Vietnam",
                            "Hong Kong, China (SAR)" = "Hong Kong")) %>% 
  slice(-1) %>% select(country = Country, starts_with("19"), starts_with("20")) %>% 
  pivot_longer(2:14, names_to = "year", values_to = "secondary_education_male") %>% 
  mutate(secondary_education_male = dplyr::recode(secondary_education_male, 
                                                  ".." = ""),
         secondary_education_male = as.numeric(secondary_education_male))

secondary_education_female <- secondary_education_female %>%
  mutate(
    Country = dplyr::recode(Country,
                            "Bolivia (Plurinational State of)" = "Bolivia",
                            "C\xf4te d'Ivoire" = "Cote dIvoire",
                            "Congo (Democratic Republic of the)" = "Congo DR",
                            "Congo, Rep." = "Congo",
                            "Czechia" = "Czech Republic",
                            "Eswatini (Kingdom of)" = "Eswatini",
                            "Iran (Islamic Republic of)" = "Iran",
                            "Korea (Republic of)" = "Korea",
                            "Lao People's Democratic Republic" = "Lao PDR",
                            "Micronesia (Federated States of)" = "Micronesia",
                            "Moldova (Republic of)" = "Moldova",
                            "Tanzania (United Republic of)" = "Tanzania",
                            "Venezuela (Bolivarian Republic of)" = "Venezuela",
                            "Viet Nam" = "Vietnam",
                            "Hong Kong, China (SAR)" = "Hong Kong")) %>% 
  slice(-1) %>% select(country = Country, starts_with("19"), starts_with("20")) %>% 
  pivot_longer(2:14, names_to = "year", values_to = "secondary_education_female") %>% 
  mutate(secondary_education_female = dplyr::recode(secondary_education_female, 
                                                    ".." = ""),
         secondary_education_female = as.numeric(secondary_education_female))

secondary_education_diff <- secondary_education_female %>% 
  left_join(secondary_education_male) %>% 
  mutate(secondary_education_diff = secondary_education_female - secondary_education_male) %>% 
  select(country, year, secondary_education_diff) %>% 
  mutate(year = as.numeric(year))

rm(secondary_education_female, secondary_education_male)

# GENDER INEQUALITY INDEX

gii <- gii %>%
  mutate(
    Country = dplyr::recode(Country,
                            "Bolivia (Plurinational State of)" = "Bolivia",
                            "C\xf4te d'Ivoire" = "Cote dIvoire",
                            "Congo (Democratic Republic of the)" = "Congo DR",
                            "Congo, Rep." = "Congo",
                            "Czechia" = "Czech Republic",
                            "Eswatini (Kingdom of)" = "Eswatini",
                            "Iran (Islamic Republic of)" = "Iran",
                            "Korea (Republic of)" = "Korea",
                            "Lao People's Democratic Republic" = "Lao PDR",
                            "Micronesia (Federated States of)" = "Micronesia",
                            "Moldova (Republic of)" = "Moldova",
                            "Tanzania (United Republic of)" = "Tanzania",
                            "Venezuela (Bolivarian Republic of)" = "Venezuela",
                            "Viet Nam" = "Vietnam",
                            "Hong Kong, China (SAR)" = "Hong Kong")) %>% 
  slice(-1) %>% select(country = Country, starts_with("19"), starts_with("20")) %>% 
  pivot_longer(2:13, names_to = "year", values_to = "gii") %>% 
  mutate(gii = dplyr::recode(gii,".." = ""),
         gii = as.numeric(gii),
         year = as.numeric(year))

# LABOUR PARTICIPATION

labour_participation_male <- labour_participation_male %>%
  mutate(
    Country = dplyr::recode(Country,
                            "Bolivia (Plurinational State of)" = "Bolivia",
                            "C\xf4te d'Ivoire" = "Cote dIvoire",
                            "Congo (Democratic Republic of the)" = "Congo DR",
                            "Congo, Rep." = "Congo",
                            "Czechia" = "Czech Republic",
                            "Eswatini (Kingdom of)" = "Eswatini",
                            "Iran (Islamic Republic of)" = "Iran",
                            "Korea (Republic of)" = "Korea",
                            "Korea (Democratic People's Rep. of)" = "Korea DR",
                            "Lao People's Democratic Republic" = "Lao PDR",
                            "Micronesia (Federated States of)" = "Micronesia",
                            "Moldova (Republic of)" = "Moldova",
                            "Tanzania (United Republic of)" = "Tanzania",
                            "Venezuela (Bolivarian Republic of)" = "Venezuela",
                            "Viet Nam" = "Vietnam",
                            "Hong Kong, China (SAR)" = "Hong Kong")) %>% 
  slice(-1) %>% select(country = Country, starts_with("19"), starts_with("20")) %>% 
  pivot_longer(2:14, names_to = "year", values_to = "labour_participation_male") %>% 
  mutate(labour_participation_male = as.numeric(labour_participation_male))

labour_participation_female <- labour_participation_female %>%
  mutate(
    Country = dplyr::recode(Country,
                            "Bolivia (Plurinational State of)" = "Bolivia",
                            "C\xf4te d'Ivoire" = "Cote dIvoire",
                            "Congo (Democratic Republic of the)" = "Congo DR",
                            "Congo, Rep." = "Congo",
                            "Czechia" = "Czech Republic",
                            "Eswatini (Kingdom of)" = "Eswatini",
                            "Iran (Islamic Republic of)" = "Iran",
                            "Korea (Republic of)" = "Korea",
                            "Korea (Democratic People's Rep. of)" = "Korea DR",
                            "Lao People's Democratic Republic" = "Lao PDR",
                            "Micronesia (Federated States of)" = "Micronesia",
                            "Moldova (Republic of)" = "Moldova",
                            "Tanzania (United Republic of)" = "Tanzania",
                            "Venezuela (Bolivarian Republic of)" = "Venezuela",
                            "Viet Nam" = "Vietnam",
                            "Hong Kong, China (SAR)" = "Hong Kong")) %>% 
  slice(-1) %>% select(country = Country, starts_with("19"), starts_with("20")) %>% 
  pivot_longer(2:14, names_to = "year", values_to = "labour_participation_female") %>% 
  mutate(labour_participation_female = as.numeric(labour_participation_female))

labour_participation_diff <- labour_participation_female %>% 
  left_join(labour_participation_male) %>% 
  mutate(labour_participation_diff = labour_participation_female - labour_participation_male) %>% 
  select(country, year, labour_participation_diff) %>% 
  mutate(year = as.numeric(year))

rm(labour_participation_female, labour_participation_male)

# SHARE OF FEMALE PARLIAMENT

share_fem_parliament <- share_fem_parliament %>%
  mutate(
    Country = dplyr::recode(Country,
                            "Bolivia (Plurinational State of)" = "Bolivia",
                            "C\xf4te d'Ivoire" = "Cote dIvoire",
                            "Congo (Democratic Republic of the)" = "Congo DR",
                            "Congo, Rep." = "Congo",
                            "Czechia" = "Czech Republic",
                            "Eswatini (Kingdom of)" = "Eswatini",
                            "Iran (Islamic Republic of)" = "Iran",
                            "Korea (Republic of)" = "Korea",
                            "Korea (Democratic People's Rep. of)" = "Korea DR",
                            "Lao People's Democratic Republic" = "Lao PDR",
                            "Micronesia (Federated States of)" = "Micronesia",
                            "Moldova (Republic of)" = "Moldova",
                            "Tanzania (United Republic of)" = "Tanzania",
                            "Venezuela (Bolivarian Republic of)" = "Venezuela",
                            "Viet Nam" = "Vietnam",
                            "Hong Kong, China (SAR)" = "Hong Kong")) %>% 
  slice(-1) %>% select(country = Country, starts_with("19"), starts_with("20")) %>% 
  pivot_longer(2:14, names_to = "year", values_to = "share_fem_parliament") %>% 
  mutate(share_fem_parliament = as.numeric(share_fem_parliament),
         year = as.numeric(year))

#----------
## DATO FAO
#----------

fs1 <- fs1 %>% 
  filter(Item == "Grand Total",
         Element == "Food supply (kcal/capita/day)") %>% 
  select(Area, Element, contains("Y"), -contains("F")) %>% 
  rename_at(vars(starts_with("Y")), ~str_replace(., "Y", ""))

fs2 <- fs2 %>% 
  filter(Item == "Grand Total",
         Element == "Food supply (kcal/capita/day)") %>% 
  select(Area, Element, contains("Y"), -contains("F")) %>% 
  rename_at(vars(starts_with("Y")), ~str_replace(., "Y", ""))

food_supply <- left_join(fs1, fs2) %>%
  mutate(
    Area = dplyr::recode(Area,
                         "Bolivia (Plurinational State of)" = "Bolivia",
                         "C¶te d'Ivoire" = "Cote dIvoire",
                         "Congo, Rep." = "Congo",
                         "Czechia" = "Czech Republic",
                         "Iran (Islamic Republic of)" = "Iran",
                         "Swaziland" = "Eswatini",
                         "Republic of Korea" = "Korea",
                         "Democratic People's Republic of Korea" = "Korea DR",
                         "Lao People's Democratic Republic" = "Lao PDR",
                         "Republic of Moldova" = "Moldova",
                         "The former Yugoslav Republic of Macedonia" = "North Macedonia",
                         "Sudan (former)" = "Sudan",
                         "United Republic of Tanzania" = "Tanzania",
                         "United States of America" = "United States",
                         "Venezuela (Bolivarian Republic of)" = "Venezuela",
                         "Viet Nam" = "Vietnam",
                         "China, Macao SAR" = "Macao",
                         "China, Hong Kong SAR" = "Hong Kong")) %>%
  select(country = Area, starts_with("19"), starts_with("20")) %>% 
  pivot_longer(2:58, names_to = "year", values_to = "food_supply") %>% 
  mutate(year = as.numeric(year))

rm(fs1, fs2)

#----------
## DATO OMS
#----------

obesity <- obesity %>%
  mutate(
    Country = dplyr::recode(Country,
                            "Bolivia (Plurinational State of)" = "Bolivia",
                            "Democratic Republic of the Congo" = "Congo DR",
                            "Congo, Rep." = "Congo",
                            "Côte d'Ivoire" = "Cote dIvoire",
                            "Czechia" = "Czech Republic",
                            "Iran (Islamic Republic of)" = "Iran",
                            "Republic of Korea" = "Korea",
                            "Democratic People's Republic of Korea" = "Korea DR",
                            "Lao People's Democratic Republic" = "LAO PDR",
                            "Republic of Moldova" = "Moldova",
                            "Republic of North Macedonia" = "North Macedonia",
                            "Sudan (former)" = "Sudan",
                            "United Republic of Tanzania" = "Tanzania",
                            "United Kingdom of Great Britain and Northern Ireland" = "United Kingdom",
                            "United States of America" = "United States",
                            "Venezuela (Bolivarian Republic of)" = "Venezuela",
                            "Viet Nam" = "Vietnam"))

obesity_both <- obesity %>% 
  select(c(1, seq(2, 125, 3))) %>% 
  pivot_longer(2:43, names_to = "both", values_to = "value_both") %>% 
  mutate(both = "both",
         year = rep(2016:1975, 195)) %>% 
  select(country = Country, year, both, value_both) %>% 
  filter(value_both != "No data") %>% 
  separate(value_both, into = c("value_both", NA), sep = " ", convert = TRUE) %>% 
  select(-both)

obesity_male <- obesity %>% 
  select(c(1, seq(3, 126, 3))) %>% 
  pivot_longer(2:43, names_to = "male", values_to = "value_male") %>% 
  mutate(male = "male",
         year = rep(2016:1975, 195)) %>% 
  select(country = Country, year, male, value_male) %>% 
  filter(value_male != "No data")  %>% 
  separate(value_male, into = c("value_male", NA), sep = " ", convert = TRUE) %>% 
  select(-male)

obesity_female <- obesity %>% 
  select(c(1, seq(4, 127, 3))) %>% 
  pivot_longer(2:43, names_to = "female", values_to = "value_female") %>% 
  mutate(female = "female",
         year = rep(2016:1975, 195)) %>% 
  select(country = Country, year, female, value_female) %>% 
  filter(value_female != "No data")  %>% 
  separate(value_female, into = c("value_female", NA), sep = " ", convert = TRUE) %>% 
  select(-female)

obesity_diff <- obesity_female %>% 
  left_join(obesity_male) %>% 
  mutate(obesity_diff = value_female - value_male) %>% 
  select(country, year, obesity_diff)

rm(obesity, obesity_female, obesity_male)