#### Script to obtain plot 1

# Read and subsetting data:
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp,"household_power_consumption.txt"), sep=";",header=T,na="?",
                   colClasses=c("character","character",
                                "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
head(data)
#subset data
subdata <- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007")

# Create histogram and save it as png: 
png(file="Plot1.png",width=480,height = 480)
hist(subdata$Global_active_power,col="red",
     main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()
