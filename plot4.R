fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(fileUrl,destfile = "consumption.zip")
unzip("consumption.zip")
hpc = read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
hpc<-hpc[hpc$Date>=startDate & hpc$Date<=endDate,]

png("plot4.png", width=480, height=480)
par(mfrow=c(2, 2))

plot(hpc$Time, hpc$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power")
plot(hpc$Time, hpc$Voltage, type="l", 
     xlab="datetime", ylab="Voltage")
plot(hpc$Time, hpc$Sub_metering_1, type="l", 
     xlab="", ylab="Energy sub metering")
lines(hpc$Time, hpc$Sub_metering_2, col="red")
lines(hpc$Time, hpc$Sub_metering_3, col="blue")
legend("topright", bty="n", lty=1, col=c("black", "red", "blue"), 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
plot(hpc$Time, hpc$Global_reactive_power, type="l", 
     xlab="datetime", ylab="Global_reactive_Power")
dev.off()