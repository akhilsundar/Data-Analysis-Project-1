#Akhil Sundar
#Course Project 1

file = file("household_power_consumption.txt")
x = read.table(text = grep("^[1,2]/2/2007", readLines(file), value = TRUE),col.names = c("Date", "Time", "Global_active_power", 
        "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), sep = ";", header = TRUE)

#1

hist(x$Global_active_power,col="red",main=paste("Global Active Power"), xlab="Global Active Power (kilowatts)")

#2

full=read.csv("household_power_consumption.txt", header = T, sep = ';',  na.strings = "?", nrows =2075259, check.names= F, stringsAsFactors = F, comment.char = "", quote = '\"')
full$Date=as.Date(full$Date, format= "%d/%m/%Y")
sub=subset(full, subset=(Date >= "2007-02-01" & Date <= "2007-02-02"))
rm(full)
dt=paste(as.Date(sub$Date), sub$Time)
sub$Datetime= as.POSIXct(dt)
plot(sub$Global_active_power ~ sub$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#3


plot(sub$Sub_metering_1 ~ sub$Datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")
lines(sub$Sub_metering_2 ~ sub$Datetime, col = 'Red')
lines(sub$Sub_metering_3 ~ sub$Datetime, col = 'Blue')
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, legend = c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
#4

layout(matrix(c(1,2,3,4),2,2,byrow=FALSE))
    plot(sub$Global_active_power ~ sub$Datetime, type = "l", ylab = "Global Active Power", xlab = "")
    plot(sub$Sub_metering_1 ~ sub$Datetime, type = "l", ylab = "Energy sub metering",xlab = "")
    lines(sub$Sub_metering_2 ~ sub$Datetime, col = 'Red')
    lines(sub$Sub_metering_3 ~ sub$Datetime, col = 'Blue')
    legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
           legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
    plot(sub$Voltage ~ sub$Datetime, type = "l", ylab = "Voltage", xlab = "datetime")
    plot(sub$Global_reactive_power ~ sub$Datetime, type = "l",  ylab = "Global_rective_power", xlab = "datetime")

