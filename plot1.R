#=======================================================
#                reading and preparing data
#=======================================================
d1 <- read.csv("household_power_consumption.txt",sep=";")

d1[,1] <- as.Date(d1[,1],"%d/%m/%Y")

d2 <- d1[d1$Date == "2007-02-01" | d1$Date == "2007-02-02",]

d2[,2] <- format(strptime(d2[,2], "%H:%M:%S"),"%H:%M:%S")

for (ii in 3:9) d2[,ii]<-as.numeric(as.character(d2[,ii]))


#=======================================================
#                  creating png file
#=======================================================
png(filename = "plot1.png",
    width = 480, height = 480, units = "px")
hist(d2$Global_active_power,
     xlab="Global Active Power (kilowatts)"
     ,main="Global Active Power",col=2)
dev.off()

