# Selectively read tables from the txt file, with date raning from 2007-02-01 to 2007-02-02
library ("sqldf")
file = read.csv.sql(file = "household_power_consumption.txt", sql= "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")
grep("\\?",file$Global_active_power)
sum(is.na(file$Global_active_power))
date = file[,1]
time = file[,2]
datetime = paste(date,time)
datetime = strptime(datetime,"%d/%m/%Y %H:%M:%S")
par(lab = c(2,3,7),bg="transparent")
plot(datetime,file$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
dev.copy(png,file="plot2.png",width=480,height=480)
dev.off()
