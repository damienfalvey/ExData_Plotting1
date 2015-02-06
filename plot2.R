##Assign text file description to variable
dataFile <- "./household_power_consumption.txt"
##Assign Values of file to variable
data <- read.table(dataFile, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
##Subset data to only look at dates required
subSetData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

#str(subSetData)
datetime <- strptime(paste(subSetData$Date, subSetData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
globalActivePower <- as.numeric(subSetData$Global_active_power)
##Print Graph to png image with set width and height
png("plot2.png", width=480, height=480)
##Define which type of graph to be displayed with Main heading, X-axis Label and colour defined
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()