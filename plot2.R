## Load subset of data from the Electric Power Consumption text file in the working directory
plot2_file <- "household_power_consumption.txt"
data_set <- read.table(plot2_file, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

## Subsetting the data to only include the two dates using the "or" operator and also keeping all of the columns using the select function
data_subset <- subset(data_set, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

## Before I can plot the data to the graph, need to convert the Global_active_power field from a string variable to a numeric value
global_active_power_set <- as.numeric(data_subset$Global_active_power)

## In order to create the x-axis for the 3 days need to convert the date in string format to a date/time format
date_time_set <- strptime(paste(data_subset$Date, data_subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Next, need to change the graphics device to export the plot to a .png file, could have used dev.copy to create the .png file as well
png(file = "plot2.png", width = 480, height = 480)

## Now, can plot the the data to a line graph with the plot function setting the type to "l" to indicate a line graph
plot(date_time_set, global_active_power_set, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)")

## Finally, need to redirect the graphics device output back to the default: screen
dev.off()
