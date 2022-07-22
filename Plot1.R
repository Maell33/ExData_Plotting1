#### Script to obtain plot 1

# Read and subsetting data: 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp,"household_power_consumption.txt"), sep=";")
head(data)
colnames(data) <- data[1,] # rename column header
data <- data[-1,]
subdata <- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")
subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

# Create histogram and save it as png: 
png(file="Plot1.png",width=480,height = 480)
hist(subdata$Global_active_power,col="red",
     main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
