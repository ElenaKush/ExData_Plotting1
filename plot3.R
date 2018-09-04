## Setting working directory
getwd()
setwd("./GitHub/JH_R_Course/Course4/Week1")

## Unzipping files
unzip("power_consumption.zip", list = TRUE) ## Checking the list of files inside
unzip("power_consumption.zip")

## Reading a txt file
setAs("character","myDate", function(from) as.Date(from, format="%d/%m/%Y")) ## Changing a Data format
classes <- c("myDate", rep(NA, 8)) ## Setting classes to columns
df <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?", colClasses = classes)
df <- df[(df$Date == "2007-02-01"|df$Date == "2007-02-02"), ] ## Subsetting dataset

str(df1) ## Looking at the dataset

## Preparing dataset
library(dplyr) 
df1 <- df %>% 
  mutate(DateAndTime = as.POSIXct(paste(Date, Time, sep = " "))) %>% ## adding new variable
  select(10, 1:9) ## Changing order of columns

## Plotting (Plot3)
with(df1, plot(DateAndTime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
with(df1, lines(DateAndTime, Sub_metering_2, type = "l", col = "red"))
with(df1, lines(DateAndTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lwd = 1)


## Saving into .png
dev.copy(png, file = "./ExData_Plotting1/plot3.png")
dev.off()
