# Read the data in R
hpc <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

# Convert the Date column to the date format
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")
## Exploring Data Analysis: Project 1
## plot 1
##

# Select only the required dates
# hpc_small <- hpc[hpc$Date == "1/2/2007" | hpc$Date == "2/2/2007",]
hpc_small <- hpc[hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"),]

# Convert the Time column to the time format
hpc_small$Time <- strptime(hpc_small$Time, format = "%H:%M:%S")

# Convert the Global_active_power column to numeric
hpc_small$Global_active_power <- as.numeric(as.character(hpc_small$Global_active_power))

library(datasets)
# plot1
png(filename = "plot1.png", width = 480, height = 480, units = "px")
hist(hpc_small$Global_active_power, main = "Global Active Power", col = "red", xlab = "Globale Active Power (kilowatts)")
dev.off()