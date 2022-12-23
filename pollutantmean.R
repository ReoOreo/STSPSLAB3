pollutantmean <- function(directory, pollutant, id = 1:332) {
  pollutantmeans <- c()
  
  for(monitor in id){
    
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
    
    monitor_data <- read.csv(path)
    
    interested_data <- monitor_data[pollutant]
    
    pollutantmeans <- c(pollutantmeans, interested_data[!is.na(interested_data)])
  }
  
  mean(pollutantmeans)
}



