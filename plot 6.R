##6.Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (\color{red}{\verb|fips == "06037"|}fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
library(ggplot2)
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
vehicles_emissons <- grep("Vehicles", SCC$SCC.Level.Two, ignore.case = TRUE)
vehicles_scc <- SCC[vehicles_emissons, ]
Bal_emission <- subset(NEI, NEI$fips == "24510")
Bal_data <- merge(Bal_emission, vehicles_scc, by = "SCC")
Bal_data$city <- "Baltimore"

LA_emissions <- subset(NEI, fips == "06037")
LA_data <-merge(LA_emissions, vehicles_scc, by = "SCC")
LA_data$city <- "Los Angeles County"

total_data <- rbind(Bal_data, LA_data)
total_emissions <- aggregate(Emissions ~ city + year, data = total_data, sum)
png("plot6.png", width = 480, height = 480)
g <- ggplot(data = total_emissions, aes(x = year, y = Emissions, color = city))
g+geom_line()+labs(x = "year", y = "Total Emissions") + ggtitle("Total Emissions from motor sources in Baltimore and Los Angeles")
dev.off()




