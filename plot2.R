#This code creates a line graph with days as independent variable and
#Global Active Power as the dependent variable with data from the 
#household power consumption file
library(lubridate)
library(dplyr)
file <- "~/Coursera/Project1/household_power_consumption.txt"
data <- read.csv(file, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
#filter data for appropriate dates
specified_dates <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
#make a new column combining Date and Time as POSIXct
new_data <- mutate(specified_dates, date_time = dmy_hms(paste(Date, Time)))
png("plot2.png", width = 480, height = 480)
#create graph
plot(new_data$date_time, new_data$Global_active_power, type = "l",
                        xlab = "",        
                        ylab = "Global Active Power (kilowatts)")


