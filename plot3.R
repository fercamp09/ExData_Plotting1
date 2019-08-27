library(dplyr)
## Read data
power <- read.csv("../data/household_power_consumption.txt", na.strings = "?", sep = ";")          
x <- paste(power$Date, power$Time)                                                             ## Paste both columms into one 
dates <- strptime(x, "%d/%m/%Y %H:%M:%S")                                                      ## Convert characters to date and time
power$time <- as.Date(dates)                                                                   ## Convert date/time to Posx (time)
power$posix <- as.POSIXct(dates)                                                               ## Convert date/time to Posx (time)
filtered <- power %>% filter( time >= as.Date("2007-02-01") & time <= as.Date("2007-02-02") )  ## Filter data for 2 days of february 2007
head(filtered)                                                                                 ## Show sneakpeek of data
## Plot histogram
par(mfcol = c(1,1))
plot(filtered$posix, filtered$Sub_metering_1, ylab="Energy sub metering", xlab = "", type = "l", col ="black")
# points(filtered$posix, filtered$Sub_metering_1, col ="black", type= "l")
points(filtered$posix, filtered$Sub_metering_2, col ="red", type="l")
points(filtered$posix, filtered$Sub_metering_3, col ="blue", type= "l")
legend("topright", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, text.width = strwidth("Sub_metering_1")*5/3 , y.intersp = 1.5)
dev.copy(png, file="plot3.png")
dev.off()