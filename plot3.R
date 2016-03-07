setwd("data")
power <- read.table(file = "household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?")
power$Date <- as.Date(power$Date, format = "%d/%m/%Y")
power <- power[(power$Date == "2007-02-01" | power$Date == "2007-02-02"), ]
power$datetime <- as.POSIXct(paste(power$Date, power$Time), format = "%Y-%m-%d %H:%M:%S")

png(filename = "plot3.png")
plot(power$Sub_metering_1 ~ power$datetime, type="l", xlab = "", ylab = "Energy sub metering")
lines(power$Sub_metering_2 ~ power$datetime, type="l", col = "red")
lines(power$Sub_metering_3 ~ power$datetime, type="l", col = "blue")
temp <- legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "red", "blue"), lty=c(1, 1))
dev.off()