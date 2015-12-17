library(data.table)
library(dplyr)
library(ggplot2)

# Cleaning the workspace
rm(list = ls())
NEI <- readRDS("data/summarySCC_PM25.rds")

byTypeAndYear <- NEI %>%
    filter(fips == "24510") %>%
    mutate(type = factor(type)) %>%
    group_by(type, year) %>%
    summarise(total = sum(Emissions))

png(filename = "plot3.png")

chart <- ggplot(byTypeAndYear, aes(year, total)) +
    geom_line(aes(color = type), size = 1) +
    labs(title = "Baltimore City Total Emissions by Year for each Type", x = "Year", y = "Emissions")
    
print(chart)

dev.off()