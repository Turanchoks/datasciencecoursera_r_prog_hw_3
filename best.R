best <- function(state, outcome) {
    
	 outcome <- switch(outcome,
                    "heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                    "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                    "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")
     
     if (is.null(outcome)) stop("invalid outcome")
     
	 data <- read.csv("rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv", colClasses = "character")
     data <- subset(data[c("Hospital.Name", "State", outcome)], State == state  & data[outcome] != "Not Available")
	 data[, 3] <- as.numeric(data[, 3])
     
     if( ! state %in% data$State) stop("invalid state")

     data[order(data[outcome], data["Hospital.Name"]),][[1, 'Hospital.Name']]
}
