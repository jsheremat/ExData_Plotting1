mydata <- read.table("household_power_consumption.txt", sep = ";", header=TRUE,na.strings="?", stringsAsFactors = FALSE)
mydata2<-mydata
mydata2[,1]<-as.Date(mydata$Date)
strptime(paste(mydata2,mydata$Time), "%d/%m/%Y %H:%M:%S")

mydata2$newdate<-as.Date(mydata$Date, "%d/%m/%Y")
mydata3<-mydata2[mydata2$newdate==as.Date("2007-02-01")| mydata2$newdate== as.Date("2007-02-02"),]

mydata3$newtime<-strptime(paste(mydata3$newdate, mydata3$Time, sep = " "),format="%Y-%m-%d %H:%M:%S")

hist(mydata3$Global_active_power,col="red",xlab="Global Active Power (kilowatts)",ylim= c(0, 1200),las=1,main="Global Active Power")
png("Plot1.png")
