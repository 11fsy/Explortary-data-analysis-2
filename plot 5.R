##4.How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
vehicles_emissons <- grep("Vehicles", SCC$SCC.Level.Two, ignore.case = TRUE)
vehicles_scc <- SCC[vehicles_emissons, ]
Bal_emission <- subset(NEI, NEI$fips == "24510")
Bal_data <- merge(Bal_emission, vehicles_scc, by = "SCC")
total_emissions <- tapply(Bal_data$Emissions, Bal_data$year, sum)
png("plot5.png", width = 480, height = 480)
barplot(total_emissions, xlab = "year", ylab = "Total Emission (ton)", main = "Total Emission from motor sources in Baltimore")
dev.off()