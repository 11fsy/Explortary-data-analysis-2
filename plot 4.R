##4.Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
Coalmatches <- grep("Coal", SCC$Short.Name, ignore.case = TRUE)
Newdata <- merge(NEI, SCC, by = "SCC")
Total_emissions <- tapply(Newdata$Emissions, Newdata$year, sum)
png("plot4.png", width = 480, height = 480)
barplot(Total_emissions, xlab = "year", ylab = "Total Emission (ton)", main = "Total Emission from coal sources")
dev.off()