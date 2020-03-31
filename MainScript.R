library(lubridate)
library(dplyr)
if (!file.exists('./Data')) dir.create('./Data')

# Reading the data
PowerConsumption = read.table('C:/Users/Valdrich PC/Desktop/Valdrich/ML_Udemy/Coursera/Course3/FinalProject/CourseraEDAWeek1/Data/household_power_consumption.txt', 
                              sep = ';', header = T, stringsAsFactors = F,
                              na.strings = '?')

# Creating a variable with both Date and time in POSIXct
PowerConsumption = mutate(PowerConsumption, 
                          DateTime = dmy_hms(paste(Date, Time)))

# Subsetting the data
dataSub = between(PowerConsumption$DateTime,
                  dmy_hms('01-01-2007 00:00:00'),dmy_hms('02-02-2007 23:59:59'))
PowerConsumption = subset(PowerConsumption, dataSub)
rm(dataSub)


