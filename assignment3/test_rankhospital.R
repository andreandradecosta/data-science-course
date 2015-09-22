source("rankhospital.R")

test_that("rankhospital.R", {
  
    expect_that(rankhospital("BB", "heart attack"), throws_error("invalid state"))
    
    expect_that(rankhospital("TX", "heart failure", 4), equals("DETAR HOSPITAL NAVARRO"))
    expect_that(rankhospital("MD", "heart attack", "worst"), equals("HARFORD MEMORIAL HOSPITAL"))
    expect_true(is.na(rankhospital("MN", "heart attack", 5000)))
    
})

