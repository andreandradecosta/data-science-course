library(data.table)
library(dplyr)
library(ggplot2)

# Cleaning the workspace
rm(list = ls())
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

results <- NEI %>%
    inner_join(SCC, by = "SCC") %>%
    filter(grepl("(M|m)otor", Short.Name) & fips == "24510") %>%
    group_by(year) %>%
    summarise(total = sum(Emissions))

png(filename = "plot5.png")

chart <- ggplot(results, aes(year, total)) +
    geom_line() +
    labs(title = "Baltimore City Motor Combustion-Related Emissions by Year", x = "Year", y = "Emissions")

print(chart)

dev.off()