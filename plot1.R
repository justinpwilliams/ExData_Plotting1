##The following loads the data and generats plot1.png as directed in the Exploratory Data Analysis class. 
##NOTE: This assumes that the raw data file is in the current working directory

memreq <- 2075259 * 9 * 8 ##Estimating memory requirements
memreq <- memreq/(2^20)
memreq ## Returns number of mb needed
##Computer has 4 GB of RAM --- good to go
##Loading data file
power <- read.table("household_power_consumption.txt", header = TRUE, sep = ";", nrows = 2075259, colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),comment.char ="", na.strings = "?")

##Subsetting data for faster processing, selecting only 2004-02-01 and 2007-02-02 as directed
power <- power[power$Date == "1/2/2007" | power$Date == "2/2/2007",]

##Changing Date and Time to be date type and time type
power$Date <- strptime(power$Date, "%d/%m/%Y")
power$Time <- strptime(power$Time, "%H:%M:%S")

##Generating Plot 1
with(power, hist(power$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))
dev.copy(png, file = "plot1.png", 480, 480, bg = "transparent")
dev.off()