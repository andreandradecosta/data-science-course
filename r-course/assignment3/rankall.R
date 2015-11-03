source("colForOutcome.R")
source("pos.R")

rankall <- function(outcome, num = "best") {
    col <- colForOutcome(outcome)
    if (col == 0) {
        stop("invalid outcome")
    }
    outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    outcomeData[, col] <- as.numeric(outcomeData[,col])
    outcomeData <- outcomeData[is.na(outcomeData[,col]) == F,]
    byState <- split(outcomeData, outcomeData$State)
    result <- lapply(byState, function(x) pos(x[order(x[, col], x[, 2]),]$Hospital.Name, num))
    states <- character()
    hospitals <- character()
    for (state in names(result)) {
        states <- append(states, state)
        hospitals <- append(hospitals, result[[state]])
    }
    
    data.frame(hospital = hospitals, state = states)
}