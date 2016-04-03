# Coursera 
# Exploratory Data Analysis
# Week 1 Project
# Create graphs from specified data

# data is here: -
# https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

# Estimate of memory size
# 2,075,259 rows, x 9 columns x 8 bytes, is approx 150million bytes
# which is approx 142 megabytes which should be ok
# Can check with object.size(fullData) after - did and full data was 83mb.

# Load in the full data from the zip file
# NOTE: The zip file needs to be in the same directory
zipfile<-"exdata_data_household_power_consumption.zip"
fullData = read.table(unz(zipfile,"household_power_consumption.txt"),header=T,sep=";", na.strings="?", stringsAsFactors = F)

# subset the data to the 2007 data
periodData<-fullData[fullData$Date %in% c("1/2/2007","2/2/2007"),]

##################################################
# plot 4 shows four different charts. 
# Chart from plot 2, then plot from plot 2
# then on right voltage v time and lastly global reactive power vs time

# Create a date combining the date and time
periodData$useDate<-strptime(paste(periodData$Date,periodData$Time, sep=" "),format = "%d/%m/%Y %H:%M:%S")

png("plot4.png",width=480, height=480)

par(mfcol = c(2,2), mar = c(5,4,2,1))
#used col to get it to go down then across

# from plot2 - slightly different y-axis label
plot(periodData$useDate,as.numeric(periodData$Global_active_power),type="l", xlab = "",ylab="Global Active Power")

#from plot3
plot(periodData$useDate,as.numeric(periodData$Sub_metering_1),type="l", xlab = "",ylab="Energy sub metering")
lines(periodData$useDate,as.numeric(periodData$Sub_metering_2),type="l", col="red")
lines(periodData$useDate,as.numeric(periodData$Sub_metering_3),type="l", col="blue")
legend("topright", col=c("black", "red", "blue"),lty=1,lwd=2,legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")) 

# voltage vs date time - like plot 2
plot(periodData$useDate,as.numeric(periodData$Voltage),type="l", xlab = "datetime",ylab="Voltage")

# reactive power vs date time - again like plot 2
plot(periodData$useDate,as.numeric(periodData$Global_reactive_power),type="l", xlab = "datetime",ylab="Global_reacive_power")

dev.off()

