complete <- function(directory, id = 1:332) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'id' is an integer vector indicating the monitor ID numbers
    ## to be used
    
    ## Return a data frame of the form:
    ## id nobs
    ## 1  117
    ## 2  1041
    ## ...
    ## where 'id' is the monitor ID number and 'nobs' is the
    ## number of complete cases
    
    source("readCSVid.R")
    
    ids = numeric(length(id))
    nobs = numeric(length(id))
    
    for (i in seq_along(id)) {
        monitor <- id[i]
        file <- readCSVid(directory, monitor)
        ids[i] <- monitor
        nobs[i] <- nrow(file[complete.cases(file),])
    }
    data.frame(id = ids, nobs = nobs)
}