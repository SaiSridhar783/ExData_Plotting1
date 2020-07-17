## Reading and Cleaning the Data

# Import the required libraries
library(dplyr)
library(lubridate)

# Read the file
rawData <- tbl_df(read.table('household_power_consumption.txt', header = T,
                             stringsAsFactors = F, na.strings = "?", sep = ';',
                             quote = "", skip = 66636, nrows = 2880))

# Rename the columns
colnames(rawData) <- c('Date', 'Time', 'GlobalActivePower', 'GlobalReactivePower',
                       'Voltage', 'GlobalIntensity', 'SubMetering1', 'SubMetering2', 'SubMetering3')

# Convert to Date/Time Objects
rawData$DateTime <- dmy_hms(paste(rawData$Date, rawData$Time))

## Plotting

# Plot on current device
plot(x = rawData$DateTime, y = rawData$SubMetering1, type = 'n',
     xlab = NA, ylab = 'Energy sub metering')

lines(x = rawData$DateTime, y = rawData$SubMetering1)
lines(x = rawData$DateTime, y = rawData$SubMetering2, col = 'red')
lines(x = rawData$DateTime, y = rawData$SubMetering3, col = 'blue')

legend('topright',
       legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'),
       col = c('black', 'red', 'blue'),
       lwd = 1)

# Make a copy to png format
dev.copy(png, "plot3.png", height = 480, width = 480)
dev.off()