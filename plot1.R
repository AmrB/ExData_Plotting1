# Set the path to the Working Directory
# Read the file
hpc<-read.table("household_power_consumption.txt",header=T,sep=";",na.strings="?")

# Perform date conversion
hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

# Create a data subset for the dates needed
hpc_sub <- hpc[(hpc$Date>="2007-02-01")&(hpc$Date<="2007-02-02"),]

# Perform date conversion
hpc_sub$Date  <- strptime(paste(hpc_sub$Date, hpc_sub$Time), format = '%d/%m/%Y %H:%M:%S')

# Create plot1 histogram 
hist(hpc_sub$Global_active_power, main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save the plot1 to png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
