power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subsetData <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")
subsetData$Time <- strptime(subsetData$Time, format="%H:%M:%S")
subsetData[1:1440,"Time"] <- format(subsetData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetData[1441:2880,"Time"] <- format(subsetData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

par(mfrow=c(2,2))

plot(subsetData,as.numeric(subsetting$Global_active_power), type="l", xlab="", ylab="Global Active Power", cex=0.2)
plot(subsetData,as.numeric(subsetting$Voltage) , type="l", xlab="datetime", ylab="Voltage")
plot(subsetData,as.numeric(subsetting$Sub_metering_1), type="l", ylab="Energy Submetering", xlab="")
lines(subsetData,as.numeric(subsetting$Sub_metering_2), type="l", col="red")
lines(subsetData,as.numeric(subsetting$Sub_metering_3), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")
plot(subsetData,as.numeric(subsetting$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reactive_power")

png("Plot 4", width=480, height=480)
dev.off()
