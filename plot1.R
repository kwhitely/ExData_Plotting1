#This code creates a histrogram of Global Active Power with data from the 
#household power consumption file
library(dplyr)
file <- "~/Coursera/Project1/household_power_consumption.txt"
data <- read.csv(file, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
#filter data for appropriate dates
specified_dates <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
#coerce global_active_power to numeric
power <- as.numeric(specified_dates$Global_active_power)
png("plot1.png", width = 480, height = 480)
#create histogram
hist(power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")