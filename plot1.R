library(dplyr)
library(lubridate)

if(!file.exists("ok_data.csv")){
  all_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
  ok_data <- filter(all_data,dmy(all_data$Date) >= ymd("2007-02-01") & dmy(all_data$Date)<=ymd("2007-02-02"))
  write.csv(ok_data,"ok_data.csv")
} else {
  ok_data <- read.csv("ok_data.csv")
  
}


png(filename="plot1.png",width = 480, height = 480, units = "px")

hist(ok_data$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()