##Assign text file description to variable
dataFile <- "./household_power_consumption.txt"
##Assign Values of file to variable
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##Subset data to only look at dates required
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
globalReactivePower <- as.numeric(subSetData$Global_reactive_power)
voltage <- as.numeric(subSetData$Voltage)
subMetering1 <- as.numeric(subSetData$Sub_metering_1)
subMetering2 <- as.numeric(subSetData$Sub_metering_2)
subMetering3 <- as.numeric(subSetData$Sub_metering_3)

##Print Graph to png image with set width and height
png("plot4.png", width=480, height=480)
##Setup 2 by 2 dashboard
par(mfrow = c(2, 2)) 

##Define which type of graph to be displayed with Main heading, X-axis Label and colour defined
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

##Define which type of graph to be displayed with Main heading, X-axis Label and colour defined
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

##Define which type of graph to be displayed with Main heading, X-axis Label and colour defined
plot(datetime, subMetering1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

##Define which type of graph to be displayed with Main heading, X-axis Label and colour defined
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()