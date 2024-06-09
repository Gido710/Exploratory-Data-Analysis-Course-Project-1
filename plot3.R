## Exploratory Data Analysis Programming Assignment 1: plot3 code

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

# Extract Global Active Power and Sub_metering values as numeric
globalActivePower <- as.numeric(subset_power$Global_active_power)
sub_Metering_1 <- as.numeric(subset_power$Sub_metering_1)
sub_Metering_2 <- as.numeric(subset_power$Sub_metering_2)
sub_Metering_3 <- as.numeric(subset_power$Sub_metering_3)

# Create a PNG file for the line plot
png("plot3.png", width=480, height=480)

# Create a line plot of Sub_metering values over datetime
plot(datetime, sub_Metering_1, type="l", ylab="Energy Sub metering", xlab="")
lines(datetime, sub_Metering_2, type="l", col="red")
lines(datetime, sub_Metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()

