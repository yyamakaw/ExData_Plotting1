# 
# Setting working directory
setwd("D:\\_work\\_Training\\Data_Science\\R_Project\\Exploratory_Data_Analysis\\week1")
# Downloading zip file from the URL
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url, ".\\data.zip")
# Read data into a table
pwr_data <- read.table(unzip(".\\data.zip"), header=TRUE, sep=";", as.is=TRUE, na.strings="?")
# Convert date to Date object
pwr_data$Date <- as.Date(pwr_data$Date, "%d/%m/%Y")
# Retrieve subset of data between 2007/02/01 - 2007/02/02
pwr_sub_data <- pwr_data[which(pwr_data$Date >= '2007/02/01' & pwr_data$Date <= '2007/02/02'),]
# Plotting a graph in png
png(filename = "plot3.png", width = 480, height = 480, units = "px")
with(pwr_sub_data, plot(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"), Sub_metering_1, xlab="", ylab="Enerty sub metering", type="l", col="black"))
with(pwr_sub_data, points(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"), Sub_metering_2, type="l", col="red"))
with(pwr_sub_data, points(strptime(paste(Date,Time),"%Y-%m-%d %H:%M:%S"), Sub_metering_3, type="l", col="blue"))
legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lwd=1)
dev.off()
