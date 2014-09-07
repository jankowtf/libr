require("testthat")
test_that(desc="test_compressPackageLibrary", code = {
  
  ## Private function //
  .openDirectory <- function(dir = getwd()){
    if (.Platform['OS.type'] == "windows"){
      shell.exec(dir)
    } else {
      system(paste(Sys.getenv("R_BROWSER"), dir))
    }
  }
  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  to_0 <- file.path(tempdir(), "backup")
  if (basename(getwd()) == "testthat") {
    lib <- "library"
  } else {
    lib <- "tests/testthat/library"
  }
  
  ##----------------------------------------------------------------------------
  ## lib: character
  ## to: character
  ##----------------------------------------------------------------------------
  
  to <- to_0
  dir.create(to, showWarnings=FALSE, recursive=TRUE)
  #        .openDirectory(to) 
  fpath_to <- file.path(to, paste0(basename(lib), ".zip"))
  
  expect_is(
    res <- compressPackageLibrary(lib = lib, to = to),
    "character"
  )
  expect_equal(res, normalizePath(fpath_to, winslash = "/"))
  expect_true(file.exists(fpath_to))
  expect_is(time.1 <- file.info(fpath_to)$mtime, "POSIXct")
  Sys.sleep(time = 2)
  expect_is(
    res <- compressPackageLibrary(lib = lib, to = to, overwrite = TRUE),
    "character"
  )
  expect_equal(res, normalizePath(fpath_to, winslash = "/"))
  expect_is(time.2 <- file.info(fpath_to)$mtime, "POSIXct")
  expect_true(time.1 < time.2)
  
  expect_equal(
    res <- unlink(fpath_to, force=TRUE),
    as.integer(0)
  )
  
  ## With timestamp
  expect_is(
    res <- compressPackageLibrary(lib = lib, to = to, add_timestamp = TRUE),
    "character"
  )
  expect_true(grepl("library_\\d*", res))
  Sys.sleep(time = 2)
  expect_is(
    res <- compressPackageLibrary(lib = lib, to = to, add_timestamp = TRUE),
    "character"
  )
  expect_true(length(files_del <- list.files(to, full.names = TRUE)) == 2)
  sapply(files_del, unlink, force = TRUE)
  
  ## Condition handling //
  expect_error(compressPackageLibrary(lib = "nonexistingpath", to=to))
  expect_error(compressPackageLibrary(lib = lib, to = "nonexistingpath"))
  expect_error(compressPackageLibrary(lib = tempdir(), to = to))
  
  ## File path 'to' //
  to <- file.path(tempdir(), "backup/test.zip")
  expect_is(
    res <- compressPackageLibrary(lib = lib, to = to),
    "character"
  )
  expect_true(identical(res, normalizePath(to, winslash = "/", mustWork=FALSE)))
  sapply(list.files(dirname(to), full.names = TRUE), unlink, force = TRUE)
  
  expect_is(
    res <- compressPackageLibrary(lib = lib, to = to, add_timestamp = TRUE),
    "character"
  )
  expect_true(grepl(".*_\\d*", res))
  sapply(list.files(dirname(to), full.names = TRUE), unlink, force = TRUE)
  expect_error(compressPackageLibrary(lib=lib, to="nonexistingpath/test.zip"))
  
  to <- "test.zip"
  expect_is(
    res <- compressPackageLibrary(lib = lib, to = to),
    "character"
  )
  expect_equal(res, normalizePath(file.path(dirname(lib), to), winslash = "/"))
  unlink(res, force = TRUE)
  to <- "test.zip"
  expect_is(
    res <- compressPackageLibrary(lib = lib, to = to, add_timestamp = TRUE),
    "character"
  )
  unlink(res, force = TRUE)
  
  ##----------------------------------------------------------------------------
  ## lib: character
  ## to: missing
  ##----------------------------------------------------------------------------
  
  fpath_to <- file.path(dirname(lib), paste0(basename(lib), ".zip"))
  expect_is(
    res <- compressPackageLibrary(lib = lib),
    "character"
  )
  expect_equal(res, normalizePath(fpath_to, winslash = "/"))
  expect_true(file.exists(fpath_to))
  
  expect_equal(
    res <- unlink(fpath_to, force=TRUE),
    as.integer(0)
  )
  
  ##----------------------------------------------------------------------------
  ## lib: missing
  ## to: missing
  ##----------------------------------------------------------------------------
 
  if (FALSE) {
    fpath_to <- file.path(R.home(), paste0(basename(R.home("library")), ".zip"))
    expect_is(
      res <- compressPackageLibrary(),
      "character"
    )
    expect_equal(res, normalizePath(fpath_to, winslash = "/"))
    expect_true(file.exists(fpath_to))
    
    expect_equal(
      res <- unlink(fpath_to, force=TRUE),
      as.integer(0)
    )
  }
  
  on.exit(.cleanTempDir(x = to_0))
    
})
