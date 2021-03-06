setwd("/Users/perdahci/Google Drive/COURSES/DataScience/Exploratory_Data_Analysis/P1/ExData_Plotting1")
data_file <- read.csv(file = "household_power_consumption.txt", sep = ";", header = TRUE, na.strings="?")
data_file$Date <- as.POSIXct(paste(strptime(data_file$Date, "%d/%m/%Y")))
data_t <- within(data_file, { timestamp=paste(Date, Time) })
ss <- subset(data_t, timestamp > strptime("31/01/2007 00:00:00", "%d/%m/%Y %H:%M:%S") & timestamp < strptime("03/02/2007 00:00:00", "%d/%m/%Y %H:%M:%S"))
png(filename = "plot2.png", width = 480, height = 480, units = "px")
with(ss, plot(strptime(timestamp,"%Y-%m-%d %H:%M:%S"), Global_active_power, ylab="Global Active Power (kilowatts)", xlab="", type="l"))
dev.off()
