get_data <- function () {
  if(!require('sqldf')) {
    install.packages('sqldf')
    require('sqldf')
  }

  inner_data <- function() {
    if(!exists('get_data.data')) {
      query <- "SELECT * from file WHERE Date IN('1/2/2007', '2/2/2007')"
      get_data.data <<- read.csv.sql("./household_power_consumption.txt", sql = query, sep=";")
    }
    get_data.data
  }
  inner_data()
}
