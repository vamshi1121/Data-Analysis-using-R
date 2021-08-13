#Setting Work Directory
getwd()
setwd("Cyclist Case Study/Data")

#Importing Libraries
library(tidyverse)
library(lubridate)
library(ggplot2)

#Importing Data
f2020_04 <- read.csv("2020_04.csv")
f2020_05 <- read.csv("2020_05.csv")
f2020_06 <- read.csv("2020_06.csv")
f2020_07 <- read.csv("2020_07.csv")
f2020_08 <- read.csv("2020_08.csv")
f2020_09 <- read.csv("2020_09.csv")
f2020_10 <- read.csv("2020_10.csv")
f2020_11 <- read.csv("2020_11.csv")
f2020_12 <- read.csv("2020_12.csv")
f2021_01 <- read.csv("2021_01.csv")
f2021_02 <- read.csv("2021_02.csv")
f2021_03 <- read.csv("2021_03.csv")

f2020_04 <- mutate(f2020_04, month = "April",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))
f2020_05 <- mutate(f2020_05, month = "May",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))
f2020_06 <- mutate(f2020_06, month = "June",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))
f2020_07 <- mutate(f2020_07, month = "July",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))
f2020_08 <- mutate(f2020_08, month = "August",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))
f2020_09 <- mutate(f2020_09, month = "September",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))
f2020_10 <- mutate(f2020_10, month = "October",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))
f2020_11 <- mutate(f2020_11, month = "November",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))
f2020_12 <- mutate(f2020_12, month = "December",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))
f2021_01 <- mutate(f2021_01, month = "January",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))
f2021_02 <- mutate(f2021_02, month = "Febuary",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))
f2021_03 <- mutate(f2021_03, month = "March",
                   start_station_id = as.character(start_station_id),
                   end_station_id = as.character(end_station_id))

data <- bind_rows(f2020_04, f2020_05, f2020_06, f2020_07, 
                  f2020_08, f2020_09, f2020_10, f2020_11, 
                  f2020_12, f2021_01, f2021_02, f2021_03)

colnames(data)

data <- mutate(data, started_at = ymd_hms(started_at), ended_at = ymd_hms(ended_at))
#Data Cleaning


data$duration <- (data$ended_at - data$started_at)
#data <- mutate(data, started_at = as.character(started_at))
data$day_of_week <- weekdays(data$started_at)


data <- subset(data, select = -c(rideable_type, start_station_id, end_station_id))
write.csv(data, "clean_data.csv")
