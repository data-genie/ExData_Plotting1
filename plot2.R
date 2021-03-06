library(sqldf)
datapath <- "household_power_consumption.txt"
hpc <- read.csv.sql(datapath, sql= "select* from file where Date in ('1/2/2007', '2/2/2007')", header = TRUE, sep = ";")
hpc$Date <- as.Date(hpc$Date, format = "%d/%m/%Y")
hpc$DateTime <- strptime(paste(hpc$Date, hpc$Time), format = "%Y-%m-%d %H:%M:%S")
plot(x=(hpc$DateTime),y=hpc$Global_active_power,type="l",ylab="Global Active Power (kilowatts)",xlab="")
dev.copy(png, file="plot2.png", width=480, height=480)
dev.off()