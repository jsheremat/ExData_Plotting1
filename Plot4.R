mydata <- read.table("household_power_consumption.txt", sep = ";", header=TRUE,na.strings="?", stringsAsFactors = FALSE)
mydata2<-mydata
mydata2[,1]<-as.Date(mydata$Date)
strptime(paste(mydata2,mydata$Time), "%d/%m/%Y %H:%M:%S")

mydata2$newdate<-as.Date(mydata$Date, "%d/%m/%Y")
mydata3<-mydata2[mydata2$newdate==as.Date("2007-02-01")| mydata2$newdate== as.Date("2007-02-02"),]

mydata3$newtime<-strptime(paste(mydata3$newdate, mydata3$Time, sep = " "),format="%Y-%m-%d %H:%M:%S")

png("Plot4t.png")

par(mfrow = c(2, 2)) 

with(mydata3,plot(newtime,Global_active_power,type="l", xlab="",ylab="Global Active Power (kilowatts)"), , cex=0.2)

with(mydata3,plot(newtime,Voltage, type="l",xlab="datetime",ylab="Voltage"))

with(mydata3,plot(newtime, Sub_metering_1, type="l",xlab="",ylab="Energy sub metering (kilowatts)"))


lines(mydata3$newtime, mydata3$Sub_metering_2, type="l"col="red")
lines(mydata3$newtime, mydata3$Sub_metering_3, type="l"col="blue")
legend("topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col=c("black","red","blue"), lty=, lwd=2.5, bty="o", cex=0.2)

with(mydata3,plot(newtime,Global_reactive_power, type="l",xlab="datetime",ylab="Global_reactive_power",))


dev.off()




