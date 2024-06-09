## Exploratory Data Analysis Programming Assignment 1: plot2 code

# Specify the path to the raw data file
raw_file <- "household_power_consumption.txt"
raw_data <- read.table(raw_file, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data for the specified dates
subset_power <- raw_data[raw_data$Date %in% c("1/2/2007", "2/2/2007"),]

# Check the structure of the subseted data
str(subset_power)

# Combine Date and Time columns to create a datetime object
datetime <- strptime(paste(subset_power$Date, subset_power$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

# Extract Global Active Power values as numeric
globalActivePower <- as.numeric(subset_power$Global_active_power)

# Create a PNG file for the line plot
png("plot2.png", width=480, height=480)

# Create a line plot of Global Active Power over datetime
plot(datetime, globalActivePower, type="l", xlab="Day", ylab="Global Active Power (kilowatts)")
dev.off()
