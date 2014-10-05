context("isPackageLoaded-A")

test_that("isPackageLoaded", {
  
  expect_true(isPackageLoaded())
  libr::unloadPackage("devtools")
  expect_false(isPackageLoaded(pkg = "devtools"))
  require("devtools")
  expect_true(isPackageLoaded(pkg = "devtools"))
  libr::unloadPackage("devtools")
  expect_false(isPackageLoaded(pkg = "devtools"))
  
  expect_error(isPackageLoaded(pkg = tempdir()))
  expect_error(isPackageLoaded(pkg = "nonexistingpackage"))
  
})
