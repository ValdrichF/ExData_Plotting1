library(lubridate)
library(dplyr)

PowerConsumption = read.csv('./Data/PowerConsumption.csv', stringsAsFactors = F)
PowerConsumption = mutate(PowerConsumption, DateTime = ymd_hms(DateTime))

# Plot 2
png('plot2.png', 480, 480)
with(PowerConsumption, plot(DateTime, Global_active_power,
                            type = 'l', 
                            xlab = '',
                            ylab = 'Global Active Power (kilowatts)'))
dev.off()