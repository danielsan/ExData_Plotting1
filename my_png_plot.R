my_png_plot <- function(png_name, func) {
  png(paste(png_name, '.png', sep=''), width=480, height=480)
  func()
  dev.off()
}