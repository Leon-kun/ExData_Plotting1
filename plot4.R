##Loading and subsetting the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date = as.character(data$Date)
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

##plot4
png(file = "plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))
data$Global_active_power <- as.numeric(data$Global_active_power)
DateAndTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")


##Plot A
plot(DateAndTime, data$Global_active_power, type = "l", ylab = "Global Active Power", xlab = " ")

##Plot B
plot(DateAndTime, data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = " ")
lines(DateAndTime, data$Sub_metering_2, type = "l", col = "red")
lines(DateAndTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red", "blue"), lty = 1, bty = "n")

##Plot C
plot(DateAndTime, data$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")

##Plot D
plot(DateAndTime, data$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.off()