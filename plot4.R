data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";",
                 colClasses = "character",
                 comment.char = "")
data1 <- subset(data, Date == "2/1/2007" | Date == '2/2/2007')
data1 <- transform(data1,
                   DateTime = strptime(paste(Date, Time, sep = " "), "%m/%d/%Y %H:%M:%OS"),
                   Global_active_power = as.numeric(Global_active_power),
                   Voltage = as.numeric(Voltage),
                   Global_reactive_power = as.numeric(Global_reactive_power),
                   Sub_metering_1 = as.numeric(Sub_metering_1),
                   Sub_metering_2 = as.numeric(Sub_metering_2),
                   Sub_metering_3 = as.numeric(Sub_metering_3))

png(filename = "plot4.png", width = 480, height = 480, units = "px")

par(mfrow = c(2, 2))

with(data1, plot(DateTime, Global_active_power, type = "l",
                 xlab = "", ylab = "Global Active Power (kilowatts)"))

with(data1, plot(DateTime, Voltage, type = "l",
                 xlab = "datetime", ylab = "Voltage"))

with(data1, plot(DateTime, Sub_metering_1, type = "l",
                 xlab = "", ylab = "Energy sub metering",
                 ylim = c(0, 30)))
with(data1, lines(DateTime, Sub_metering_2, col = "red"))
with(data1, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, cex = 0.85, col=c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(data1, plot(DateTime, Global_reactive_power, type = "l",
                 xlab = "datetime", ylab = "Global_reactive_power"))

dev.off()