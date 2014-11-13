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

# Create plot2
plot(hpc_sub$Global_active_power~hpc_sub$hpc_date_time, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

# Save the plot2 to png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()