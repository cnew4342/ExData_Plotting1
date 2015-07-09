##  Exploratory Data Analysis, Project 1
##  Plot 2

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

png("plot2.png")
plot(hpcplot$dtn, hpcplot$Global_active_power, type = "l", ylab = "Global Active Power (kilowatts)", xlab = " ")
dev.off()

