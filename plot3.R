## Load subset of data from the Electric Power Consumption text file in the working directory
plot3_file <- "household_power_consumption.txt"
data_set <- read.table(plot3_file, header = TRUE, sep = ";", stringsAsFactors=FALSE, dec = ".")

## Subsetting the data to only include the two dates using the "or" operator and also keeping all of the columns using the select function
data_subset <- subset(data_set, Date == "1/2/2007" | Date == "2/2/2007", select = Date:Sub_metering_3)

## Before I can plot the data to the graph, need to convert the Global_active_power field from a string variable to a numeric value
global_active_power_set <- as.numeric(data_subset$Global_active_power)

## In order to create the x-axis for the 3 days need to convert the date in string format to a date/time format
date_time_set <- strptime(paste(data_subset$Date, data_subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

## Need to produce another line graph, but now as a multivariate graph with three variables, need to convert string into numeric value so it can be plotted
sub_metering1_set <- as.numeric(data_subset$Sub_metering_1)
sub_metering2_set <- as.numeric(data_subset$Sub_metering_2)
sub_metering3_set <- as.numeric(data_subset$Sub_metering_3)

## Next, need to change the graphics device to export the plot to a .png file, could have used dev.copy to create the .png file as well
png(file = "plot3.png", width = 480, height = 480)

## Now, can plot the the data to a line graph with the plot function setting the type to "l" to indicate a line graph for the first variable
plot(date_time_set, sub_metering1_set,  type = "l", xlab = "", ylab = "Energy sub metering")

## In order to add more variables to the plot/line graph, need to to use the line function to add variables 2 (sub_metering2_set ) & 3 to the plot
lines(date_time_set, sub_metering2_set, type = "l", col = "red")
lines(date_time_set, sub_metering3_set, type = "l", col = "blue")

## Working with the base plotting system, we can build on the plot by now adding a legend to the upper right corner of the plot/chart
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, lwd = 3, col = c("black", "red", "blue"))

## Finally, need to redirect the graphics device output back to the default: screen
dev.off()


