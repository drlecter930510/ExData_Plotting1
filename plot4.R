dataset <- read.table(text = grep("^[1,2]/2/2007", readLines("./Coursera/Data_Science_with_R/Course4/household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

dateTime <- paste(as.Date(dataset$Date), dataset$Time)
dataset$DateTime <- as.POSIXct(dateTime)

par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
plot(dataset$Global_active_power ~ dataset$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
plot(dataset$Voltage ~ dataset$DateTime, type="l", ylab = "Voltage", xlab = "datetime")
with(dataset, {
        plot(Sub_metering_1 ~ DateTime, type = "l", ylab = "Energy sub metering", xlab = "")
        lines(Sub_metering_2 ~ DateTime, col = "red")
        lines(Sub_metering_3 ~ DateTime, col = "blue")
})
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(dataset$Global_reactive_power ~ dataset$DateTime, type = "l", ylab = "Global_reactive_power", xlab = "datetime")

dev.copy(png, file = "./Coursera/Data_Science_with_R/Course4/plot4.png")
dev.off()
