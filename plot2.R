##Loading and subsetting the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date = as.character(data$Date)
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

##plot2
png(file = "plot2.png", width = 480, height = 480)
data$Global_active_power <- as.numeric(data$Global_active_power)
DateAndTime <- strptime(paste(data$Date,data$Time), "%d/%m/%Y %H:%M:%S")
plot(DateAndTime, data$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")
dev.off()