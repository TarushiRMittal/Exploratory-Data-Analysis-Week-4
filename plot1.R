emissions <- readRDS("summarySCC_PM25.rds")
classification <- readRDS("Source_Classification_Code.rds")

annual_sum <- aggregate(emissions$Emissions, by=list(year=emissions$year), FUN=sum)

plot(annual_sum$year, annual_sum$x, type = "l", main = "Total Emissions of PM2.5 in Baltimore City", ylab = "Total Emissions of PM2.5 (tons)", xlab = "Year")
