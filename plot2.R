plot2 <- function() {
  inputfile <- "household_power_consumption.txt"
  rawdata <- read.table(inputfile, header=T, sep=";", dec=".",stringsAsFactors=FALSE)
  targetdata <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007") ,]
  
  datetime <- strptime(paste(targetdata$Date, targetdata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
  globalactivepower <- as.numeric(targetdata$Global_active_power)
  png("plot2.png", width=480, height=480)
  plot(datetime, globalactivepower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
  dev.off() 
}   


plot2()
