#load packages
library(tidyverse)

#import datasets
FallsLake <- read.csv("./Data/Processed/FallsLake_processed.csv") %>%
  select(2:5) %>%
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d"))

Clayton <- read.csv("./Data/Processed/Clayton_processed.csv") %>%
  select(2:5)

Goldsboro <- read.csv("./Data/Processed/Goldsboro_processed.csv") %>%
  select(2:5)

Kinston <- read.csv("./Data/Processed/Kinston_processed.csv") %>%
  select(2:5)

#1. Plot discharge for each site
ggplot() +
  geom_line(data = FallsLake, aes(x = datetime, y = discharge_mean)) #+
  geom_point(data = Clayton, aes(x = datetime, y = discharge_mean))

#1. Time series analysis for each site
#2. Discharge volumn before and after the dam construction comparison
#3. March adn April