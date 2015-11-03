source("rankall.R")


test_that("rankall.R", {
    
    expect_that(rankall("hert attack"), throws_error("invalid outcome"))
    expect_is(rankall("heart attack"), "data.frame")
    
    expected <- data.frame(
        hospital = c(
            NA, 
            "D W MCMILLAN MEMORIAL HOSPITAL", 
            "ARKANSAS METHODIST MEDICAL CENTER", 
            "JOHN C LINCOLN DEER VALLEY HOSPITAL", 
            "SHERMAN OAKS HOSPITAL", 
            "SKY RIDGE MEDICAL CENTER", 
            "MIDSTATE MEDICAL CENTER", 
            NA, 
            NA, 
            "SOUTH FLORIDA BAPTIST HOSPITAL"),
        state = c(
            "AK",
            "AL",
            "AR",
            "AZ",
            "CA",
            "CO",
            "CT",
            "DC",
            "DE",
            "FL"
        ))
    expect_that(head(rankall("heart attack", 20), 10), is_equivalent_to(expected))
    
    expected <- data.frame(
        hospital = c(
            "MAYO CLINIC HEALTH SYSTEM - NORTHLAND, INC", 
            "PLATEAU MEDICAL CENTER", 
            "NORTH BIG HORN HOSPITAL DISTRICT"),
        state = c(
            "WI",
            "WV",
            "WY"))
    expect_that(tail(rankall("pneumonia", "worst"), 3), is_equivalent_to(expected))
    
    
    expected <- data.frame(
        hospital = c(
            "WELLMONT HAWKINS COUNTY MEMORIAL HOSPITAL", 
            "FORT DUNCAN MEDICAL CENTER", 
            "VA SALT LAKE CITY HEALTHCARE - GEORGE E. WAHLEN VA MEDICAL CENTER",
            "SENTARA POTOMAC HOSPITAL",
            "GOV JUAN F LUIS HOSPITAL & MEDICAL CTR",
            "SPRINGFIELD HOSPITAL",
            "HARBORVIEW MEDICAL CENTER",
            "AURORA ST LUKES MEDICAL CENTER",
            "FAIRMONT GENERAL HOSPITAL",
            "CHEYENNE VA MEDICAL CENTER"),
        state = c(
            "TN",
            "TX",
            "UT",
            "VA",
            "VI",
            "VT",
            "WA",
            "WI",
            "WV",
            "WY"))
    expect_that(tail(rankall("heart failure"), 10), is_equivalent_to(expected))
    
})

