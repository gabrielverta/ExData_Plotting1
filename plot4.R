Sys.setenv(LANG = "en")
plot4 <- function(){
    plot.new()
    png("plot4.png")
    
    par(mfrow = c(2, 2))
    
    rows <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
    names(rows) = c(
        "Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
        "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
    )
    
    rows <- rows[!is.na(rows$Global_active_power), ]
    rows$Date <- strptime(paste(rows$Date, rows$Time), format="%e/%m/%Y %H:%M:%S")
    
    
    # first
    plot(rows$Date, rows$Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
    
    # second
    plot(rows$Date, rows$Voltage, type = "l", ylab = "Voltage", xlab = "datetime")
    
    # third
    plot(rows$Date, rows$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "")
    points(rows$Date, rows$Sub_metering_2, type = "l", col = "red")
    points(rows$Date, rows$Sub_metering_3, type = "l", col = "blue")
    legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = c("-", "-", "-"), col = c("black", "red", "blue"), lwd = c(2, 2, 2))
    
    # fourth
    plot(rows$Date, rows$Global_reactive_power, type = "l", ylab = "Global_reactive_power", xlab = "datetime")
    
    dev.off()
}
