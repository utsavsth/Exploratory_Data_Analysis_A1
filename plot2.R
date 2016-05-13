#fileUrl = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(fileUrl,destfile = "consumption.zip")
#unzip("consumption.zip")
hpc = read.table("household_power_consumption.txt",header=TRUE,sep=";",colClasses=c("character", "character", rep("numeric",7)),na="?")
hpc$Time <- strptime(paste(hpc$Date, hpc$Time), "%d/%m/%Y %H:%M:%S")
hpc$Date<-as.Date(hpc$Date,"%d/%m/%Y")
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")
hpc<-hpc[hpc$Date>=startDate & hpc$Date<=endDate,]

#png(filename = "plot2.png",width = 480,height = 480)
plot(hpc$Time, hpc$Global_active_power, type="l", 
     xlab="", ylab="Global Active Power (kilowatts)")
#dev.off()