library(data.table)
library(dplyr)

# Cleaning the workspace
rm(list = ls())

# Changing locale so the weekdays match the result required (eg: Thu, Fri, Sat, etc)
Sys.setlocale("LC_TIME", "English")


# Read, filter and converting data
data <- fread("data/household_power_consumption.txt", na.strings = "?") %>% 
    filter(Date == "1/2/2007" | Date == "2/2/2007") %>%
    mutate(datetime=as.POSIXct(paste(Date, Time, sep = " "), format = "%d/%m/%Y %H:%M:%S"))


png(filename = "plot4.png", width = 480, height = 480)

par(mfrow=c(2,2))
with(data, {
    plot(datetime, Global_active_power, type="n", ylab="Global Active Power", xlab="")
    lines(datetime, Global_active_power)
    
    plot(datetime, Voltage, type="n")
    lines(datetime, Voltage)
    
    plot(datetime, Sub_metering_1, type="n", ylab="Energy sub metering", xlab="")
    lines(datetime, Sub_metering_1, col="black")
    lines(datetime, Sub_metering_2, col="red")
    lines(datetime, Sub_metering_3, col="blue")
    legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    
    plot(datetime, Global_reactive_power, type="n")
    lines(datetime, Global_reactive_power)
})

dev.off()