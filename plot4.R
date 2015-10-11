plot4 <- function() {
  inputfile <- "household_power_consumption.txt"
  rawdata <- read.table(inputfile, header=T, sep=";", dec=".",stringsAsFactors=FALSE)
  targetdata <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007") ,]
  
  datetime <- strptime(paste(targetdata$Date, targetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  
  globalactivepower <- as.numeric(targetdata$Global_active_power)
  submetering1 <- as.numeric(targetdata$Sub_metering_1)
  submetering2 <- as.numeric(targetdata$Sub_metering_2)
  submetering3 <- as.numeric(targetdata$Sub_metering_3)
  globalreactivepower <- as.numeric(targetdata$Global_reactive_power)
  voltage <- as.numeric(targetdata$Voltage)
  png("plot4.png", width=480, height=480)
  par(mfrow = c(2, 2))   
  plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power", cex=0.2)
  plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")  
  plot(datetime, submetering1, type="l", ylab="Energy Submetering", xlab="")
  lines(datetime, submetering2, type="l", col="red")
  lines(datetime, submetering3, type="l", col="blue")
  legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")  
  plot(datetime, globalreactivepower, type="l", xlab="datetime", ylab="Global_reactive_power")
  dev.off() 
}   


plot4()