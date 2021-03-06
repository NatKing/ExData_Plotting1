## This assignment uses the data from UC Irvine Machine Learning
## repository for machine learning datasets.
## In particular, we will be using the "Individual household
## electric power consumption Data Set"

## Dataset Electric Power Consumption

## Description: Measurements of electric power consumption in one
## household with a 1-min sampling rate over a period of almost
## 4 years. Different electric quantities and some sub-metering
## values are available.

## descriptions of 9 variables:
## Date: Date in format dd/mm/yyyy
## Time: Time in format hh:mm:ss
## Global_active_power: household global minute-averaged active power (kwh)
## Global_reactive_power: household global minute-averaged reactive power (kwh)
## Voltage: minute-averaged voltage(in volt)
## Global_intensity: household global minute-averaged current intensity (in ampere)
## Sub_metering_1: energy sub-metering No. 1 (in watt hr of active energy)
## .. it corresponds to the kitchen, mainly dishwasher, oven and microwave
## .. hot plates are not electric, but gas powered
## Sub_metering_2: energy sub-metering No. 2 (in watt hr of active energy)
## .. it corresponds to the laundry room, mainly washing machine, tumble-drier, 
## .. a refrigerator and a light
## Sub_metering_3: energy sub-metering No. 3 (in watt hr of active energy)
## .. it corresponds to the electric water heater and an air conditioner

## Loading the data:

## dataset has 2 million rows and 9 columns. Check if there is enough
## memory in the computer before reading into R

## We are only interested in data from dates 2007-02-01 and 2007-02-02
## An alternative is to read the data from just those dates instead
## of dating the whole thing and subsetting to those dates

## Useful to convert Date and Time variables to Date/Time classes in R
## using strptime() and as.Date() functions

## Note: missing values are coded as ?

## Making Plots
## For each plot you should
## Construct the plot and save it to a PNG file with a width of 480 pixels and
## a height of 480 pixels.
## Name each of the plot files as plot1.png, plot2.png, etc.

## Plot1 is a histogram
Plot1 <- function() {
        ## assuming the text file has already been downloaded to my working directory.
        ## set separator to be ';' and na_strings to be "?"
        powerData <- read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
        
        ## first convert date from character/factor to the Date format 
        powerData$Date <- as.Date(powerData$Date, "%d/%m/%Y")
        
        ## subset to the dates we are interested in
        good <- with(powerData, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
        powerData2 <- powerData[good,]

        ## open png file with given width and height in pixels
        png(filename = "plot1.png", width = 480, height = 480,
            units = "px", pointsize = 12, bg = "white", res = NA,
            restoreConsole = TRUE)
        
        ## draw the historgram setting the number of breaks needed, in red color
        ## and set title and x-label
        hist(powerData2$Global_active_power,breaks=16, col="red",freq=TRUE,
             main = "Global Active Power", xlab="Global Active Power (kilowatts)")
        dev.off()
}