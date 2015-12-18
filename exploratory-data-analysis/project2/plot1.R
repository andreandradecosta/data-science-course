library(data.table)
library(dplyr)

# Cleaning the workspace
rm(list = ls())
NEI <- readRDS("data/summarySCC_PM25.rds")

byYear <- NEI %>%
        group_by(year) %>%
        summarise(total = sum(Emissions))
regression <- lm(total ~ year, byYear)

png(filename = "plot1.png")

plot(byYear, main = "US Total Emissions by Year", xlab = "Year", ylab = "Emissions", type = "l", col = "blue")

dev.off()