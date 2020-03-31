library(lubridate)
library(dplyr)
# Reading the data
# Path censored for privacy reasons. The plot1.R file will work properly
PowerConsumption = read.table('##/Data/household_power_consumption.txt', 
                              sep = ';', header = T, stringsAsFactors = F,
                              na.strings = '?')

# Creating a variable with both Date and time in POSIXct
PowerConsumption = mutate(PowerConsumption, 
                          DateTime = dmy_hms(paste(Date, Time)))

# Subsetting the data
dataSub = between(PowerConsumption$DateTime,
                  dmy_hms('01-02-2007 00:00:00'),dmy_hms('02-02-2007 23:59:59'))
PowerConsumption = subset(PowerConsumption, dataSub)
rm(dataSub)

# Writing a copy of the subsetted data
if (!file.exists('./Data')) dir.create('./Data')
write.csv(PowerConsumption,'./Data/PowerConsumption.csv', row.names = F)

# Plot 1
png('plot1.png', 480, 480)
windows(7,7,12)
hist(PowerConsumption$Global_active_power,
     main = 'Global Active Power',
     xlab = 'Glabal Active Power (kilowatts)',
     col = '#ff2600')

# Plot 2
with(PowerConsumption, plot(DateTime, Global_active_power,
                            type = 'l', 
                            xlab = '',
                            ylab = 'Global Active Power (kilowatts)'))

# Plot 3
with(PowerConsumption, c(plot(DateTime, Sub_metering_1, ylab = 'Energy sub metering', xlab = '', type = 'l'),
                         lines(DateTime, Sub_metering_2, col = 'red'),
                         lines(DateTime, Sub_metering_3, col = 'blue'),
                         legend('topright', col = c('black', 'red', 'blue'),
                                legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3' ),
                                lty = 'solid')))

# Plot 4
par(mfrow = c(2,2))
plot(PowerConsumption$DateTime, PowerConsumption$Global_active_power,
     type = 'l', xlab = '', ylab = 'Global Active Power')
plot(PowerConsumption$DateTime, PowerConsumption$Voltage,
     type = 'l', xlab = '', ylab = 'Voltage')
with(PowerConsumption, c(plot(DateTime, Sub_metering_1, ylab = 'Energy sub metering', xlab = '', type = 'l'),
                         lines(DateTime, Sub_metering_2, col = 'red'),
                         lines(DateTime, Sub_metering_3, col = 'blue'),
                         legend('topright', col = c('black', 'red', 'blue'),
                                legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3' ),
                                lty = 'solid')))
plot(PowerConsumption$DateTime, PowerConsumption$Global_reactive_power,
     type = 'l', xlab = '', ylab = 'Global Reactive Power', lwd = 0.001)
