source("pos.R")

test_that("pos", {
  expect_that(pos(1:4, "best"), equals(1))
  expect_that(pos(1:4, "worst"), equals(4))
  expect_that(pos(1:4, 3), equals(3))
})

