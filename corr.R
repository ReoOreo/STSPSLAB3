corr <- function(directory, threshold = 0){
  
  corresults <- numeric(0)
  
  complete_cases <- complete(directory)
  
  complete_cases <- complete_cases[complete_cases$nobs>=threshold, ]
  
  if(nrow(complete_cases)>0){
    
    for(monitor in complete_cases$id){
      
      path <- paste(getwd(), "/", directory, "/", sprintf("%03d", monitor), ".csv", sep = "")
      monitordata <- read.csv(path)
    
      interesteddata <- monitordata[(!is.na(monitordata$sulfate)), ]
      
      interesteddata <- interesteddata[(!is.na(interesteddata$nitrate)), ]
      
      sulfatedata <- interesteddata["sulfate"]
      
      nitratedata <- interesteddata["nitrate"]
      
      corresults <- c(corresults, cor(sulfatedata, nitratedata))
    }
  }
  corresults
}

