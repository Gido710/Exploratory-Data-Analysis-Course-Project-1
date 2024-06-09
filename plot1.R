##Exploratory Data Analysis Programming Assignment 1: plot1 code

#Read the data into R
raw_data <- "household_power_consumption.txt"
data <- read.table(raw_data, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

# Subset the data for the specified dates
subset_power <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

# Check the structure of the subseted data
str(subset_power)

# Extract the Global Active Power values as numeric
globalActivePower <- as.numeric(subset_power$Global_active_power)

# Create a PNG file for the histogram plot
png("plot1.png", width=480, height=480)

# Create a histogram of Global Active Power
hist(globalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
