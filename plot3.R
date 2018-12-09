#Setup
setwd("C:/Users/Ken/Desktop/assignment 1")
library(lubridate)

#Read data, convert date and times, fix data types, filter for 2007-02-01 and 2007-02-02
power<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE)
power$newdate<-dmy_hms(paste(power$Date, power$Time))
power$Date <- dmy(power$Date)
power$Global_active_power <- as.numeric(power$Global_active_power)

two.day.power <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]

#Plot 3
png("plot3.png",width = 480,height=480)
with(two.day.power,plot(newdate,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering"))
axis(2, seq(0,40,by=10))
with(two.day.power,lines(newdate,Sub_metering_1))
with(two.day.power,lines(newdate,Sub_metering_2,col="red"))
with(two.day.power,lines(newdate,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","sub_metering_3"),col=c("black","red","blue"),lwd=1)
dev.off()