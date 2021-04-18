#load packages
library(tidyverse)

#import data
FallsLake <- read.csv("./Data/Raw/02087183_FallsLake_daily.csv") %>%
  select(2, 3, 6) %>%
  mutate(gage = "Falls Lake",
         datetime = as.Date(datetime, format = "%m/%d/%Y")) %>%
  rename(discharge_mean = Discharge..cubic.feet.per.second..Minimum..1)


Clayton <- read.csv("./Data/Raw/02087500_Clayton_daily.csv") #%>%
  select(2, 3, 6) %>%
  mutate(gage = "Clayton",
         datetime = as.Date(datetime, format = "%m/%d/%Y")) %>%
  rename(discharge_mean = Discharge..cubic.feet.per.second..Minimum..1)
