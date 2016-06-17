# Read full household_power_consumption.txt file in a table
full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

# Subset full_data to just include data from dates 2007-02-01 and 2007-02-02
relevant_data <- full_data[full_data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Formating and concatenating date and time field
datetime <- strptime(paste(relevant_data$Date, relevant_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Convert following fields to numeric type
globalActivePower <- as.numeric(relevant_data$Global_active_power)
voltage <- as.numeric(relevant_data$Voltage)
globalReactivePower <- as.numeric(relevant_data$Global_reactive_power)
subMetering1 <- as.numeric(relevant_data$Sub_metering_1)
subMetering2 <- as.numeric(relevant_data$Sub_metering_2)
subMetering3 <- as.numeric(relevant_data$Sub_metering_3)

# Drawing Plot4 by dividing the plot area in 4 quadrants
par(mfrow = c(2,2))

# subplot (1,0)
plot(datetime, globalActivePower, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

# subplot (1,1)
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# subplot (2,1)
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, subMetering2, type = "l", col = "red")
lines(datetime, subMetering3, type = "l", col = "blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 2, col = c("black", "red", "blue"), bty = "n")

# subplot (2,2)
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

# Saving Plot4 to png file
dev.copy(png, file = "plot4.png", height = 480, width = 480)

# Close graphical device
dev.off()