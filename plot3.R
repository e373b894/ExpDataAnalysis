## plot 3
## use sql function to only load for desired dates
## library(sqldf)
proj1 <- read.csv.sql("household_power_consumption.txt", "select * from file where Date in ('1/2/2007', '2/2/2007')", sep=";")

## convert chr to date and time, pasting, using R functions
## 
date_time <- paste(proj1$Date, proj1$Time)
proj2 <- cbind(date_time, proj1)

i <- sapply(proj2, is.factor)
proj2[i] <- lapply(proj2[i], as.character)

proj2$date_time <- strptime(proj2$date_time, format = "%d/%m/%Y %H:%M:%S")

## plot
yrange<-range(c(proj2$Sub_metering_1,proj2$Sub_metering_2,proj2$Sub_metering_3))
with(proj2, plot(date_time,Sub_metering_1, type = "l", xlab="", ylab="Energy Sub Metering", col="blue",ylim=yrange))
lines(proj2$date_time, proj2$Sub_metering_2, col="red")
lines(proj2$date_time, proj2$Sub_metering_3, col="green")
legend(locator(1),pch = "-", col = c("blue", "red", "green"), legend = c("Sub_metering_1    ", "Sub_metering_2    ", "Sub_metering_3    "), cex=0.5, bty="Y")

## copy it
dev.copy(png, file="plot3.png")
dev.off()