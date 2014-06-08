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
with(power, plot(datetime, Global_active_power, xlab = "", ylab = "Global Active Power (kilowatts)", type = "n"))
with(power, lines(datetime, Global_active_power, ylab = "Global Active Power (kilowatts)", xlab = ""))

##Saving to PNG
dev.copy(png, file = "plot2.png", 480, 480, bg = "transparent")
dev.off()