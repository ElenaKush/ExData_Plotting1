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

str(df) ## Looking at the dataset

## Plotting (Plot1)
with(df, hist(Global_active_power, col = "red", main = "Global Active Power", 
              xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))

## Saving into .png
dev.copy(png, file = "./ExData_Plotting1/plot1.png")
dev.off()
