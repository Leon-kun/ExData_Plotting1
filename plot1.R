##Loading and subsetting the data
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date = as.character(data$Date)
data <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

##plot1
png(file = "plot1.png", width = 480, height = 480)
data$Global_active_power <- as.numeric(data$Global_active_power)
hist(data$Global_active_power, xlab = "Global Active Power (kilowatts)", col = "red", main = "Global Active Power")
dev.off()