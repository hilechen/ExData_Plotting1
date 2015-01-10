data <- read.csv("exdata_data_household_power_consumption/household_power_consumption.txt", sep = ";",
                 colClasses = "character",
                 comment.char = "")
data1 <- subset(data, Date == "2/1/2007" | Date == '2/2/2007')
data1$Global_active_power = as.numeric(data1$Global_active_power)

png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(data1$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power")
dev.off()