# read orignal data file
data <- read.table(".\\data\\household_power_consumption.txt", 
                   header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")
# subset data
dataToUse <- subset(data, as.Date(data$Date, "%d/%m/%Y") >= as.Date("1/2/2007", "%d/%m/%Y") & 
                      as.Date(data$Date, "%d/%m/%Y") <= as.Date("2/2/2007", "%d/%m/%Y"))

#head(dataToUse,n=10)

#datetime
dataToUse$datetime <- strptime(paste(dataToUse$Date, dataToUse$Time, sep=" ")
                              , "%d/%m/%Y %H:%M:%S") 

#plot
png("plot2.png", width=480, height=480)
plot(dataToUse$datetime, as.numeric(dataToUse$Global_active_power), type="l",
     xlab="", ylab="Global Active Power (kilowatts)")
dev.off()