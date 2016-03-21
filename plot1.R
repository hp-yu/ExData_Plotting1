# read orignal data file
data <- read.table(".\\data\\household_power_consumption.txt", 
                   header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")
# subset data
dataToUse <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= as.Date("1/2/2007", "%d/%m/%Y") & 
                      as.Date(data$Date, "%d/%m/%Y") <= as.Date("2/2/2007", "%d/%m/%Y"))

#head(data,n=10)

#plot
plot1data <- as.numeric(dataToUse$Global_active_power)
png("plot1.png", width=480, height=480)
hist(plot1data, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red" )
dev.off()