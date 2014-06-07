library(data.table)
data <- fread("./respo/ExData_Plotting1/household_power_consumption.txt", sep=";", colClasses=rep("character",9), 
              na.strings=c("?"))
feb <-data[Date %in% c("1/2/2007", "2/2/2007"),]

feb[, DateTime:=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]
feb[, Date:=as.Date(Date, format="%d/%m/%Y")]
feb[, Global_active_power:=as.numeric(Global_active_power)]
feb[, Sub_metering_1:=as.numeric(Sub_metering_1)]
feb[, Sub_metering_2:=as.numeric(Sub_metering_2)]
feb[, Sub_metering_3:=as.numeric(Sub_metering_3)]

png("./respo/ExData_Plotting1/plot3.png", width = 480, height = 480, units = "px")
with(feb,  {
  plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", 
     main="", col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", lty=1, col=c("black","red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})
dev.off()