library(readr)
library(dplyr)

## Read
power_df <- read_delim("household_power_consumption.txt", ";", escape_double = FALSE, na = "?", trim_ws = TRUE)

## Mutate
power_asdate_df <- mutate(power_df, Date = as.Date(Date, "%d/%m/%Y"))

## Filter
power_filtered_df <- filter(power_asdate_df, Date >= "2007-02-01", Date <= "2007-02-02")

## Graph
with(power_filtered_df, hist(Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red"))

## Print
dev.print(device = png, filename = "plot1.png", width = 480, height = 480)
