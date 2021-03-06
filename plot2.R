library(dplyr)
library(datasets)
hpc <- read.table("household_power_consumption.txt",sep = ";",header=TRUE)
hpc$Date <- as.Date(hpc$Date,"%d/%m/%Y")
hpc <- filter(hpc,Date=="2007-02-01"| Date=="2007-02-02")
datetime <- as.POSIXct(paste(hpc$Date, hpc$Time),format="%Y-%m-%d %H:%M:%S")
hpc <- cbind(hpc,datetime)
hpc$Global_active_power <- as.numeric(hpc$Global_active_power)
with(hpc,plot(x=datetime,y=Global_active_power,type="l",ylab = "Global Active Power (kilowatts)"))
dev.copy(png, file="plot2.png",width = 480, height = 480)
dev.off()
