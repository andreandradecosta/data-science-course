source("best.R")

test_that("best.R", {
    
    expect_that(best("TX", "heart attack"), equals("CYPRESS FAIRBANKS MEDICAL CENTER"))
    expect_that(best("BB", "heart attak"), throws_error("invalid state"))
})