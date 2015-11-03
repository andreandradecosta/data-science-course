source("pollutantmean.R")

test_that("pollutantmean.R", {
    expect_that(pollutantmean("specdata", "sulfate", 1:10), equals(4.064, tolerance = 0.001))
    expect_that(pollutantmean("specdata", "nitrate", 70:72), equals(1.706, tolerance = 0.001))
    expect_that(pollutantmean("specdata", "nitrate", 23), equals(1.281, tolerance = 0.001))
})