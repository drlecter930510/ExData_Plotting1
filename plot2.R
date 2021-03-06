dataset <- read.table(text = grep("^[1,2]/2/2007", readLines("./Coursera/Data_Science_with_R/Course4/household_power_consumption.txt"), value = TRUE), col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

dataset$Date <- as.Date(dataset$Date, format = "%d/%m/%Y")

dateTime <- paste(as.Date(dataset$Date), dataset$Time)
dataset$DateTime <- as.POSIXct(dateTime)
plot(dataset$Global_active_power ~ dataset$DateTime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

dev.copy(png, file = "./Coursera/Data_Science_with_R/Course4/plot2.png")
dev.off()
