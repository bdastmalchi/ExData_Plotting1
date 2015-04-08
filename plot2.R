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
png(filename = "plot2.png",
    width = 480, height = 480, units = "px")

plot(d2$Global_active_power,
     xlab = "", ylab = "Global Active Power (kilowatts)"
     , type = "l", xaxt = 'n')
axis(side = 1, at = c(1,wd+1,length(d2$Date)),
                      labels = c("Thu","Fri","Sat"))

dev.off()

