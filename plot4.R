##The following loads the data and generats plot1.png as directed in the Exploratory Data Analysis class. 
##NOTE: This assumes that the raw data file is in the current working directory
 
##Loading data file
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2075259, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),comment.char ="", na.strings = "?")
 
##Subsetting data for faster processing, selecting only 2004-02-01 and 2007-02-02 as directed
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]
 
##Changing Date and Time to be date type and time type
datetime <- paste(power$Date, power$Time)
datetime <- strptime(datetime, "%d/%m/%Y %H:%M:%S")
power$datetime <- datetime
 
##Plotting graphic
par(mfrow = c(2,2)) 
with (power, { 
	##Build first plot
	plot(datetime, Global_active_power, xlab = "", type = "n")
	lines(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = "")
	
	##Build second plot
	plot(datetime, Voltage, xlab = "datetime", type = "n")
	lines(datetime, Voltage, ylab = "Voltage")
	
	##Build third plot
	plot(datetime, Sub_metering_1, xlab = "", ylab = "Energy submetering", type = "n", col = "black")
	lines(datetime, Sub_metering_1, xlab = "", col = "black")
	lines(datetime, Sub_metering_2, xlab = "", col = "red")
	lines(datetime, Sub_metering_3, xlab = "", col = "blue")
	legend("topright", legend = names(power)[7:9], lty = c (1,1,1), lwd = c(2,2,2), col = c("black","red","blue"), box.lwd = 0)
	
	##Build forth plot
	plot(datetime, Global_reactive_power, xlab = "datetime", type = "n")
	lines(datetime, Global_reactive_power, ylab = "Global_reactive_power")
})


##Saving to PNG
dev.copy(png, file = "plot4.png", 480, 480, bg = "transparent")
dev.off()