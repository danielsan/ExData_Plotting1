filter_file <- function (bigfile, smallerfile, my_sep = ";", min_date = as.Date("2007-02-01"), max_date = as.Date("2007-02-02")) {
  file.in  <- file(bigfile, 'rt')
  file.out <- file(smallerfile, 'wt')
  line     <- readLines(file.in, n=1)
  line.split <- strsplit(line, my_sep)
  # Stitching together only the columns we want
  cat(line.split[[1]][1:5], line.split[[1]][8], sep = my_sep, file = file.out, fill = TRUE)
  ## Use a loop to read in the rest of the lines
  
  #min_date <- as.Date("2007-02-01")
  #max_date <- as.Date("2007-02-02")
  
  started <- valid <- F
  
  while (length(line <- readLines(file.in, n=1))) {
    line.split <- strsplit(line, my_sep)
    # check if there is more than one column
    if (length(line.split[[1]]) > 1) {
      date_column <-as.Date(line.split[[1]][1], "%d/%m/%Y")
      if (min_date <= date_column && date_column <= max_date) {
        cat(line.split[[1]], sep = ';', file = file.out, fill = TRUE)
        valid <- started <- T
      }

      #stop reading after started and invalid
      if (started) {
        if(valid <- !valid) break;
      }
    }
  }
  
  close(file.in)
  close(file.out)
  smallerfile
}
