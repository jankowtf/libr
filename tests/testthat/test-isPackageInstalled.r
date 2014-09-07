context("package")

test_that("isPackageInstalled", {

  pkg <- "devtools"
  lib <- .libPaths()
  
  expected <- TRUE
  expect_equal(res <- isPackageInstalled(
    pkg = pkg,
    lib = lib
  ), expected)
  
  expected <- TRUE
  expect_equal(res <- isPackageInstalled(
    pkg = pkg
  ), expected)
  
  expected <- TRUE
  names(expected) <- lib
  expect_equal(res <- isPackageInstalled(
    pkg = pkg,
    lib = lib,
    simplified = FALSE
  ), expected)

  }
)

