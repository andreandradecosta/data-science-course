library(data.table)
library(dplyr)

# Cleaning the workspace
rm(list = ls())
NEI <- readRDS("data/summarySCC_PM25.rds")

byYear <- NEI %>%
    filter(fips == "24510") %>%
    group_by(year) %>%
    summarise(total = sum(Emissions))
regression <- lm(total ~ year, byYear)

png(filename = "plot2.png")

plot(byYear, main = "Baltimore City Total Emissions by Year", xlab = "Year", ylab = "Emissions", pch = 19, col = "blue")
abline(regression, lwd = 1)


dev.off()