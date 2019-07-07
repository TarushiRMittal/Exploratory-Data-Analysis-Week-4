emitted <- readRDS("summarySCC_PM25.rds")
source_class <- readRDS("Source_Classification_Code.rds")

baltimore_data <- subset(emitted, emitted$fips=="24510")
baltimore_annual <- aggregate(baltimore_data$Emissions, by=list(baltimore_data$year), FUN=sum)

plot(baltimore_annual$Group.1, baltimore_annual$x, type = "l", main = "Total Emissions of PM2.5 in Baltimore City", ylab = "Total Emissions (tons)", xlab = "Year")
