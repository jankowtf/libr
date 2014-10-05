context("unloadPackage-A")

test_that("unloadPackage", {
  
  if (basename(getwd()) == "testthat") {
    path_pkg <- "data/test.package"
  } else {
    path_pkg <- "tests/testthat/data/test.package"
  }
  
  if (!file.exists(path_pkg)) {
    package.skeleton(name = "test.package", path = dirname(path_pkg))
  }
  
  wd_0 <- setwd(path_pkg)
  devtools::load_all()
  expect_true("test.package" %in% loadedNamespaces())
  expect_is(res <- unloadPackage(), "NULL")
  expect_false("test.package" %in% loadedNamespaces())
  
  devtools::load_all()
  expect_is(res <- unloadPackage(pkg = "test.package"), "NULL")
  expect_false("test.package" %in% loadedNamespaces())
  
  ## Condition handling //
  expect_error(unloadPackage(pkg = tempdir()))
  expect_error(unloadPackage(pkg = "nonexistingpackage"))
  
  setwd(wd_0)
  on.exit(setwd(wd_0))
  
})
