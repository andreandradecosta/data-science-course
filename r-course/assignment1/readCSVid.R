readCSVid <- function(directory, id) {
    ## id -> csv index
    ## return data.frame
    file.name <- paste(directory, sprintf("%03d.csv", id), sep = "/")
    read.csv(file.name, header = T, colClasses = c("Date", "numeric", "numeric", "integer"))
}