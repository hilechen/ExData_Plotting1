data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";",
                 colClasses = "character",
                 comment.char = "")
data1 <- subset(data, Date == "2/1/2007" | Date == '2/2/2007')
data1$DateTime <- strptime(paste(data1$Date, data1$Time, sep = " "), "%m/%d/%Y %H:%M:%OS")
data1$Sub_metering_1 = as.numeric(data1$Sub_metering_1)
data1$Sub_metering_2 = as.numeric(data1$Sub_metering_2)
data1$Sub_metering_3 = as.numeric(data1$Sub_metering_3)

png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(data1, plot(DateTime, Sub_metering_1, type = "l",
        xlab = "", ylab = "Energy sub metering",
        ylim = c(0, 30)))
with(data1, lines(DateTime, Sub_metering_2, col = "red"))
with(data1, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", lwd = 1, cex = 0.85, col=c("black", "blue", "red"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()