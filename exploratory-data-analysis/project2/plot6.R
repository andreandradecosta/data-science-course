library(data.table)
library(dplyr)
library(ggplot2)

# Cleaning the workspace
rm(list = ls())
NEI <- readRDS("data/summarySCC_PM25.rds")
SCC <- readRDS("data/Source_Classification_Code.rds")

results <- NEI %>%
    inner_join(SCC, by = "SCC") %>%
    filter(grepl("(M|m)otor", Short.Name) & fips %in% c("24510", "06037")) %>%
    mutate(city = factor(fips, levels = c("24510", "06037"),labels = c(" Baltimore City", "Los Angeles County"))) %>%
    group_by(year, city) %>%
    summarise(total = sum(Emissions))

png(filename = "plot6.png")

chart <- ggplot(results, aes(year, total)) +
    geom_line(aes(color = city), size = 1) +
    labs(title = "Baltimore vs Los Angeles Motor Combustion-Related Emissions by Year", x = "Year", y = "Emissions") + 
    theme(legend.position = "bottom")

print(chart)

dev.off()