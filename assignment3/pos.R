pos <- function(data, num) {
    if (num == "best") {
        num = 1
    }
    if (num == "worst") {
        num = length(data)
    }
    data[num]
}