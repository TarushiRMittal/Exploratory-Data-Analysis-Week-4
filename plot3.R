emiss_data <- readRDS("summarySCC_PM25.rds")
class_code <- readRDS("Source_Classification_Code.rds")

baltimore <- subset(emiss_data, emiss_data$fips=="24510")
baltimore_type_annual <- aggregate(baltimore$Emissions, by=list(baltimore$type, baltimore$year), FUN=sum)
colnames(baltimore_type_annual) <- c("Type", "Year", "Emissions")

library(ggplot2)
qplot(Year, Emissions, data = baltimore_type_annual, color = Type, geom = "line") + ggtitle("Total Emissions of PM2.5 in Baltimore City by Pollutant Type") + ylab("Total Emissions (tons)") + xlab("Year")
