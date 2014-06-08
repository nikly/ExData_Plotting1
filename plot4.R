#plot4 - multiple plots
library(sqldf) #load sqldf library for importing
#read in select data for required dates
data <- read.csv.sql("household_power_consumption.txt", sql ='select * from file where Date in ("1/2/2007","2/2/2007")', header=TRUE, sep=";")
data$datetime <- paste(data[,1],data[,2]) #create datetime as char
data$datetime <- strptime(data[,10],"%d/%m/%Y %H:%M:%S") #datetime to datetime
png(filename="plot4.png") #call device
par(mfrow = c(2,2)) #set parameters
attach(data) #attach data
plot(datetime,Global_active_power, type="l", xlab="") #plot1
plot(datetime,Voltage, type="l") #plot2
plot(datetime,Sub_metering_1, type="n", ylab="Energy sub metering", xlab="") #plot3
#establish Lines
lines(datetime,Sub_metering_1)
lines(datetime,Sub_metering_2, col="red")
lines(datetime,Sub_metering_3, col="blue")
#create legend
legend(bty = "n", "topright", col=c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
#plot4
plot(datetime,Global_reactive_power, type="l")
dev.off() #closes device
detach() #detaches data set