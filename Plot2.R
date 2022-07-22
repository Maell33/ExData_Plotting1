##### Script to obtain plot 2

### Read and subsetting data: 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp,"household_power_consumption.txt"), sep=";")
head(data)
colnames(data) <- data[1,] # rename column header
data <- data[-1,]
# add a column with info about Date and Time as objects
data$POSIX <- as.POSIXlt.character(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
#subset data
subdata <- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007") 

subdata$Global_active_power <- as.numeric(subdata$Global_active_power)

# Create histogram and save it as png: 
png(file="Plot2.png",width=480,height = 480)
plot(subdata$POSIX,subdata$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab='')
dev.off()
