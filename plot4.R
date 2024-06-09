## Exploratory Data Analysis Programming Assignment 1: plot4 code

# Specify the path to the raw data file
raw_file <- "household_power_consumption.txt"

# Read the data into R, specifying file properties
raw_data <- read.table(raw_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data for the specified dates
subset_power <- raw_data[raw_data$Date %in% c("1/2/2007", "2/2/2007"),]

# Check the structure of the subseted data
str(subset_power)

# Combine Date and Time columns to create a datetime object
datetime <- strptime(paste(subset_power$Date, subset_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Extract Global Active Power, Global Reactive Power, and Voltage as numeric
globalActivePower <- as.numeric(subset_power$Global_active_power)
globalReactivePower <- as.numeric(subset_power$Global_reactive_power)
voltage <- as.numeric(subset_power$Voltage)
sub_Metering_1 <- as.numeric(subset_power$Sub_metering_1)
sub_Metering_2 <- as.numeric(subset_power$Sub_metering_2)
sub_Metering_3 <- as.numeric(subset_power$Sub_metering_3)

# Create a PNG file for the multiple plots
png("plot4.png", width=480, height=480)

# Set up a 2x2 grid of plots
par(mfrow = c(2, 2)) 

# Plot Global Active Power over datetime
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

# Plot Voltage over datetime
plot(datetime, voltage, type="l", xlab="datetime", ylab="Voltage")

# Plot Sub_metering values over datetime
plot(datetime, sub_Metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, sub_Metering_2, type="l", col="red")
lines(datetime, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"), bty="o")

# Plot Global Reactive Power over datetime
plot(datetime, globalReactivePower, type="l", xlab="datetime", ylab="Global Reactive Power")
dev.off()
