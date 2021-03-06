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

#combine datasets
Gages_l <- do.call("rbind", list(FallsLake, Clayton, Goldsboro, Kinston)) %>%
  select(-site_no) 

Gages_w <- Gages_l %>%
  pivot_wider(names_from = gage, values_from = discharge_mean) %>%
  arrange(datetime)

#export processed data
write.csv(FallsLake, "./Data/Processed/FallsLake_processed.csv")
write.csv(Clayton, "./Data/Processed/Clayton_processed.csv")
write.csv(Goldsboro, "./Data/Processed/Goldsboro_processed.csv")
write.csv(Kinston, "./Data/Processed/Kinston_processed.csv")
write.csv(Gages_l, "./Data/Processed/USGS1.csv")
write.csv(Gages_w, "./Data/Processed/USGS2.csv")
