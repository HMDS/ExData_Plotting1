dload <- read.csv("household_power_consumption.txt", header=TRUE,sep = ";", as.is=TRUE, na.strings="?")


data <- subset(dload ,as.Date(dload$Date, "%d/%m/%Y") >='2007-02-01'& as.Date(dload$Date, "%d/%m/%Y") <='2007-02-02',)

#data[1:4,]
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S") 
data$Date <- as.Date(data$Date, format="%d/%m/%Y")
data$Global_active_power<- as.numeric(data$Global_active_power)
data$Sub_metering_1<- as.numeric(data$Sub_metering_1)
data$Sub_metering_2<- as.numeric(data$Sub_metering_2)
data$Sub_metering_3<- as.numeric(data$Sub_metering_3)
data$Global_reactive_power<- as.numeric(data$Global_reactive_power)

#class(data$DateTime) 


library (datasets) 

png(filename = "plot4.png", width = 480, height = 480)


par(mfrow = c(2, 2), mar = c(10, 5, 1, 1), cex=.5) 


#
plot(data$DateTime, data$Global_active_power,  xlab = "", ylab = "Global Active Power", type="l")
#
plot(data$DateTime, data$Voltage, xlab = "datetime", ylab = "Voltage", type="l")
#
plot(data$DateTime, data$Sub_metering_1, xlab = "", ylab = "Energy sub metering", type="n") 

lines(data$DateTime, data$Sub_metering_1, col = "black", type = "s") 
lines(data$DateTime, data$Sub_metering_2, col = "red", type = "s") 
lines(data$DateTime, data$Sub_metering_3, col = "blue", type = "s") 
legend("topright", lty = c(1, 1), lwd = c(1, 1, 1), col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 
#
plot(data$DateTime, data$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power", type="l")

dev.off()