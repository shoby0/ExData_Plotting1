data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), 
                                 format="%d/%m/%Y %H:%M:%S")

png("plot3.png", width = 480, height = 480)

time_axis <- as.POSIXct(paste(date_converted, data[, 2]))

plot(time_axis, data[, 7], xlab = "", ylab = "Energy sub metering", type = "l")
lines(time_axis, data[, 8], col = "red")
lines(time_axis, data[, 9], col = "blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black","red","blue"), lty = 1)

dev.off()