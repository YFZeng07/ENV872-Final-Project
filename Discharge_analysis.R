#load packages
library(tidyverse)

##import datasets===============================
FallsLake <- read.csv("./Data/Processed/FallsLake_processed.csv") %>%
  select(2:5) %>%
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d"))

Clayton <- read.csv("./Data/Processed/Clayton_processed.csv") %>%
  select(2:5)  %>%
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d"))

Goldsboro <- read.csv("./Data/Processed/Goldsboro_processed.csv") %>%
  select(2:5)  %>%
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d"))

Kinston <- read.csv("./Data/Processed/Kinston_processed.csv") %>%
  select(2:5)  %>%
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d"))

Gages <- read.csv("./Data/Processed/USGS_processed.csv") %>%
  select(-1) 
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d"))


#1. Plot discharge for each site

ggplot(data = Gages, aes(x = datetime, y)) +
  geom_line(data = FallsLake, aes(x = datetime, y = discharge_mean)) #+
  geom_point(data = Clayton, aes(x = datetime, y = discharge_mean))

#1. Time series analysis for each site
#2. Discharge volumn before and after the dam construction comparison
#3. March adn April