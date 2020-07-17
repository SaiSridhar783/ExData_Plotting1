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
hist(rawData$GlobalActivePower, col = 'red',
     main = 'Global Active Power',
     xlab = 'Global Active Power (kilowatts)')

# Make a copy to png format
dev.copy(png, "plot1.png", height = 480, width = 480)
dev.off()