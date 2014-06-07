library(data.table)
data <- fread("./respo/ExData_Plotting1/household_power_consumption.txt", sep=";", colClasses=rep("character",9), 
              na.strings=c("?"))
feb <-data[data$Date %in% c("1/2/2007", "2/2/2007"),]

feb[, DateTime:=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]
feb[, Date:=as.Date(Date, format="%d/%m/%Y")]
feb[, Global_active_power:=as.numeric(Global_active_power)]
feb[, Global_reactive_power:=as.numeric(Global_reactive_power)]
feb[, Sub_metering_1:=as.numeric(Sub_metering_1)]
feb[, Sub_metering_2:=as.numeric(Sub_metering_2)]
feb[, Sub_metering_3:=as.numeric(Sub_metering_3)]
feb[, Voltage:=as.numeric(Voltage)]

png("./respo/ExData_Plotting1/plot4.png", width = 480, height = 480, units = "px")
par(mfrow = c(2, 2))
with(feb, {
  plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power", main="")
  plot(DateTime, Voltage, type="l", xlab="datetime", main="")
  plot(DateTime, Sub_metering_1, type="l", xlab="", ylab="Energy sub metering", main="", col="black")
  lines(DateTime, Sub_metering_2, col="red")
  lines(DateTime, Sub_metering_3, col="blue")
  legend("topright", lty=1, col = c("black","red", "blue"), bty="n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(DateTime, Global_reactive_power, type="l", xlab="datetime", main="")
})
dev.off()