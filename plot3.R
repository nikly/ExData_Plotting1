#plot3 - multiple line graph of sub_metering_1-3 vs datetime
library(sqldf) #load sqldf library for importing
#read in select data for required dates
data <- read.csv.sql("household_power_consumption.txt", sql ='select * from file where Date in ("1/2/2007","2/2/2007")', header=TRUE, sep=";")
data$datetime <- paste(data[,1],data[,2]) #create datetime as char
data$datetime <- strptime(data[,10],"%d/%m/%Y %H:%M:%S") #datetime to datetime
#attaches target dataset to ease calling of variables
attach(data)
png(filename="plot3.png") #call png device
plot(datetime,Sub_metering_1, type="n", ylab="Energy sub metering") #initiates plot
#establish Lines
lines(datetime,Sub_metering_1)
lines(datetime,Sub_metering_2, col="red")
lines(datetime,Sub_metering_3, col="blue")
#create legend
legend("topright", col=c("black","red","blue"), legend= c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),lty=1)
dev.off() #closes device
detach() #detaches data dataset