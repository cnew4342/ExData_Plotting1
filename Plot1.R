
##  Exploratory Data Analysis, Project 1
##  Plot 1

setwd("~/R")
##  read in data file
hpcData <- read.table("./Data/household_power_consumption.txt", sep = ";", header = TRUE, as.is = FALSE, na.strings = "?")
head(hpcData)
str(hpcData)

library(dplyr)

hpc2 <- mutate(hpcData,Date = as.Date(Date, "%d/%m/%y"))
hpcplot <- filter(hpc2, Date == as.Date("02/01/2007", "%m/%d/%y") | Date == as.Date("02/02/2007", "%m/%d/%y"))

head(hpcplot)
str(hpcplot)

png("plot1.png")
hist(hpcplot$Global_active_power,col = 'red', main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()