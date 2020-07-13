##3.##Of the four types of sources indicated by the \color{red}{\verb|type|}type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? Which have seen increases in emissions from 1999–2008? 
NEI <- readRDS("./exdata_data_NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("./exdata_data_NEI_data/Source_Classification_Code.rds")
library(ggplot2)
data <- aggregate(Emissions ~ type + year, data = Bal_emission, sum)
g <- ggplot(data = data, aes(x = year, y = Emissions, color = type))
png("plot3.png", width = 480, height = 480)
g+geom_line()+labs(x = "year", y = "Emissions")
dev.off()