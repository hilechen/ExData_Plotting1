data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";",
                 colClasses = "character",
                 comment.char = "")
data1 <- subset(data, Date == "2/1/2007" | Date == '2/2/2007')
data1$DateTime <- strptime(paste(data1$Date, data1$Time, sep = " "), "%m/%d/%Y %H:%M:%OS")
data1$Global_active_power = as.numeric(data1$Global_active_power)

png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(data1, plot(DateTime, Global_active_power, type = "l",
                 xlab = "", ylab = "Global Active Power (kilowatts)"))
dev.off()