power <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subsetData <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

subsetData$Date <- as.Date(subsetData$Date, format="%d/%m/%Y")
subsetData$Time <- strptime(subsetData$Time, format="%H:%M:%S")
subsetData[1:1440,"Time"] <- format(subsetData[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subsetData[1441:2880,"Time"] <- format(subsetData[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

plot(subsetData$Time,subsetData$Sub_metering_1,type="n",xlab="",ylab="Energy sub metering")
with(subsetData,lines(Time,as.numeric(as.character(Sub_metering_1))))
with(subsetData,lines(Time,as.numeric(as.character(Sub_metering_2)),col="red"))
with(subsetData,lines(Time,as.numeric(as.character(Sub_metering_3)),col="blue"))
legend("topright", lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

title(main="Energy sub-metering")
png("Energy sub-metering", width=480, height=480)
dev.off()