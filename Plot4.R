#### Plot 4####
#
#Set local directory file has been downloaded and unzipped
setwd("C:/Users/User/Desktop/Data Science/Module4/Project1")

#Reading the data file into memory
PowerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
                        stringsAsFactors=FALSE)

#Appending Date and time as an additional column for the date filter function
#Filter required data range 2007-02-01 and 2007-02-02
filteredData <-PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007"),]
DateTime <-strptime(paste(filteredData$Date, filteredData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
filteredData <- cbind(DateTime,filteredData)

#Producing plot 4

labels <- c("Sub_metering_1","Sub_metering_2","Sub_metering_3")
columnlines <- c("black","red","blue")
par(mfrow=c(2,2))
plot(filteredData$DateTime, filteredData$Global_active_power, type="l", col="black", xlab="", ylab="Global Active Power")
plot(filteredData$DateTime, filteredData$Voltage, type="l", col="black", xlab="datetime", ylab="Voltage")
plot(filteredData$DateTime, filteredData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(filteredData$DateTime, filteredData$Sub_metering_2, type="l", col="red")
lines(filteredData$DateTime, filteredData$Sub_metering_3, type="l", col="blue")
legend("topright", bty="n", legend=labels, lty=1, col=columnlines)
plot(filteredData$DateTime, filteredData$Global_reactive_power, type="l", col="black", xlab="datetime", ylab="Global_reactive_power")


#Saving as Png file: Producting plot4.png file

dev.copy(png, file="plot4.png", width = 480, height = 480, units = "px")
dev.off()
