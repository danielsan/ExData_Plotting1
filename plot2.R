source('get_data.R')
source('my_png_plot.R')
data <- get_data()
data <- strptime(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")

my_png_plot('plot2', function() plot(data,Data$Global_active_power, xlab="", ylab="Global Active Power (kilowatts)", type="l"))