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
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))
#set plot format
plot(plotDT$dateTime, plotDT$Global_active_power, 
     ylab = "Global Active Power", 
     type = "l", xlab = "")

plot(plotDT$dateTime, plotDT$Voltage,
     ylab = "Voltage", type = "l", xlab = "datetime")

plot(plotDT$dateTime, plotDT$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(plotDT$dateTime, plotDT$Sub_metering_2, type = "l", col = "red")
lines(plotDT$dateTime, plotDT$Sub_metering_3, type = "l", col = "blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1,1,1), bty = "n")

plot(plotDT$dateTime, plotDT$Global_reactive_power,
     type = "l", xlab = "datetime",
     ylab = "Global_reactive_power")
dev.off()

