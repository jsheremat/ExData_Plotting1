mydata <- read.table("household_power_consumption.txt", sep = ";", header=TRUE,na.strings="?", stringsAsFactors = FALSE)
mydata2<-mydata
mydata2[,1]<-as.Date(mydata$Date)
strptime(paste(mydata2,mydata$Time), "%d/%m/%Y %H:%M:%S")

mydata2$newdate<-as.Date(mydata$Date, "%d/%m/%Y")
mydata3<-mydata2[mydata2$newdate==as.Date("2007-02-01")| mydata2$newdate== as.Date("2007-02-02"),]

mydata3$newtime<-strptime(paste(mydata3$newdate, mydata3$Time, sep = " "),format="%Y-%m-%d %H:%M:%S")
png("Plot2.png")
with(mydata3,plot(newtime,Global_active_power,type="n",xlab="",ylab="Global Active Power (kilowatts)"))

lines(mydata3$newtime2, mydata3$Global_active_power)

dev.off()
