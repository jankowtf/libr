context("package")

test_that("ensureLatestPackageVersions", {

  if (basename(getwd()) == "testthat") {
    repos <- "repos/global"
  } else {
    repos <- "tests/testthat/repos/global"
  }
  
  lib <- R.home("library")
  
  expect_error(ensureLatestPackageVersions())
  expect_false(res <- ensureLatestPackageVersions(repos = repos))
  
  }
)

