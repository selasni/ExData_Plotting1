hp <- read.csv("C:/Users/.Selasi/ExData_Plotting1/household_power_consumption.txt", sep=";")
str(hp)



hp1 <- subset(hp, Date=="1/2/2007" | Date =="2/2/2007")
hp1$date = as.Date(hp1$Date, "%m/%d/%Y")
hp1$time = as.POSIXct(strptime(hp1$Time, "%H:%M:%OS"))
hp1$gap = as.numeric(hp1$Global_active_power)
hp1$sm1 = as.numeric(hp1$Sub_metering_1)
hp1$sm2 = as.numeric(hp1$Sub_metering_2)
hp1$sm3 = as.numeric(hp1$Sub_metering_3)
#hp1$dayofweek <- weekdays(hp1$time, abbreviate = T) #Gets week days
str(hp1)



hist(hp1$gap, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")
dev.copy(png, file = "Plot 1.png")
dev.off()
