
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
par(mfrow=c(2,2))

with(datafeb,{
  plot(datafeb$Time,as.numeric(as.character(datafeb$Global_active_power)),type="l",  xlab="",ylab="Global Active Power")  
  plot(datafeb$Time,as.numeric(as.character(datafeb$Voltage)), type="l",xlab="datetime",ylab="Voltage")
  plot(datafeb$Time,datafeb$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
  with(datafeb,lines(Time,as.numeric(as.character(Sub_metering_1))))
  with(datafeb,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
  with(datafeb,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
  legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), cex = 0.6)
  plot(datafeb$Time,as.numeric(as.character(datafeb$Global_reactive_power)),type="l",xlab="datetime",ylab="Global_reactive_power")
})
