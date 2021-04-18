#load packages
library(tidyverse)

#import and wrangle data
FallsLake <- read.csv("./Data/Raw/02087183_FallsLake_daily.csv") %>%
  select(2, 3, 6) %>%
  mutate(gage = "Falls Lake",
         datetime = as.Date(datetime, format = "%m/%d/%Y")) %>%
  rename(discharge_mean = Discharge..cubic.feet.per.second..Minimum..1)

Clayton <- read.csv("./Data/Raw/02087500_Clayton_daily.csv") %>%
  select(2, 3, 6) %>%
  mutate(gage = "Clayton",
         datetime = as.Date(datetime, format = "%m/%d/%Y")) %>%
  rename(discharge_mean = Discharge..cubic.feet.per.second..Minimum..1)

Goldsboro <- read.csv("./Data/Raw/02089000_Goldsboro_daily.csv") %>%
  select(2, 3, 6) %>%
  mutate(gage = "Goldsboro",
         datetime = as.Date(datetime, format = "%m/%d/%Y")) %>%
  rename(discharge_mean = Discharge..cubic.feet.per.second..Minimum..1)

Kinston <- read.csv("./Data/Raw/02089500_Kinston_daily.csv") %>%
  select(2, 3, 6) %>%
  mutate(gage = "Kinston",
         datetime = as.Date(datetime, format = "%m/%d/%Y")) %>%
  rename(discharge_mean = Discharge..cubic.feet.per.second..Minimum..1)

#combine data


#export processed data

