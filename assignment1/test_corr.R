source("corr.R")


test_that("corr.R", {
    cr <- corr("specdata", 150)
    summ <- summary(cr)
    expect_that(head(cr), equals(c(-0.01896, -0.14051, -0.04390, -0.06816, -0.12351, -0.07589), tolerance = 0.1))
    expect_that(summ[["Min."]], equals(-0.211, tolerance = 0.01)) 
    expect_that(summ[["1st Qu."]], equals(-0.0500, tolerance = 0.01)) 
    expect_that(summ[["Median"]], equals(0.0946, tolerance = 0.01)) 
    expect_that(summ[["Mean"]], equals(0.1250, tolerance = 0.01)) 
    expect_that(summ[["3rd Qu."]], equals(0.2680, tolerance = 0.01)) 
    expect_that(summ[["Max."]], equals(0.7630, tolerance = 0.01))
    
    
    cr <- corr("specdata", 400)
    summ <- summary(cr)
    expect_that(head(cr), equals(c(-0.01896, -0.04390, -0.06816, -0.07589,  0.76313, -0.15783), tolerance = 0.1))
    expect_that(summ[["Min."]], equals(-0.1760, tolerance = 0.01)) 
    expect_that(summ[["1st Qu."]], equals(-0.0311, tolerance = 0.01)) 
    expect_that(summ[["Median"]], equals(0.1, tolerance = 0.01)) 
    expect_that(summ[["Mean"]], equals(0.14, tolerance = 0.01)) 
    expect_that(summ[["3rd Qu."]], equals(0.268, tolerance = 0.01)) 
    expect_that(summ[["Max."]], equals(0.763, tolerance = 0.01))
    
    cr <- corr("specdata", 5000)
    summ <- summary(cr)
    expect_that(length(cr), equals(0))
    
    cr <- corr("specdata")
    summ <- summary(cr)
    expect_that(length(cr), equals(323))
    expect_that(summ[["Min."]], equals(-1.0, tolerance = 0.01)) 
    expect_that(summ[["1st Qu."]], equals(-0.0528, tolerance = 0.01)) 
    expect_that(summ[["Median"]], equals(0.107, tolerance = 0.01)) 
    expect_that(summ[["Mean"]], equals(0.137, tolerance = 0.01)) 
    expect_that(summ[["3rd Qu."]], equals(0.278, tolerance = 0.01)) 
    expect_that(summ[["Max."]], equals(1.0, tolerance = 0.01))
})