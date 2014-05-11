# Selectively read tables from the txt file, with date raning from 2007-02-01 to 2007-02-02
library ("sqldf")
file = read.csv.sql(file = "household_power_consumption.txt", sql= "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")
grep("\\?",file[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")])
sum(is.na(file[,c("Sub_metering_1","Sub_metering_2","Sub_metering_3")]))
date = file[,1]
time = file[,2]
datetime = paste(date,time)
datetime = strptime(datetime,"%d/%m/%Y %H:%M:%S")
png(file="plot3.png",width=480,height=480)
par(lab = c(2,3,7),bg="transparent")
plot(datetime,file$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
lines(datetime,file$Sub_metering_1,col="Black")
lines(datetime,file$Sub_metering_2,col="Red")
lines(datetime,file$Sub_metering_3,col="Blue")
legend("topright",lwd=2,col=c("Black","Red","Blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()