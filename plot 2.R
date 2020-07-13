##2. Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (\color{red}{\verb|fips == "24510"|}fips == "24510") from 1999 to 2008? 
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
Bal_emission <- subset(NEI, NEI$fips == "24510")
Total_emission <- tapply(Bal_emission$Emissions, Bal_emission$year, sum)
png("plot2.png", width = 480, height = 480)
barplot(Total_emission, xlab = "year", ylab = "Total Emission(ton)", main = "Total Emission per year in Baltimore")
dev.off()

        