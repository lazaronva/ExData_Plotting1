# Loading the data
# Loading the dataset into R:
# The dataset has 2,075,259 rows and 9 columns.
# First calculate a rough estimate of how much memory the dataset will require in memory before reading into R.
# Make sure your computer has enough memory.
getwd()
# [1] "/home/lazaro/Documents/CURSOS/COURSERA/CURSO_EXPLORATORY_DATA_ANALYSIS/Project_1"
eletric = read.table("/home/lazaro/Documents/CURSOS/COURSERA/CURSO_EXPLORATORY_DATA_ANALYSIS/Project_1/household_power_consumption.txt", header = TRUE, sep = ";")
object.size(eletric)
# 83644688 bytes
print(object.size(eletric), units = "Mb")
# 79.8 Mb OK! to my computer.
str(eletric)
# data.frame':	2075259 obs. of  9 variables:
head(eletric)
# To see the data table
#
# Subsetting data from the dates 2007-02-01 and 2007-02-02.
# subsetting to those dates:
library(dplyr)
library(lubridate)
eletric.f <- eletric[66637:69516,]
head(eletric.f)
tail(eletric.f)
names(eletric.f)
eletric.f$UTC_DATE <- mdy(eletric.f$Date)
names(eletric.f)
head(eletric.f)
tail(eletric.f)
#
# Convert the Date and Time variables
# to Date/Time classes in R using 
# the strptime() and as.Date() functions.
dates <- eletric.f$UTC_DATE
tempo <- eletric.f$Time
Date_Times <- paste(dates, tempo)
eletric.f$Date_Time <- ymd_hms(Date_Times)
head(eletric.f)
tail(eletric.f)
#
# Code of missing values 
# ? 
#
# Making Plots
# Global Active Power
class(eletric.f$Global_active_power)
eletric.f_p1 <- as.numeric(eletric.f$Global_active_power)
class(eletric.f_p1)
eletric.f_p2 <- eletric.f$Date_Time
png(filename = "plot2.png", width = 480, height = 480, units = "px")
plot(eletric.f_p1 ~ eletric.f_p2, type = "l", ylab = "Global Active Power (kilowatts)")
dev.off()
