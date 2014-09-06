## plot 1
## use sql function to only load for desired dates
##library(sqldf)
proj1 <- read.csv.sql("household_power_consumption.txt",
"select * from file where Date in ('1/2/2007', '2/2/2007')",
sep=";")

with(proj1, hist(Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", col="red"))

dev.copy(png, file="plot1.png")
dev.off()