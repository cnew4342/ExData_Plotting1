##  Exploratory Data Analysis, Project 1
##  Plot 4

setwd("~/R")
##  read in data file
hpcData <- read.table("./Data/household_power_consumption.txt", sep = ";", header = TRUE, as.is = FALSE, na.strings = "?")
head(hpcData)
str(hpcData)

library(dplyr)

hpc2 <- mutate(hpcData,Date_n = as.Date(Date, "%d/%m/%Y"), datetime_c = paste(Date, Time))

hpc3 <- filter(hpc2, Date_n == as.Date("02/01/2007", "%m/%d/%Y") | Date_n == as.Date("02/02/2007", "%m/%d/%Y"))
dtn <- strptime(hpc3$datetime_c, "%d/%m/%Y %H:%M:%S")

hpcplot <- data.frame(hpc3, dtn)     

head(hpcplot)
str(hpcplot)

png("plot4.png")
old.par <- par(mfrow=c(2, 2), mar=c(4.1,4.1,2.1,2.1))
plot(hpcplot$dtn, hpcplot$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", 
     xlab = " ")
plot(hpcplot$dtn, hpcplot$Voltage, type = "l", ylab = "Voltage", 
     xlab = "datetime")
plot(hpcplot$dtn, hpcplot$Sub_metering_1, type = "l", col = "black", ylab = "Energy sub metering", 
     xlab = " ", ylim = range(c(hpcplot$Sub_metering_1, hpcplot$Sub_metering_2, hpcplot$Sub_metering_3)),
)
legend( "topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), lwd=c(2.5,2.5,2.5),
        col=c("black","red","blue"))
par(new = TRUE)
plot(hpcplot$dtn, hpcplot$Sub_metering_2, type = "l", col = "red", axes = FALSE, xlab = "", 
     ylab = "", ylim = range(c(hpcplot$Sub_metering_1, hpcplot$Sub_metering_2, hpcplot$Sub_metering_3)))
par(new = TRUE)
plot(hpcplot$dtn, hpcplot$Sub_metering_3, type = "l", col = "blue", axes = FALSE, xlab = "", 
     ylab = "", ylim = range(c(hpcplot$Sub_metering_1, hpcplot$Sub_metering_2, hpcplot$Sub_metering_3)))
plot(hpcplot$dtn, hpcplot$Global_reactive_power, type = "l", ylab = "Global Active Power (kilowatts)", 
     xlab = "datetime")
par(old.par)
dev.off()
