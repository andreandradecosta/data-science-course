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


png(filename = "plot2.png", width = 480, height = 480)

with(data, {
    plot(datetime, Global_active_power, type="n", ylab="Global Active Power (kilowatts)", xlab="")
    lines(datetime, Global_active_power)
})


dev.off()