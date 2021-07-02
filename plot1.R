
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

data$Date <- strptime(data$Date, "%d/%m/%Y")
data$Time <- strptime(data$Time, "%H:%M:%S")

# open graphics device
png("plot1.png")

# construct plot
hist(data$Global_active_power,
     xlab = "Global Active Power (kilowatts)",
     main = "Global Active Power",
     col = "red")

# close graphics device
dev.off()

