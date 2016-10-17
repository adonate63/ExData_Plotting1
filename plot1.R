## Load subset of data from the Electric Power Consumption text file in the working directory
plot1_file <- "household_power_consumption.txt"
data_set <- read.table(plot1_file, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

## Subsetting the data to only include the two dates using the "or" operator and also keeping all of the columns using the select function
data_subset <- subset(data_set, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

## Before I can plot the data to the graph, need to convert the Global_active_power field from a string variable to a numeric value
global_active_power_set <- as.numeric(data_subset$Global_active_power)

## Next, need to change the graphics device to export the polt to a .png file, could have used dev.copy to create the .png file as well
png(file = "plot1.png", width = 480, height = 480)

## Now, can plot the global active power data element on a histogram plot and send out to the .png file (graphics device)
hist(global_active_power_set, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

## Finally, need to redirect the graphics device output back to the default: screen
dev.off()

