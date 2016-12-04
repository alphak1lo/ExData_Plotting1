#set wd, to be folder containing the txt file, and load packages
setwd("~/Personal/Coursera/4. Exploratory data analysis")
install.packages("data.table"); library(data.table);

#load the data into R
df <- read.table("household_power_consumption.txt", header = TRUE,
                 sep = ";")

#column manipulations
df$Date <- as.Date(df$Date, "%d/%m/%Y")
df$Time <- times(format(df$Time, format="%H:%M:%S"))

#subset: two day period, between 2007-02-01 and 2007-02-02
df <- df[df$Date >= "2007-02-01" & df$Date <="2007-02-02",]

#create new datetime column
df$datetime <- with(df, as.POSIXct(paste(Date, Time), format="%Y-%m-%d %H:%M:%S"))

#output
png("Plot2.png", width = 480, height = 480, units = "px")
plot(df$datetime, df$Global_active_power, type="l",
     xlab="",
     ylab="Global Active Power (kilowatts)"
)
dev.off()