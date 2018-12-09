#Setup
setwd("C:/Users/Ken/Desktop/assignment 1")
library(lubridate)

#Read data, convert date and times, fix data types, filter for 2007-02-01 and 2007-02-02
power<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE)
power$newdate<-dmy_hms(paste(power$Date, power$Time))
power$Date <- dmy(power$Date)
power$Global_active_power <- as.numeric(power$Global_active_power)

two.day.power <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]

#Plot 1
png("plot1.png",width = 480,height=480)
with(two.day.power,hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)",col="red",ylim=c(0,1300)))
dev.off()
