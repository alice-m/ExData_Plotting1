# read data
hh <- read.csv("../household_power_consumption.txt", sep=";", stringsAsFactors=F)
# convert dates
hh$Date <- as.Date(hh$Date, format="%d/%m/%Y")
hh$Time <- strptime(paste(hh$Date," ", hh$Time), format="%Y-%m-%d %H:%M:%S")
# subset 2007-02-01 and 2007-02-02
hh.subset <- subset(hh, Date=="2007-02-02" | Date=="2007-02-01")
summary(hh.subset)
head(hh.subset)
str(hh.subset)
# convert to numeric
cols = c(3,4,5,6,7,8)
hh.subset[,cols] = apply(hh.subset[,cols], 2, function(x) as.numeric(x))

par(mfrow=c(2,2))
with(hh.subset, {
    plot(Time, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type= "l")
    plot(Time, Voltage, xlab="datetime", type= "l")
    plot(Time, Sub_metering_1, ylab="Energy sub metering", xlab="", type= "l")
      lines(Time, Sub_metering_2, col="red")
      lines(Time, Sub_metering_3, col="blue")
      legend("topright", col = c("black", "blue", "red"), legend =colnames(hh.subset)[7:9], lty=c(1,1))
    plot(Time, Global_reactive_power, xlab="datetime", type= "l")  
  })


#plot
png(file="plot4.png", width=480, height=480,bg = "transparent")
par(mfrow=c(2,2))
with(hh.subset, {
  plot(Time, Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type= "l")
  plot(Time, Voltage, xlab="datetime", type= "l")
  plot(Time, Sub_metering_1, ylab="Energy sub metering", xlab="", type= "l")
  lines(Time, Sub_metering_2, col="red")
  lines(Time, Sub_metering_3, col="blue")
  legend("topright", col = c("black", "blue", "red"), legend =colnames(hh.subset)[7:9], lty=c(1,1))
  plot(Time, Global_reactive_power, xlab="datetime", type= "l")  
})
dev.off()
