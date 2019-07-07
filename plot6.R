emiss_stats <- readRDS("summarySCC_PM25.rds")
classification_code_source <- readRDS("Source_Classification_Code.rds")

baltimoreLA_cars <- subset(emiss_stats, emiss_stats$fips=="24510" | emiss_stats$fips=="06037" & emiss_stats$type=="ON-ROAD")
baltimoreLA_cars_annual <- aggregate(baltimoreLA_cars$Emissions, by=list(baltimoreLA_cars$fips, baltimoreLA_cars$year), FUN=sum)
colnames(baltimoreLA_cars_annual) <- c("City", "Year", "Emissions")

library(ggplot2)
qplot(Year, Emissions, data = baltimoreLA_cars_annual, color = City, geom = "line") + ggtitle("Emissions of PM2.5 in Baltimore City (24510) and LA County (06037)") + ylab("Total Emissions from Motor Vehicles (tons)") + xlab("Year")
