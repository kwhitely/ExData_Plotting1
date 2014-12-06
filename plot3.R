#This code makes a line graph with days as the independent variable and 
#Sub_metering_1, Sub_metering_2, Sub_metering_3 as the dependent variables
#with data from the household power consumption file
library(lubridate)
library(dplyr)
file <- "~/Coursera/Project1/household_power_consumption.txt"
data <- read.csv(file, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
#filter data for appropriate dates
specified_dates <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
#make a new column combining Date and Time as POSIXct
new_data <- mutate(specified_dates, date_time = dmy_hms(paste(Date, Time)))
png("plot3.png", width = 480, height = 480)
#define colors used for the three variables
plot_colors <- c("black", "red", "blue")
#plot the line chart for all three variables
plot(new_data$date_time, new_data$Sub_metering_1 ,type = "l", 
        col = plot_colors[1], 
        xlab = " ",
        ylab = "Energy sub metering")
#include 2nd variable in chart
lines(new_data$date_time, new_data$Sub_metering_2, type = "l", 
        col = plot_colors[2])
#include 3rd variable in chart
lines(new_data$date_time, new_data$Sub_metering_3, type = "l", 
        col = plot_colors[3])
#create legend
legend("topright", col = plot_colors, lty = c(1,1,1),
        legend = c("Sub_metering_1", 
                   "Sub_metering_2", 
                   "Sub_metering_3"))