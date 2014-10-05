context("asPackage-A")

test_that("asPackage", {
  
  expect_is(res <- asPackage(), "package")
  expect_is(res <- asPackage(x = "base"), "package")
  
  expect_error(asPackage(x = "nonexistingpackage"))
  
})
