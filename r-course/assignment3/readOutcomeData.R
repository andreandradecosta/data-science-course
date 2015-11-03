readOutcomeData <- function(state) {
  outcomeData <- read.csv("outcome-of-care-measures.csv", colClasses = "character")
  outcomeData[outcomeData$State == state, ]
}