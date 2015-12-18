library(data.table)
library(dplyr)
library(ggplot2)

# Cleaning the workspace
rm(list = ls())
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

results <- NEI %>%
    inner_join(SCC, by = "SCC") %>%
    filter(grepl("\\<(c|C)oal", Short.Name)) %>%
    group_by(year) %>%
    summarise(total = sum(Emissions))

png(filename = "plot4.png")

chart <- ggplot(results, aes(year, total)) +
    geom_line() +
    labs(title = "US Coal Combustion-Related Emissions by Year", x = "Year", y = "Emissions")

print(chart)

dev.off()