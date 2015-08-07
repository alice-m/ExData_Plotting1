
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

#plot
png(file="plot1.png", width=480, height=480,bg = "transparent")
with(hh.subset, hist(Global_active_power,col="red", xlab="Global Active Power (kilowatts)", main= "Global Active Power"))
dev.off()
