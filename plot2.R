#plot2 - line graph of Global Active Power Data vs datetime
library(sqldf) #load sqldf library for importing
#read in select data for required dates
data <- read.csv.sql("household_power_consumption.txt", sql ='select * from file where Date in ("1/2/2007","2/2/2007")', header=TRUE, sep=";")
data$datetime <- paste(data[,1],data[,2]) #create datetime as char
data$datetime <- strptime(data[,10],"%d/%m/%Y %H:%M:%S") #datetime to datetime
#define x and y variables for target data
y <-data$Global_active_power
x <-data$datetime
png(filename="plot2.png") #call device
plot(x,y, type="l", ylab="Global Active Power (kilowatts)") #plot line, y axis label
#closes graphic device
dev.off()