#plot1 - histogram of Global Active Power Data
library(sqldf) #load sqldf library for importing
#read in select data for required dates
data <- read.csv.sql("household_power_consumption.txt", sql ='select * from file where Date in ("1/2/2007","2/2/2007")', header=TRUE, sep=";")
data$datetime <- paste(data[,1],data[,2]) #create datetime as char
data$datetime <- strptime(data[,10],"%d/%m/%Y %H:%M:%S") #datetime to datetime
png(filename="plot1.png") #call png device
attach(data) #attach for referencing
#plot histogram with Title, x label, and histogram bar color
plot(hist(Global_active_power),main="Global Active Power",xlab="Global Active Power (kilowatts)", col="red")
detach(data) #detach set
dev.off() #closes graphic device