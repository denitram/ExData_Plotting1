## Exploring Data Analysis: Project 1
## plot 3
##

library(datasets)

# Read the data in R
hpc <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

# Convert the Date column to the date format
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# Select only the required dates
hpc_filtered <- hpc[hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"),]

# Concatenate the Date and Time columns and create a new column Date_Time 
hpc_filtered$Date_Time <- paste(hpc_filtered$Date, hpc_filtered$Time, sep=' ')
# Convert the char column Date_Time to POSIXlt format and create a new column 
hpc_filtered$Date_Time_Format <- strptime(hpc_filtered$Date_Time, "%Y-%m-%d %H:%M:%S")

# Convert columns Sub_metering_1 and Sub_metering_2 from factor to numeric
hpc_filtered$Sub_metering_1 <- as.numeric(as.character(hpc_filtered$Sub_metering_1))
hpc_filtered$Sub_metering_2 <- as.numeric(as.character(hpc_filtered$Sub_metering_2))

# Create plot3
png(filename = "plot3.png", width = 480, height = 480, units = "px")
plot(hpc_filtered$Date_Time_Format,hpc_filtered$Sub_metering_1, type="l", ylab = "Energy sub metering", xlab="", col="black")
lines(hpc_filtered$Date_Time_Format,hpc_filtered$Sub_metering_2, col="red")
lines(hpc_filtered$Date_Time_Format,hpc_filtered$Sub_metering_3, col="blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
print(plot)
dev.off()
