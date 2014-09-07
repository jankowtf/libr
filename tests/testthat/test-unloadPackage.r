context("package")

test_that("unloadPackage", {
  
  expect_is(res <- unloadPackage(), "NULL")
  expect_equal("package:rapp.core.library" %in% search(), FALSE)
  devtools::load_all(".")
  
  pkg <- "rapp.core.condition"
  require(pkg, character.only = TRUE)
  expect_is(res <- unloadPackage(pkg = pkg), "NULL")
  expect_equal(paste0("package:", pkg) %in% search(), FALSE)
  
  expect_error(unloadPackage(pkg = tempdir()))
  expect_error(unloadPackage(pkg = "nonexistingpackage"))
  
})
