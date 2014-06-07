library(data.table)
data <- fread("./respo/ExData_Plotting1/household_power_consumption.txt", sep=";", colClasses=rep("character",9)
              , na.strings=c("?"))
feb <-data[Date %in% c("1/2/2007", "2/2/2007"),]
feb[, Date:=as.Date(Date, format="%d/%m/%Y")]
feb[, Global_active_power:=as.numeric(Global_active_power)]

png("./respo/ExData_Plotting1/plot1.png", width = 480, height = 480, units = "px")
hist(feb$Global_active_power, main="Global Active Power", xlab="Global Active Power(kilowatts)", col="red")
dev.off()