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

png(filename = "plot2.png", width = 480, height = 480)
#2
plot(data$DateTime, data$Global_active_power,  xlab = "", ylab = "Global Active Power (kilowatts)", type="l")

dev.off()