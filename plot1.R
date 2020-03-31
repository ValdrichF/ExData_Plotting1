library(lubridate)
library(dplyr)

PowerConsumption = read.csv('./Data/PowerConsumption.csv', stringsAsFactors = F)
PowerConsumption = mutate(PowerConsumption, DateTime = ymd_hms(DateTime))

# Plot 1
png('plot1.png', 480, 480)
hist(PowerConsumption$Global_active_power,
     main = 'Global Active Power',
     xlab = 'Glabal Active Power (kilowatts)',
     col = '#ff2600')
dev.off()