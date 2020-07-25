
#Clearing Data
rm(list = ls(all.names = TRUE))

#Reading Data
setwd("C:/Users/Roberto Alvarado/Documents/courserar/data") 
library(tidyverse)
data <- read.delim("household_power_consumption.txt", header = TRUE, sep=";")
datafeb <- data %>% filter(Date %in% c("1/2/2007","2/2/2007"))

#plot1#
#Transforming vars 
datafeb$Global_active_power <- as.numeric(datafeb$Global_active_power)

#plotting data
hist(datafeb$Global_active_power, main="Global Active Power", xlab = "Global Active Power (kilowatts)", col="red")