#setting up my workng directory
 setwd("~/Desktop/Rcoursera/Cur44/ExData_Plotting1")
#reading the data '%m-%d-%Y'
HouseHoldData <<- as.data.frame(read.csv("./household_power_consumption.txt", sep=";", na.strings = "?"))
#Subsetting the HouseHoldData
subsHouseHoldData<-subset(HouseHoldData, as.Date(Date,format="%d/%m/%Y") == as.Date("01/02/2007",format="%d/%m/%Y") |
as.Date(Date,format="%d/%m/%Y") ==as.Date("02/02/2007",format="%d/%m/%Y"))
png(file="plot1.png",width=480,height=480, bg=NA ,units="px")
hist(as.double(subsHouseHoldData$Global_active_power), col=2,main="Global Active Power",xlab="Global Active Power in (kilowatts)", ylim=c(0, 1400))
dev.off()