library(readr)
library(dplyr)

## Read
power_df <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, na = "?", trim_ws = TRUE)

## Mutate
power_asdate_df <- mutate(power_df, Date = as.Date(Date, "%d/%m/%Y"))

## Filter
power_filtered_df <- filter(power_asdate_df, Date >= "2007-02-01", Date <= "2007-02-02")

## Mutate Time as POSIXct
power_filtered_datetime_df <- mutate(power_filtered_df, datetime = as.POSIXct(paste(Date, Time)))

## Graph
with(power_filtered_datetime_df, plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering"))
points(power_filtered_datetime_df$datetime, power_filtered_datetime_df$Sub_metering_2, type = "l", col = "red")
points(power_filtered_datetime_df$datetime, power_filtered_datetime_df$Sub_metering_3, type = "l", col = "blue")
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), y.intersp = 1)

## Print
dev.print(device = png, filename = "plot3.png", width = 480, height = 480)
