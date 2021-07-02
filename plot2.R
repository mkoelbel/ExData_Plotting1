
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
png("plot2.png")

# construct plot
plot(data$Time,
     data$Global_active_power,
     type = "l",
     xlab = "",
     ylab = "Global Active Power (kilowatts)")

# close graphics device
dev.off()

