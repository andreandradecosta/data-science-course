corr <- function(directory, threshold = 0) {
    ## 'directory' is a character vector of length 1 indicating
    ## the location of the CSV files
    
    ## 'threshold' is a numeric vector of length 1 indicating the
    ## number of completely observed observations (on all
    ## variables) required to compute the correlation between
    ## nitrate and sulfate; the default is 0
    
    ## Return a numeric vector of correlations
    ## NOTE: Do not round the result!
    
    source("complete.R")
    source("readCSVid.R")
    
    comp.dataFrame <- complete(directory)
    ids <- comp.dataFrame[comp.dataFrame$nobs > threshold,]$id
    corrs <- numeric(length(ids))
    
    for (i in seq_along(ids)) {
        file <- readCSVid(directory, ids[i])
        corrs[i] <- cor(file$sulfate, file$nitrate, use = "complete.obs")
    }
    corrs
}