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
# plot 1 is a histogram of the Global_active_power

# Create a date combining the date and time - not needed for this one
# periodData$useDate<-strptime(paste(periodData$Date,periodData$Time, sep=" "),format = "%d/%m/%Y %H:%M:%S")

png("plot1.png",width=480, height=480)

hist(as.numeric(periodData$Global_active_power), col="red",main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

