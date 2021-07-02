
library(lubridate)

# download and read in relevant data
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
              "household_power_consumption.zip")
unzip("household_power_consumption.zip")

data_w_names <- read.table("household_power_consumption.txt",
                           header = T,
                           sep = ";",
                           nrows = 1,)
data_names <- names(data_w_names)

data <- read.table("household_power_consumption.txt",
                   header = T,
                   sep = ";",
                   col.names = data_names,
                   nrows = 2880,
                   skip = 66636)

data$Date <- dmy(data$Date)
data$Time <- hms(data$Time) + data$Date

# open graphics device
png("plot3.png")

# construct plot
plot(data$Time,
     data$Sub_metering_1,
     type = "l",
     xlab = "",
     ylab = "Energy sub metering")
points(data$Time,
       data$Sub_metering_2, 
       type = "l", 
       col = "red")
points(data$Time,
       data$Sub_metering_3, 
       type = "l", 
       col = "blue")

legend("topright",
       legend = c("Sub_metering_1",
                  "Sub_metering_2",
                  "Sub_metering_3"),
       col = c("black",
               "red",
               "blue"),
       lty = 1)

# close graphics device
dev.off()

