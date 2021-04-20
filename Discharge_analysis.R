#load packages
library(tidyverse)
library(lubridate)
library(ggpmisc)

##Preparation===============================
#import datasets
FallsLake <- read.csv("./Data/Processed/FallsLake_processed.csv") %>%
  select(2:5) %>%
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d")) %>%
  na.omit()

Clayton <- read.csv("./Data/Processed/Clayton_processed.csv") %>%
  select(2:5)  %>%
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d"))

Goldsboro <- read.csv("./Data/Processed/Goldsboro_processed.csv") %>%
  select(2:5)  %>%
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d"))

Kinston <- read.csv("./Data/Processed/Kinston_processed.csv") %>%
  select(2:5)  %>%
  mutate(datetime = as.Date(datetime, format = "%Y-%m-%d")) %>%
  na.omit()

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
  geom_vline(xintercept = 1981, size = 1.5) +
  geom_text(aes(x = 1981, label="1981", y = 5000), 
            col = "black", size = 6, vjust = -0.5, angle = -90) +
  xlab("Year") + ylab("Annual mean discharge (cfs)") +
  labs(col = "Gage") +
  scale_color_discrete(breaks=c("Falls Lake","Clayton","Goldsboro", "Kinston")) +
  MyTheme

#2. Time series analysis for each site==================
#Falls Lake
FallsLake_ts <- ts(FallsLake$discharge_mean, 
                           start = c(1970,7), frequency = 365)
FallsLake_decomposed <- stl(FallsLake_ts, s.window = "periodic")
plot(FallsLake_decomposed)

#Clayton
Clayton_ts <- ts(Clayton$discharge_mean, 
                   start = c(1927,8), frequency = 365)
Clayton_decomposed <- stl(Clayton_ts, s.window = "periodic")
plot(Clayton_decomposed)

#Goldsboro
Goldsboro_ts <- ts(Goldsboro$discharge_mean, 
                 start = c(1930,3), frequency = 365)
Goldsboro_decomposed <- stl(Goldsboro_ts, s.window = "periodic")
plot(Goldsboro_decomposed)

#Kinston
Kinston_ts <- ts(Kinston$discharge_mean, 
                   start = c(1930,3), frequency = 365)
Kinston_decomposed <- stl(Kinston_ts, s.window = "periodic")
plot(Kinston_decomposed)


#3. Discharge before and after the dam construction (1978-1981)=============================
#Falls Lake
FallsLake_pre <- FallsLake %>%
  filter(datetime <= as.Date("1977-12-31"))
FallsLake_post <- FallsLake %>%
  filter(datetime >= as.Date("1982-01-01"))

t.test(x = FallsLake_pre$discharge_mean, y = FallsLake_post$discharge_mean)

#Clayton
Clayton_pre <- Clayton %>%
  filter(datetime <= as.Date("1977-12-31"))
Clayton_post <- Clayton %>%
  filter(datetime >= as.Date("1982-01-01"))

t.test(x = Clayton_pre$discharge_mean, y = Clayton_post$discharge_mean)

#Goldsboro
Goldsboro_pre <- Goldsboro %>%
  filter(datetime <= as.Date("1977-12-31"))
Goldsboro_post <- Goldsboro %>%
  filter(datetime >= as.Date("1982-01-01"))

t.test(x = Goldsboro_pre$discharge_mean, y = Goldsboro_post$discharge_mean)

#Kinston
Kinston_pre <- Kinston %>%
  filter(datetime <= as.Date("1977-12-31"))
Kinston_post <- Kinston %>%
  filter(datetime >= as.Date("1982-01-01"))

t.test(x = Kinston_pre$discharge_mean, y = Kinston_post$discharge_mean)


#4. annual average GLM================================
#Falls Lake
FallsLake_annual <- FallsLake %>%
  mutate(year = year(datetime)) %>%
  group_by(year) %>%
  summarise(annual_mean = mean(discharge_mean))

ggplot(FallsLake_annual, aes(x = year, y = annual_mean)) +
  geom_point() +
  geom_line() +
  geom_smooth(method = "lm", se = FALSE) +
  stat_poly_eq(formula = y~x, 
               aes(label = paste(..eq.label.., ..rr.label.., sep = "~~~")), 
               parse = TRUE) 

#5. March adn April