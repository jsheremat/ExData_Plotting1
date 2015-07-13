mydata <- read.table("household_power_consumption.txt", sep = ";", header=TRUE,na.strings="?", stringsAsFactors = FALSE)
mydata2<-mydata
mydata2[,1]<-as.Date(mydata$Date)
strptime(paste(mydata2,mydata$Time), "%d/%m/%Y %H:%M:%S")

mydata2$newdate<-as.Date(mydata$Date, "%d/%m/%Y")
mydata3<-mydata2[mydata2$newdate==as.Date("2007-02-01")| mydata2$newdate== as.Date("2007-02-02"),]

mydata3$newtime<-strptime(paste(mydata3$newdate, mydata3$Time, sep = " "),format="%Y-%m-%d %H:%M:%S")
png("Plot3.png")
with(mydata3,plot(newtime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))

with(mydata3,plot(newtime, Sub_metering_1,type="n",xlab="",ylab="Energy sub metering (kilowatts)"))

lines(mydata3$newtime, mydata3$Sub_metering_1,col="black")
lines(mydata3$newtime, mydata3$Sub_metering_2,col="red")
lines(mydata3$newtime, mydata3$Sub_metering_3,col="blue")
legend("topright",col=c("black","red","blue"),lwd=1,legend=c("Sub-Metering_1","Sub-Metering_2","Sub-Metering_3"),cex=0.8)



dev.off()

