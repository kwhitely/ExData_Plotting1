#This code creates four charts with data from the 
#household power consumption file
library(lubridate)
library(dplyr)
file <- "~/Coursera/Project1/household_power_consumption.txt"
data <- read.csv(file, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
#filter data for appropriate dates
specified_dates <- filter(data, Date == "1/2/2007" | Date == "2/2/2007")
#make a new column combining Date and Time as POSIXct
new_data <- mutate(specified_dates, date_time = dmy_hms(paste(Date, Time)))
png("plot4.png", width = 480, height = 480)
#define colors used in chart 3
plot_colors <- c("black", "red", "blue")
#define size used for x and y labels
lab_size <- 0.9
#make 2 columns and 2 rows of charts
par(mfrow = c(2,2))
with(new_data, {
        #create chart 1
        plot(date_time, Global_active_power, type = "l",
                xlab = "",        
                ylab = "Global Active Power",
                cex.lab = lab_size)
        #create chart 2
        plot(date_time, Voltage, type = "l",
                xlab = "datetime",
                ylab = "Voltage",
                cex.lab = lab_size)
        #create chart 3
        plot(date_time, Sub_metering_1 ,type = "l", 
                        col = plot_colors[1], 
                        xlab = " ",
                        ylab = "Energy sub metering",
                        cex.lab = lab_size)
                lines(date_time, Sub_metering_2, type = "l", 
                        col = plot_colors[2])
                lines(date_time, Sub_metering_3, type = "l", 
                        col = plot_colors[3])
                legend("topright", col = plot_colors, lty = c(1,1,1), 
                        cex = 0.7, bty = "n",
                        legend = c("Sub_metering_1", 
                                "Sub_metering_2", 
                                "Sub_metering_3"))
        #create chart 4
        plot(date_time, Global_reactive_power, type = "l",
                xlab = "datetime",
                ylab = "Global_reactive_power",
                cex.lab = lab_size)
        })