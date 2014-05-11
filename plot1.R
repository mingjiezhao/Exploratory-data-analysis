# Selectively read tables from the txt file, with date ranging from 2007-02-01 to 2007-02-02
library ("sqldf")
file = read.csv.sql(file = "household_power_consumption.txt", sql= "select * from file where Date = '1/2/2007' OR Date = '2/2/2007'", sep=";")
grep("\\?",file$Global_active_power)
par(bg = "transparent")
hist(file$Global_active_power,main = "Global Active Power",xlab="Global Active Power (kilowatts)",col = "Red")
dev.copy(png,file="plot1.png",width = 480, height = 480)
dev.off()