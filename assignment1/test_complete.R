source("complete.R")

test_that("complete.R", {
    exp <- data.frame(id = c(1), nobs = c(117))
    expect_that(complete("specdata", 1), equals(exp))
    
    exp <- data.frame(id = c(2, 4, 8, 10, 12), nobs = c(1041, 474, 192, 148, 96))
    expect_that(complete("specdata", c(2, 4, 8, 10, 12)), equals(exp))
    
    exp <- data.frame(id = c(30, 29, 28, 27, 26, 25), nobs = c(932, 711, 475, 338, 586, 463))
    expect_that(complete("specdata", 30:25), equals(exp))
    
    exp <- data.frame(id = c(3), nobs = c(243))
    expect_that(complete("specdata", 3), equals(exp))
})