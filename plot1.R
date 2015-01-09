# plot1.R
url <- "http://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
f <- file.path(getwd(), "data_file.zip")
download.file(url, f)
unzip(data_file.zip)
library(dplyr)
df <- read.csv("household_power_consumption.txt", sep = ";" ,stringsAsFactors = FALSE)
data <- tbl_df(df)
rm(df)
plotdata <- filter(data, as.Date(data$Date, "%d/%m/%Y") == "2007-02-01" | as.Date(data$Date,"%d/%m/%Y") == "2007-02-02")
rm(data)
hist(as.numeric(plotdata$Global_active_power), col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.copy(png, "plot1.png")
dev.off()
