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



# Plot 4.
par(mfrow=c(2,2))

hist(hp1$gap, col="red", xlab="Global Active Power (kilowatts)", 
     main="Global Active Power")

plot(hp1$time, hp1$gap, type="l", 
     xlab="datetime", ylab="Global Active Power")

plot(hp1$time, hp1$Sub_metering_1, type="l", col = "black", 
     xlab="", ylab="Energy sub metering")
lines(hp1$time, hp1$Sub_metering_2, type="l", col = "red")
lines(hp1$time, hp1$Sub_metering_3, type="l", col = "blue")

legend("topright",lty=c(1,1,1), col=c("black", "red","blue"),
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(hp1$time, hp1$Global_reactive_power, type="l", 
              xlab="datetime", ylab="Global_reactive_power")

dev.copy(png, file = "Plot 4.png")
dev.off()


