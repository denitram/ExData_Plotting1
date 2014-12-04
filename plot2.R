## Exploring Data Analysis: Project 1
## plot 2
##

# Read the data in R
hpc <- read.table("./household_power_consumption.txt", sep = ";", header = TRUE)

# Convert the Date column to the date format
hpc$Date <- as.Date(hpc$Date, "%d/%m/%Y")

# Select only the required dates
hpc_filtered <- hpc[hpc$Date == as.Date("2007-02-01") | hpc$Date == as.Date("2007-02-02"),]

# Convert the Global_active_power column to numeric
hpc_filtered$Global_active_power <- as.numeric(as.character(hpc_filtered$Global_active_power))

library(datasets)

png(filename = "plot2.png", width = 480, height = 480, units = "px")

# Concatenate the Date and Time columns and create a new column Date_Time 
hpc_filtered$Date_Time <- paste(hpc_filtered$Date, hpc_filtered$Time, sep=' ')

# Convert the char column Date_Time to POSIXlt format and create a new column 
hpc_filtered$Date_Time_Format <- strptime(hpc_filtered$Date_Time, "%Y-%m-%d %H:%M:%S")

# Create plot2
plot(hpc_filtered$Date_Time_Format,hpc_filtered$Global_active_power, type="l", ylab = "Globale Active Power (kilowatts)", xlab="")
dev.off()
