library(readr)

## Read
power_df <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, na = "?", trim_ws = TRUE)

## Mutate
power_asdate_df <- mutate(power_df, Date = as.Date(Date, "%d/%m/%Y"))

## Filter
power_filtered_df <- filter(power_asdate_df, Date >= "2007-02-01", Date <= "2007-02-02")

## Mutate Time as POSIXct
power_filtered_datetime_df <- mutate(power_filtered_df, datetime = as.POSIXct(paste(Date, Time)))

## Graph
with(power_filtered_datetime_df, plot(datetime, Global_active_power, type = "l", xlab = "", ylab = "Global Active Power (kilowatts)"))

## Print
dev.print(device = png, filename = "plot2.png", width = 480, height = 480)