# read orignal data file
data <- read.table(".\\data\\household_power_consumption.txt", 
                   header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")
# subset data
dataToUse <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= as.Date("1/2/2007", "%d/%m/%Y") & 
                      as.Date(data$Date, "%d/%m/%Y") <= as.Date("2/2/2007", "%d/%m/%Y"))

#head(data,n=10)

#datetime
dataToUse$datetime <- strptime(paste(dataToUse$Date, dataToUse$Time, sep=" ")
                               , "%d/%m/%Y %H:%M:%S") 

#plot
png("plot3.png", width=480, height=480)
plot(dataToUse$datetime, as.numeric(dataToUse$Sub_metering_1), type="l",
     xlab="", ylab="Energy Submetering")
lines(dataToUse$datetime, as.numeric(dataToUse$Sub_metering_2), type="l", col="red")
lines(dataToUse$datetime, as.numeric(dataToUse$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       lty=1, col=c("black", "red", "blue"))
dev.off()