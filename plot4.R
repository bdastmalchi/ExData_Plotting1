#=======================================================
#                reading and preparing data
#=======================================================
d1 <- read.csv("household_power_consumption.txt",sep=";")

d1[,1] <- as.Date(d1[,1],"%d/%m/%Y")

d2 <- d1[d1$Date == "2007-02-01" | d1$Date == "2007-02-02",]

d2[,2] <- format(strptime(d2[,2], "%H:%M:%S"),"%H:%M:%S")

wd <- sum(weekdays(d2[,1])=="Thursday")


for (ii in 3:9) d2[,ii]<-as.numeric(as.character(d2[,ii]))

#=======================================================
#                  creating png file
#=======================================================
png(filename = "plot4.png",
    width = 480, height = 480, units = "px")

par(mfrow = c(2,2))
#=======================================================
plot(d2$Global_active_power,
     xlab = "", ylab = "Global Active Power"
     , type = "l", xaxt = "n")
axis(side = 1, at = c(1,wd+1,length(d2$Date)),
                      labels = c("Thu","Fri","Sat"))
#=======================================================
plot(d2$Voltage,
     xlab = "", ylab = "Voltage"
     , type = "l", xaxt = 'n', sub = "datetime")
axis(side = 1, at = c(1,wd+1,length(d2$Date)),
     labels = c("Thu","Fri","Sat"))
#=======================================================
plot(d2$Sub_metering_1,
     xlab = "", ylab = "Energy sub metering"
     , type = "l", xaxt = "n", col = "black")
lines(d2$Sub_metering_2,
      xlab = "", ylab = "Energy sub metering"
      , type = "l", xaxt = "n", col = "red")
lines(d2$Sub_metering_3,
      xlab = "", ylab = "Energy sub metering"
      , type = "l", xaxt = "n", col = "blue")
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), col = c("black", "red", "blue"), bty = "n" )
axis(side = 1, at = c(1,wd+1,length(d2$Date)),
     labels = c("Thu","Fri","Sat"))
#=======================================================
plot(d2$Global_reactive_power,
     xlab = "", ylab = "Global_reactive_power"
     , type = "l", xaxt = "n", sub = "datetime")
axis(side = 1, at = c(1,wd+1,length(d2$Date)),
     labels = c("Thu","Fri","Sat"))
#=======================================================

dev.off()

