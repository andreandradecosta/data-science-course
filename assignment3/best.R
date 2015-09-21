best <- function(state, outcome) {
    outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
    col <- 0
    if (outcome == "heart attack") {
        col <- 11
    } else if (outcome == "heart failure") {
        col <- 17
    } else if (outcome == "pneumonia") {
        col <- 23
    } else {
        stop("invalid outcome")
    }
    outcomeData <- outcomeData[outcomeData$State == state, ]
    if (nrow(outcomeData) == 0) {
        stop("invalid state")
    }
    outcomeData[, col] <- as.numeric(outcomeData[,col])
    outcomeData <- outcomeData[is.na(outcomeData[,col]) == F,]
    minVal <- min(outcomeData[,col], na.rm = T)
    sort(outcomeData[outcomeData[,col] == minVal, ]$Hospital.Name)[1]
}