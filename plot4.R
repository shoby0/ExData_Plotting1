data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?", colClasses = c("character", "character", "numeric", 
                                                    "numeric", "numeric", "numeric", 
                                                    "numeric", "numeric", "numeric"))
data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]
data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), 
                                 format="%d/%m/%Y %H:%M:%S")

png("plot4.png", width = 480, height = 480)

par(mfrow = c(2, 2))

# Plot 1: Global Active Power
plot(data_subset$DateTime, data_subset$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power")

# Plot 2: Voltage
plot(data_subset$DateTime, data_subset$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

# Plot 3: Energy Sub-metering
plot(data_subset$DateTime, data_subset$Sub_metering_1, type = "l", 
     xlab = "", ylab = "Energy sub metering")
lines(data_subset$DateTime, data_subset$Sub_metering_2, col = "red")
lines(data_subset$DateTime, data_subset$Sub_metering_3, col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = 1, bty = "n")

# Plot 4: Global Reactive Power
plot(data_subset$DateTime, data_subset$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")

dev.off()