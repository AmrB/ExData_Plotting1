# Set the path to the Working Directory
# Read the file
hpc<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")

# Perform date conversion
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# Create a data subset for the dates needed
hpc_sub <- hpc[(hpc$Date>="2007-02-01")&(hpc$Date<="2007-02-02"),]

# Perform date conversion
hpc_date_time <- paste(as.Date(hpc_sub$Date), hpc_sub$Time)
hpc_sub$hpc_date_time <- as.POSIXct(hpc_date_time)

# Create plot3
with(hpc_sub, {
  plot(Sub_metering_1~hpc_date_time, type="l", xlab="", ylab="Global Active Power (kilowatts)", )
  lines(Sub_metering_2~hpc_date_time,col='Red')
  lines(Sub_metering_3~hpc_date_time,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Save the plot3 to png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
