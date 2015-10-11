plot1 <- function() {
  inputfile <- "household_power_consumption.txt"
  rawdata <- read.table(inputfile, header=T, sep=";", dec=".",stringsAsFactors=FALSE)
  targetdata <- rawdata[rawdata$Date %in% c("1/2/2007","2/2/2007") ,]
  
  globalactivepower <- as.numeric(targetdata$Global_active_power)
  png("plot1.png", width=480, height=480)
  hist(globalactivepower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
  dev.off()    
  }   


plot1()
