source('getOutcome.R')

rankall <- function(outcome, num = "best") {
    outcome <- getOutcome(outcome)
    if (is.null(outcome)) stop("invalid outcome")
    
    data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    data <- data[c("Hospital.Name", "State", outcome)]
    
    data[, 3] <- as.numeric(data[, 3])
    
    output <- data.frame(hospital = character(), state = character())
    
    lapply(split(data, data$State), function(state_list) {
        state_list <- state_list[order(state_list[outcome], state_list["Hospital.Name"]),]
        
        if( num == "best" )
            num <- 1
        else if( num == "worst" ) {
            num <- nrow(state_list)
        }
                
        output <<- rbind(output, data.frame(hospital = state_list[num, 'Hospital.Name'], state = state_list[1, 'State']) )
    })
        
    output
}