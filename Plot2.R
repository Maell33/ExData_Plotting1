##### Script to obtain plot 2

### Read and subsetting data: 
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
data <- read.table(unz(temp,"household_power_consumption.txt"), sep=";",header=T,na="?",
                   colClasses=c("character","character",
                                "numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
head(data)
# add a column with info about Date and Time as objects
data$POSIX <- as.POSIXlt.character(paste(data$Date,data$Time),format="%d/%m/%Y %H:%M:%S")
#subset data
subdata <- subset(data,data$Date=="1/2/2007"|data$Date=="2/2/2007") 

# Create histogram and save it as png: 
png(file="Plot2.png",width=480,height = 480)
plot(subdata$POSIX,subdata$Global_active_power,type="l",
     ylab="Global Active Power (kilowatts)",xlab='')
dev.off()

