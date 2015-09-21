colForOutcome <- function(outcome) {
  col <- 0
  if (outcome == "heart attack") {
    col <- 11
  } else if (outcome == "heart failure") {
    col <- 17
  } else if (outcome == "pneumonia") {
    col <- 23
  } 
  col
}