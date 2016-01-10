setwd("~/Desktop/coursera-JHU-data science/Exploratory")
#set working directory
plotData <- read.table("household_power_consumption.txt", header=T, sep=";", na.strings="?",
                       colClasses=c("character","character",rep("numeric",7)))
#read data
plotDT <- subset(plotData, Date == "1/2/2007"|Date == "2/2/2007")
#subset data between 01/02/2007 and 02/02/2007
plotDT$dateTime <- paste(plotDT$Date, plotDT$Time)
plotDT$dateTime <- strptime(plotDT$dateTime,"%d/%m/%Y %H:%M:%S")
#convert the format of date data and combine them together
png("plot2.png", width=480, height=480)
plot(plotDT$dateTime, plotDT$Global_active_power, 
     ylab = "Global Active Power (kilowatts)", 
     type = "l", xlab = "")
dev.off()
