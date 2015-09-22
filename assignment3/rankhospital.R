source("colForOutcome.R")
source("readOutcomeData.R")
source("pos.R")


rankhospital <- function(state, outcome, num = "best") {
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
  pos(outcomeData[order(outcomeData[,col], outcomeData$Hospital.Name),]$Hospital.Name, num)
}