#### Plot 3####

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

#Producing plot3

columnlines <- c("black", "red", "blue")
labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
plot(filteredData$DateTime, filteredData$Sub_metering_1, type="l", col=columnlines[1], xlab="", ylab="Energy sub metering")
lines(filteredData$DateTime, filteredData$Sub_metering_2, col=columnlines[2])
lines(filteredData$DateTime, filteredData$Sub_metering_3, col=columnlines[3])
legend("topright", legend=labels, col=columnlines, lty="solid",c(2,2,2,2))

#Saving as Png file: Producting plot3.png file

dev.copy(png, file="plot3.png", width = 480, height = 480, units = "px")
dev.off()
