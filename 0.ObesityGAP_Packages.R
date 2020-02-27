library(wbstats) 
library(RSelenium)
library(readr)
library(dplyr)
library(tidyr)
library(stringr)
library(broom)

PackagesToUse <- c("wbstats", "RSelenium", "readr", "dplyr", "tidyr", "stringr", "broom")

PackagesToInstall <- PackagesToUse[!(PackagesToUse %in% installed.packages()[,"Package"])]

lapply(PackagesToInstall, install.packages)

lapply(PackagesToUse, require, character.only = TRUE)

rm(PackagesToUse, PackagesToInstall)