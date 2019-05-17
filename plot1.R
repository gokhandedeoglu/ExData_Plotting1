library("data.table")

# Loading the electric power consumption data as reading the text file
epcDT <- data.table::fread(input = "data/household_power_consumption.txt", na.strings="?")
epcDT[, Global_active_power := lapply(.SD, as.numeric), .SDcols = c("Global_active_power")]
epcDT[, Date := lapply(.SD, as.Date, "%d/%m/%Y"), .SDcols = c("Date")]

# Filter Dates for 2007-02-01 and 2007-02-02
epcDT <- epcDT[(Date >= "2007-02-01") & (Date <= "2007-02-02")]

# Plotting the histogram
png("plot1.png", width=480, height=480)
hist(epcDT[, Global_active_power], main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()