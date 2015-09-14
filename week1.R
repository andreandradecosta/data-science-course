readDataset <- function() {
    read.csv("hw1_data.csv")
}


q11 <- function() {
    d <- readDataset()
    names(d)
}

q12 <- function() {
    d <- readDataset()
    # head(d, 2)
    d[1:2,]
}

q13 <- function() {
    d <- readDataset()
    # str(d)
    nrow(d)
}

q14 <- function() {
    d <- readDataset()
    tail(d, 2)
}

q15 <- function() {
    d <- readDataset()
    d[[c(1,47)]]
}

q16 <- function() {
    d <- readDataset()
    length(d[is.na(d[, 1]), 1])
}

q17 <- function() {
    d <- readDataset()
    mean(d[!is.na(d[,1]), 1])
}

q18 <- function() {
    d <- readDataset()
    s.r <- d[d$Temp > 90 & d$Oz > 31, ]$Solar.R
    mean(s.r[!is.na(s.r)])
}

q19 <- function() {
    d <- readDataset()
    mean(d[d$Month == 6, ]$Temp)
}

q20 <- function() {
    d <- readDataset()
    max(d[d$Month == 5, ]$Ozone, na.rm = TRUE)
}
