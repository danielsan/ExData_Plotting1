source('get_data.R')
source('my_png_plot.R')

my_png_plot('plot1', function() hist(
  get_data()$Global_active_power,
  col  = 'red',
  xlab = 'Global Active Power (kilowatts)',
  main = 'Global Active Power'))

