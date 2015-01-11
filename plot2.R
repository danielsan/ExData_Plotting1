source('get_data.R')
source('my_png_plot.R')
data <- get_data()
data$DateTime <- strptime(paste(data$Date, data$Time), format = '%d/%m/%Y %H:%M:%S')

my_png_plot('plot2', function() plot(data$DateTime, data$Global_active_power, type='l', ylab = 'Global Active Power (kilowatts)', xlab = ''))
