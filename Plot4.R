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
png(file="plot4.png",width=480,height=480, bg=NA ,units="px")
# the plot must have 4 subplots for  different relationships.
#plot 1 top left chart global active power vs datetime
#plot 2 top rigth chart voltage vs datetime
#plot 3 bottom rigth chart energy submetering vs datetime
#plot 4 bottom left chart global reactive power vs datetime

png(filename="plot4.png"
    ,width=480
    ,height=480
    ,units="px"
    ,bg=NA)


par(mfrow = c(2,2))

## Plot top left chart
plot(x=subsHouseHoldData$datetime
     ,y=subsHouseHoldData$Global_active_power
     ,type="l"
     ,col="black"
     ,xlab=""
     ,ylab="Global Active Power"
)

## plot top right chart
plot(x=subsHouseHoldData$datetime
     ,y=subsHouseHoldData$Voltage
     ,type="l"
     ,col="black"
     ,xlab="datetime"
     ,ylab="Voltage"
)

## Plot bottom left chart
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
legend("topright" # location of legend
       ,legend=c('sub_metering_1','sub_metering_2','sub_metering_3')
       ,lwd=1
       ,bty="n"
       ,col=c("black","red","blue"))

## Plot bottom right
plot(x=subsHouseHoldData$datetime
     ,y=subsHouseHoldData$Global_reactive_power
     ,type="l"
     ,col="black"
     ,xlab="datetime"
     ,ylab="global_reactive_power"
)

dev.off()
