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

## Plotting (Plot2)
with(df1, plot(DateAndTime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))


## Saving into .png
dev.copy(png, file = "./ExData_Plotting1/plot2.png")
dev.off()
