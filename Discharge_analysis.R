#load packages
library(tidyverse)
library(lubridate)

##Preparation===============================
#import datasets
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

Gages_l <- read.csv("./Data/Processed/USGS1.csv") %>%
  select(-1) %>%
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d"))

Gages_w <- read.csv("./Data/Processed/USGS2.csv") %>%
  select(-1) %>%
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d"))

#build a ggplot theme
MyTheme <- theme_bw(base_size = 14) +
  theme(axis.text = element_text(color = "black", size = 12),
        axis.title=element_text(size = 14, face = "bold"),
        legend.position = "right",
        plot.title = element_text(hjust = 0.5, size = 16, face = "bold")) 



##1. Plot annual mean discharge for each site========================
#wrangle data
Gages_l_2 <- Gages_l %>%
  mutate(year = year(datetime)) %>%
  group_by(year, gage) %>%
  summarise(annual_mean = mean(discharge_mean))

#plot annual mean
ggplot(data = Gages_l_2, aes(x = year, y = annual_mean, col = gage)) +
  geom_line(size = 1) +
  xlab("Year") + ylab("Annual mean discharge (cfs)") +
  labs(col = "Gage") +
  scale_color_discrete(breaks=c("Falls Lake","Clayton","Goldsboro", "Kinston")) +
  MyTheme

#1. Time series analysis for each site
#2. Discharge volumn before and after the dam construction comparison
#3. March adn April