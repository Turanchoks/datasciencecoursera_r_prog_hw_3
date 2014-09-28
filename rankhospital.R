source('getOutcome.R')

rankhospital <- function(state, outcome, num = "best") {

    outcome <- getOutcome(outcome)
    if (is.null(outcome)) stop("invalid outcome")
    
    data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
    data <- subset(data[c("Hospital.Name", "State", outcome)], State == state  & data[outcome] != "Not Available")
    
    data[, 3] <- as.numeric(data[, 3])
    
    if( ! state %in% data$State) stop("invalid state")
    
    data <- data[order(data[outcome], data["Hospital.Name"]),]
    
    data <- cbind(data, Rank = 1:nrow(data))
    
    if( num == "best" )
        return(data[[1, 'Hospital.Name']])
    else if( num == "worst" )
        return(data[[nrow(data), 'Hospital.Name']])
    else if ( num > nrow(data) )
        return(NA)
    else if ( is.integer(num) || is.numeric(num) )
        return(data[[as.integer(num), 'Hospital.Name']])
    else
        stop('Num must be an integer!')
}