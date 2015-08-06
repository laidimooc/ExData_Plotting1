library(dplyr)
library(lubridate)

if(!file.exists("ok_data.csv")){
  all_data <- read.csv("household_power_consumption.txt", sep = ";", na.strings = "?")
  ok_data <- filter(all_data,dmy(all_data$Date) >= ymd("2007-02-01") & dmy(all_data$Date)<=ymd("2007-02-02"))
  write.csv(ok_data,"ok_data.csv")
} else {
  ok_data <- read.csv("ok_data.csv")
  
}

Sys.setlocale(category = "LC_ALL", locale = "English") ## My PC speaks french !!

ok_data$datetime <- dmy(ok_data$Date)+hms(ok_data$Time)


png(filename="plot2.png",width = 480, height = 480, units = "px",bg = "white")

with(ok_data,plot(datetime,Global_active_power,

                  type="l",
                  xlab="",
                  ylab = "Global Active Power (kilowatts)"
                  ))
dev.off()