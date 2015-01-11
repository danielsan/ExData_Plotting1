source('get_data.R')
source('my_png_plot.R')

# load libraries
library(data.table)
#library(lubridate)

my_png_plot('plot4', function() {
  alldata = get_data()
  
  # tidy up data
  cols <- c('Date','Time','GlobalActivePower','GlobalReactivePower','Voltage','GlobalIntensity','SubMetering1','SubMetering2','SubMetering3')
  colnames(alldata) <- cols
  #data$DateTime <- dmy(data$Date) + hms(data$Time)
  alldata$DateTime <- strptime(paste(alldata$Date, alldata$Time), '%d/%m/%Y %H:%M:%S')
  data <- alldata[ , c(10,3:9)]

  # Generating 4 quardrant
  par(mfrow=c(2,2))
  
  # Generate top left quardrant
  plot(data$DateTime,data$GlobalActivePower, ylab='Global Active Power', xlab='', type='l')
  
  # Generate top right quardrant
  plot(data$DateTime,data$Voltage, type = 'l', xlab = 'datetime', ylab = 'Voltage')
  
  # Generate bottom left quardrant
  colors <- c('black','red','blue')
  plot( data$DateTime, data$SubMetering1, col = colors[1],type='l',xlab='',ylab='Energy sub metering')
  lines(data$DateTime, data$SubMetering2, col = colors[2])
  lines(data$DateTime, data$SubMetering3, col = colors[3])
  legend('topright', col = colors, bty='n', lty = 'solid', legend = c('Sub_metering_1','Sub_metering_2','Sub_metering_3'))
  
  # Generate bottom right quardrant
  plot(data$DateTime,data$GlobalReactivePower,xlab='datetime',ylab='Global_reactive_power',type='l')
})


