setwd("~/Desktop/coursera-JHU-data science/Exploratory")
#set working directory
plotData <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",
                       colClasses=c("character","character",rep("numeric",7)))
#read data
plotDT <- subset(plotData, Date == "1/2/2007"|Date == "2/2/2007")
#subset data between 01/02/2007 and 02/02/2007
png("plot1.png", width=480, height=480)
hist(plotDT$Global_active_power,col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()