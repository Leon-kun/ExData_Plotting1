##Loading and subsetting the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date = as.character(data$Date)
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

##plot3
png(file = "plot3.png", width = 480, height = 480)
DateAndTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
plot(DateAndTime, data$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", xlab = " ")
lines(DateAndTime, data$Sub_metering_2, type = "l", col = "red")
lines(DateAndTime, data$Sub_metering_3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black","red", "blue"), lty = 1)
dev.off()