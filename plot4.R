#Setup
setwd("C:/Users/Ken/Desktop/assignment 1")
library(lubridate)

#Read data, convert date and times, fix data types, filter for 2007-02-01 and 2007-02-02
power<-read.csv("household_power_consumption.txt", header = TRUE, sep = ";",stringsAsFactors = FALSE)
power$newdate<-dmy_hms(paste(power$Date, power$Time))
power$Date <- dmy(power$Date)
power$Global_active_power <- as.numeric(power$Global_active_power)

two.day.power <- power[power$Date == "2007-02-01" | power$Date == "2007-02-02",]

#Plot 4
png("plot4.png",width = 480,height=480)
par(mfrow=c(2,2),mar=c(5,5,2,0))

with(two.day.power,plot(newdate,Global_active_power,type="n",xlab="",ylab="Global Active Power")) #plot 1
with(two.day.power,lines(newdate,Global_active_power)) 

with(two.day.power,plot(newdate,Voltage,type="n",xlab="datetime",ylab="Voltage")) #plot 2
with(two.day.power,lines(newdate,Voltage)) 

with(two.day.power,plot(newdate,Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")) #plot 3
axis(2, seq(0,40,by=10))
with(two.day.power,lines(newdate,Sub_metering_1))
with(two.day.power,lines(newdate,Sub_metering_2,col="red"))
with(two.day.power,lines(newdate,Sub_metering_3,col="blue"))
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","sub_metering_3"),col=c("black","red","blue"),bty="n",lwd=1)

with(two.day.power,plot(newdate,Global_reactive_power,type="n",xlab="datetime",ylab="Global_reactive_power")) #plot 4
with(two.day.power,lines(newdate,Global_reactive_power)) 

dev.off()


