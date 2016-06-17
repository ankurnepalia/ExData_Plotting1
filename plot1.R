# Read full household_power_consumption.txt file in a table
full_data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", dec = ".", na.strings = "?", stringsAsFactors = FALSE)

# Subset full_data to just include data from dates 2007-02-01 and 2007-02-02
relevant_data <- full_data[full_data$Date %in% c("1/2/2007", "2/2/2007"), ]

# Creating numeric field
globalActivePower <- as.numeric(relevant_data$Global_active_power)

# Drawing Plot 1
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")

# Saving Plot1 to png file
dev.copy(png, file = "plot1.png", height = 480, width = 480)

# Close graphical device
dev.off()
