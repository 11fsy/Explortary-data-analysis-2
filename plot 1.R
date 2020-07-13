##The overall goal of this assignment is to explore the National Emissions Inventory database and see what it say about fine particulate matter pollution in the United states over the 10-year period 1999–2008. You may use any R package you want to support your analysis.

##Questions
##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
##Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.
##Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
##How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?

##1.Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
EI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
totalEmissions <- tapply(NEI$Emissions, NEI$year, sum)
png("plot1.png", width = 480, height = 480)
barplot(totalEmissions, xlab = "year", ylab = "Total Emission (ton)", main = "Total Emission per year")
dev.off()