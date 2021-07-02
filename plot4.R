
library(lubridate)

# read in relevant data
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
png("plot4.png")

# construct plot
par(mfrow = c(2,2))

# top left plot
plot(data$Time,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power")

# top right plot
plot(data$Time,
     data$Voltage,
     type = "l",
     xlab = "datetime",
     ylab = "Voltage")

# bottom left plot
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
       lty = 1,
       bty = "n")

# bottom right plot
plot(data$Time,
     data$Global_reactive_power,
     type = "l",
     xlab = "datetime",
     ylab = "Global_reactive_power")


# close graphics device
dev.off()

