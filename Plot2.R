#setting up my workng directory
setwd("~/Desktop/Rcoursera/Cur44/ExData_Plotting1")
#reading the data '%m-%d-%Y'
HouseHoldData <<- as.data.frame(read.csv("./household_power_consumption.txt", sep=";", na.strings = "?"))
#Subsetting the HouseHoldData
subsHouseHoldData<-subset(HouseHoldData, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") |
                            as.Date(Date,format="%d/%m/%Y") ==as.Date("02/02/2007",format="%d/%m/%Y"))


#Melting both the date and time in order to get one single datetime variable
subsHouseHoldData$datetime <- strptime(paste(subsHouseHoldData$Date,subsHouseHoldData$Time),format="%d/%m/%Y %H:%M:%S")
#Making the plot on a png file
png(file="plot2.png",width=480,height=480, bg=NA ,units="px")
# the plot must be type 1 to make a continuous line, in Y axis the active power and in X axis just the datetime reference
plot(x=subsHouseHoldData$datetime, y=subsHouseHoldData$Global_active_power, ylab="Global Active Power (kilowatts)", xlab="",type="l")
dev.off()