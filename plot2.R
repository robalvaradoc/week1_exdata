
#Clearing Data
rm(list = ls(all.names = TRUE))

#Reading Data
setwd("C:/Users/Roberto Alvarado/Documents/courserar/data") 
library(tidyverse)
data <- read.delim("household_power_consumption.txt", header = TRUE, sep=";")
datafeb <- data %>% filter(Date %in% c("1/2/2007","2/2/2007"))

# Transforming the Date and Time vars
datafeb$Date <- as.Date(datafeb$Date, format="%d/%m/%Y")
datafeb$Time <- strptime(datafeb$Time, format="%H:%M:%S")
datafeb[1:1440,"Time"] <- format(datafeb[1:1440,"Time"],"2007-02-01 %H:%M:%S")
datafeb[1441:2880,"Time"] <- format(datafeb[1441:2880,"Time"],"2007-02-02 %H:%M:%S")
datafeb$Global_active_power <- as.numeric(datafeb$Global_active_power)
#plotting data
plot(datafeb$Time,as.numeric(as.character(datafeb$Global_active_power)),type="l",xlab="",ylab="Global Active Power (kilowatts)", main="Global Active Power Vs Time") 