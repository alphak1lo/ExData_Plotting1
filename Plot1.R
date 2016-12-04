#set wd, to be folder containing the txt file, and load packages
setwd("~/Personal/Coursera/4. Exploratory data analysis")
install.packages("data.table"); library(data.table);

#load the data into R
df <- read.table("household_power_consumption.txt", header = TRUE,
                 sep = ";")

#column manipulations
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Global_active_power <- as.numeric(df$Global_active_power)

#subset: two day period, between 2007-02-01 and 2007-02-02
df <- df[df$Date >= "2007-02-01" & df$Date <="2007-02-02",]

#output
png("Plot1.png", width = 480, height = 480, units = "px")
hist(df$Global_active_power, col="red",
     xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()
