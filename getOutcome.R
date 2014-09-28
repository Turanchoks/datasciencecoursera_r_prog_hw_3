getOutcome <- function(outcome) {
    switch(outcome,
                  "heart attack" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Attack",
                  "heart failure" = "Hospital.30.Day.Death..Mortality..Rates.from.Heart.Failure",
                  "pneumonia" = "Hospital.30.Day.Death..Mortality..Rates.from.Pneumonia")    
}