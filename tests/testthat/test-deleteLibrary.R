require("testthat")
test_that(desc="test_deleteLibrary", code={
  
  .cleanTempDir <- function(x) {
    if (grepl(basename(tempdir()), x)) {
      unlink(x, recursive = TRUE, force = TRUE)
    }
  }
  .openDirectory <- function(dir = getwd()){
    if (.Platform['OS.type'] == "windows"){
      shell.exec(dir)
    } else {
      system(paste(Sys.getenv("R_BROWSER"), dir))
    }
  }
  
  ##----------------------------------------------------------------------------
  ## lib: character
  ##----------------------------------------------------------------------------
  
  lib <- file.path(tempdir(), "library")
  dir.create(lib, showWarnings=FALSE, recursive=TRUE)
  #        .openDirectory(dirname(lib)) 
  expect_error(deleteLibrary(lib = lib))
  
  if (basename(getwd()) == "testthat") {
    lib_0 <- "library"
  } else {
    lib_0 <- "tests/testthat/library"
  }
  file.copy(lib_0, lib, overwrite = TRUE, recursive = TRUE)
  expect_true(deleteLibrary(lib = file.path(lib, "library")))
  expect_false(file.exists(file.path(lib, "library")))

  on.exit(.cleanTempDir(x = lib))
  
}
)
