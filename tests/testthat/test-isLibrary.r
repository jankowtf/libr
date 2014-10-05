context("package")

test_that("isLibrary", {

  expect_true(isLibrary(lib = R.home("library")))
  expect_false(isLibrary(lib = tempdir()))
  expect_false(isLibrary(lib = "nonexistingdirectory"))
  expect_error(isLibrary(lib = "nonexistingdirectory", strict = TRUE))
  expect_false(isLibrary(lib = "DESCRIPTION"))
  expect_error(isLibrary(lib = "DESCRIPTION", strict = TRUE))
  
  }
)

