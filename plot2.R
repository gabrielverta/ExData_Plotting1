Sys.setenv(LANG = "en")
plot2 <- function(){
    png("plot2.png")
    
    rows <- read.table("household_power_consumption.txt", header = FALSE, sep = ";", na.strings = "?", skip = 66637, nrows = 2880)
    names(rows) = c(
        "Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage",
        "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"
    )
    
    rows <- rows[!is.na(rows$Global_active_power), ]
    rows$Date <- strptime(paste(rows$Date, rows$Time), format="%e/%m/%Y %H:%M:%S")
    plot(rows$Date, rows$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
    
    dev.off()
}
