source("readCSVid.R")

test_that("readCSVid.R", {
    
    dataframe <- readCSVid("specdata", 1)
    
    expect_that(dataframe, is_a("data.frame"))
    expect_that(names(dataframe), equals(c ("Date", "sulfate", "nitrate", "ID")))
})