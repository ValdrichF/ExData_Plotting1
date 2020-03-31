library(lubridate)
library(dplyr)

PowerConsumption = read.csv('./Data/PowerConsumption.csv', stringsAsFactors = F)
PowerConsumption = mutate(PowerConsumption, DateTime = ymd_hms(DateTime))

# Plot 3
png('plot3.png', 480, 480)
with(PowerConsumption, c(plot(DateTime, Sub_metering_1, ylab = 'Energy sub metering', xlab = '', type = 'l'),
                         lines(DateTime, Sub_metering_2, col = 'red'),
                         lines(DateTime, Sub_metering_3, col = 'blue'),
                         legend('topright', col = c('black', 'red', 'blue'),
                                legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3' ),
                                lty = 'solid')))
dev.off()