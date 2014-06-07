library(data.table)
data <- fread("./respo/ExData_Plotting1/household_power_consumption.txt", sep=";", colClasses=rep("character",9)
              , na.strings=c("?"))
feb <-data[Date %in% c("1/2/2007", "2/2/2007"),]

feb[, DateTime:=as.POSIXct(paste(Date, Time), format="%d/%m/%Y %H:%M:%S")]
feb[, Date:=as.Date(Date, format="%d/%m/%Y")]
feb[, Global_active_power:=as.numeric(Global_active_power)]

png("./respo/ExData_Plotting1/plot2.png", width = 480, height = 480, units = "px")
with(feb, plot(DateTime, Global_active_power, type="l", xlab="", ylab="Global Active Power(kilowatts)", main=""))
dev.off()