#### Plot 1####
#Loading dependency library

#Set local directory file has been downloaded and unzipped
setwd("C:/Users/User/Desktop/Data Science/Module4/Project1")

#Reading the data file into memory
PowerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?", nrows= 1000000, 
                      stringsAsFactors=FALSE)

#Appending Date and time as an additional column for the date filter function
filteredData <-PowerData[PowerData$Date %in% c("1/2/2007","2/2/2007"),]
DateTime <-strptime(paste(filteredData$Date, filteredData$Time, sep=" "),"%d/%m/%Y %H:%M:%S")
filteredData <- cbind(DateTime,filteredData)
#Filter required data range 2007-02-01 and 2007-02-02

hist(filteredData$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")


#Saving as Png file: Producting plot1.png file

dev.copy(png, file="plot1.png", width = 480, height = 480, units = "px")
dev.off()

