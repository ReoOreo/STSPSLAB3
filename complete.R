complete <- function(directory, id = 1:332){
  
  results <- data.frame(id=numeric(0), nobs=numeric(0))
  for(monitor in id){
    
    path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
    
    monitordata <- read.csv(path)
    
    interdata <- monitordata[(!is.na(monitordata$sulfate)), ]
    
    interdata <- interdata[(!is.na(interdata$nitrate)), ]
    
    nobs <- nrow(interdata)
    
    results <- rbind(results, data.frame(id=monitor, nobs=nobs))
  }
  results
}


