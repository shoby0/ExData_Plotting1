# Plot 1
data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", 
                   na.strings = "?")

data_subset <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

data_subset$DateTime <- strptime(paste(data_subset$Date, data_subset$Time), 
                                 format="%d/%m/%Y %H:%M:%S")

png("plot1.png", width = 480, height = 480)

hist(data_subset$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", col = "red")

dev.off()