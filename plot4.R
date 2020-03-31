library(lubridate)
library(dplyr)

PowerConsumption = read.csv('./Data/PowerConsumption.csv', stringsAsFactors = F)
PowerConsumption = mutate(PowerConsumption, DateTime = ymd_hms(DateTime))

# Plot 4
png('plot4.png', 480, 480)
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
                                lty = 'solid', bty = 'n')))
plot(PowerConsumption$DateTime, PowerConsumption$Global_reactive_power,
     type = 'l', xlab = '', ylab = 'Global Reactive Power', lwd = 0.001)
dev.off()