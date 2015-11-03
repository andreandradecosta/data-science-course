source("colForOutcome.R")
source("readOutcomeData.R")

best <- function(state, outcome) {
    col <- colForOutcome(outcome)
    if (col == 0) {
      stop("invalid outcome")
    }
    outcomeData <- readOutcomeData(state)
    if (nrow(outcomeData) == 0) {
        stop("invalid state")
    }
    outcomeData[, col] <- as.numeric(outcomeData[,col])
    outcomeData <- outcomeData[is.na(outcomeData[,col]) == F,]
    minVal <- min(outcomeData[,col], na.rm = T)
    sort(outcomeData[outcomeData[,col] == minVal, ]$Hospital.Name)[1]
}