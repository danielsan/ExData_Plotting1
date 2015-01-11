source('get_data.R')
source('my_png_plot.R')

my_png_plot('plot3', function() {
  data = get_data()
  data$Date <- strptime(paste(data$Date,data$Time), '%d/%m/%Y %H:%M:%S')
  plot( data$Date, data$Sub_metering_1, type='l', xlab='',  ylab='Energy sub metering')
  lines(data$Date, data$Sub_metering_2, type='l', col='red')
  lines(data$Date, data$Sub_metering_3, type='l', col='blue')
  legend('topright', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'),
                     lty    = 1,
                     col    = c('black','red','blue'))
})


