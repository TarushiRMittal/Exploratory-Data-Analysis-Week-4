emissions_stats <- readRDS("summarySCC_PM25.rds")
classification_code <- readRDS("Source_Classification_Code.rds")

baltimore_cars <- subset(emissions_stats, emissions_stats$fips == "24510" & emissions_stats$type=="ON-ROAD")
baltimore_cars_annual <- aggregate(baltimore_cars$Emissions, by=list(baltimore_cars$year), FUN=sum)
colnames(baltimore_cars_annual) <- c("Year", "Emissions")

plot(baltimore_cars_annual$Year, baltimore_cars_annual$Emissions, type = "o", xlab = "Year", ylab = "Total Emissions (tons)", main = "Total Emissions of PM2.5 Related to Motor Vehicles", sub = "Baltimore City")