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
png(file="plot3.png",width=480,height=480, bg=NA ,units="px")
# the plot must have 3 subplots for submetering 1,2 and 3

## submeter #1
plot(x=subsHouseHoldData$datetime
     ,y=subsHouseHoldData$Sub_metering_1
     ,type="l"
     ,col="black"
     ,xlab=""
     ,ylab="Energy sub metering"
)

## submeter #2
lines(x=subsHouseHoldData$datetime
      ,y=subsHouseHoldData$Sub_metering_2
      ,type="l"
      ,col="red")

## submeter #3
lines(x=subsHouseHoldData$datetime
      ,y=subsHouseHoldData$Sub_metering_3
      ,type="l"
      ,col="blue")

legend("topright",legend=c('Sub_metering_1','Sub_metering_2','Sub_metering_3')
       ,lwd=1
       ,col=c("black","red","blue"))
dev.off()