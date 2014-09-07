context("package")

test_that("isPackageLibrary", {

  expect_true(isPackageLibrary(lib = R.home("library")))
  expect_false(isPackageLibrary(lib = tempdir()))
  expect_false(isPackageLibrary(lib = "nonexistingdirectory"))
  expect_error(isPackageLibrary(lib = "nonexistingdirectory", strict = TRUE))
  expect_false(isPackageLibrary(lib = "DESCRIPTION"))
  expect_error(isPackageLibrary(lib = "DESCRIPTION", strict = TRUE))
  
  }
)

