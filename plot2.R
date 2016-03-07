setwd("data")
power <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- power[(power$Date == "2007-02-01" | power$Date == "2007-02-02"), ]
power$datetime <- as.POSIXct(paste(power$Date, power$Time), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot2.png")
plot(power$Global_active_power ~ power$datetime, type="l", xlab = "", ylab = "Global Active Power (kilowatts)")
dev.off()