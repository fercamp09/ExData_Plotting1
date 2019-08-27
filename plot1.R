library(dplyr)
## Read data
power <- read.csv("../data/household_power_consumption.txt", na.strings = "?", sep = ";")          
x <- paste(power$Date, power$Time)                                                             ## Paste both columms into one 
dates <- strptime(x, "%d/%m/%Y %H:%M:%S")                                                      ## Convert characters to date and time
power$time <- as.Date(dates)                                                                   ## Convert date/time to Posx (time)
filtered <- power %>% filter( time >= as.Date("2007-02-01") & time <= as.Date("2007-02-02") )  ## Filter data for 2 days of february 2007
head(filtered)                                                                                 ## Show sneakpeek of data
## Plot histogram
par(mfcol = c(1,1))
hist(filtered$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", main = "Global Active Power")
dev.copy(png, file="plot1.png")
dev.off()