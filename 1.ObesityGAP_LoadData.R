setwd("C:/Users/pablo.aguirre/Downloads/")

#---------------------
## DATOS BANCO MUNDIAL
#---------------------

new_cache <- wbcache()

# SMOKING PREVALENCE
smoking_male <- wb(indicator = "SH.PRV.SMOK.MA", startdate = 1995, enddate = 2020)
smoking_female <- wb(indicator = "SH.PRV.SMOK.FE", startdate = 1995, enddate = 2020)

# GINI INDEX
gini <- wb(indicator = "SI.POV.GINI", startdate = 1995, enddate = 2020)

# GROSS NATIONAL INCOME
gni <- wb(indicator = "NY.GNP.PCAP.PP.KD", startdate = 1995, enddate = 2020) 

# URBAN POPULATION
urban_pop <- wb(indicator = "SP.URB.TOTL.IN.ZS", startdate = 1995, enddate = 2020)

# FERTILITY RATE
fertility_rate <- wb(indicator = "SP.DYN.TFRT.IN", startdate = 1995, enddate = 2020)

rm(new_cache)

#------------
## DATOS UNDP
#------------

indicadores_undp <- c(68606, # Gender Inequality Index (GII)
                      120606, # Life expectancy at birth, female (years)
                      121106, # Life expectancy at birth, male (years)
                      48706, # Labour force participation rate (% ages 15 and older), female
                      48806, # Labour force participation rate (% ages 15 and older), male
                      23906, # Population with at least some secondary education, female (% ages 25 and older)
                      24006, # Population with at least some secondary education, male (% ages 25 and older)
                      31706) # Share of seats in parliament (% held by women)

fprof <- makeFirefoxProfile(list(browser.download.folderList = 2L, browser.download.dir = "C:/Users/pablo.aguirre/Downloads/GAP_OBESITY_2020",
                                 browser.download.manager.showWhenStarting = FALSE,
                                 browser.helperApps.neverAsk.openFile = "text/comma-separated-values, text/csv, application/csv, application/excel, application/vnd.ms-excel, application/vnd.msexcel, text/anytext",
                                 browser.download.useDownloadDir = TRUE,
                                 browser.helperApps.neverAsk.saveToDisk =  "text/comma-separated-values, text/csv, application/csv, application/excel, application/vnd.ms-excel, application/vnd.msexcel, text/anytext"))

rd <- rsDriver(browser = "firefox", extraCapabilities = fprof)
rem_dr <- rd[["client"]]

for (i in indicadores_undp){
  
  url_undp <- paste0("http://hdr.undp.org/en/indicators/", i)
  
  rem_dr$navigate(url_undp)
  descargar_undp <- rem_dr$findElement(using = "class", value = "button-text")
  descargar_undp$clickElement()
  
  print(i)
}

rd$client$close()
rd$server$stop()

rm(rd, indicadores_undp, descargar_undp, url_undp, i)

# LIFE EXPECTANCY
life_expectancy_male <- read_csv("Life expectancy at birth, male (years).csv")
life_expectancy_female <- read_csv("Life expectancy at birth, female (years).csv")

file.remove("Life expectancy at birth, male (years).csv")
file.remove("Life expectancy at birth, female (years).csv")

# SECONDARY EDUCATION
secondary_education_male <- read_csv("Population with at least some secondary education, male (% ages 25 and older).csv")
secondary_education_female <- read_csv("Population with at least some secondary education, female (% ages 25 and older).csv")

file.remove("Population with at least some secondary education, male (% ages 25 and older).csv")
file.remove("Population with at least some secondary education, female (% ages 25 and older).csv")

# GENDER INEQUALITY INDEX
gii <- read_csv("Gender Inequality Index (GII).csv")

file.remove("Gender Inequality Index (GII).csv")

# LABOUR PARTICIPATION
labour_participation_male <- read_csv("Labour force participation rate (% ages 15 and older), male.csv")
labour_participation_female <- read_csv("Labour force participation rate (% ages 15 and older), female.csv")

file.remove("Labour force participation rate (% ages 15 and older), male.csv")
file.remove("Labour force participation rate (% ages 15 and older), female.csv")

# SHARE OF FEMALE PARLIAMENT
share_fem_parliament <- read_csv("Share of seats in parliament (% held by women).csv")

file.remove("Share of seats in parliament (% held by women).csv")

#----------
## DATO FAO
#----------

url_fao_1 <- "http://fenixservices.fao.org/faostat/static/bulkdownloads/FoodBalanceSheetsHistoric_E_All_Data.zip"
url_fao_2 <- "http://fenixservices.fao.org/faostat/static/bulkdownloads/FoodBalanceSheets_E_All_Data.zip"

download.file(url = url_fao_1, destfile = "foodsupply1.zip")
download.file(url = url_fao_2, destfile = "foodsupply2.zip")
unzip("foodsupply1.zip", files = "FoodBalanceSheetsHistoric_E_All_Data.csv")
unzip("foodsupply2.zip", files = "FoodBalanceSheets_E_All_Data.csv")
file.remove("foodsupply1.zip")
file.remove("foodsupply2.zip")

fs1 <- read_csv("FoodBalanceSheetsHistoric_E_All_Data.csv")

fs2 <- read_csv("FoodBalanceSheets_E_All_Data.csv")

file.remove("FoodBalanceSheetsHistoric_E_All_Data.csv")
file.remove("FoodBalanceSheets_E_All_Data.csv")

rm(url_fao_1, url_fao_2)

#----------
## DATO OMS
#----------

rd <- rsDriver(browser = "firefox", extraCapabilities = fprof)
rem_dr <- rd[["client"]]

url_oms <- "https://apps.who.int/gho/data/view.main.CTRY2450A"

rem_dr$navigate(url_oms)
submit <- rem_dr$findElement(using = "class", value = "submit")

rem_dr$mouseMoveToLocation(webElement = submit)
rem_dr$mouseMoveToLocation(y = 152, x = -150)
rem_dr$click(1)

rd$client$close()
rd$server$stop()

rm(rd, rem_dr, submit, url_oms, fprof)

obesity <- read_csv("data.csv", skip = 3)
