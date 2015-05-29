\dontrun{

##------------------------------------------------------------------------------
## Preliminaries //
##------------------------------------------------------------------------------
  
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

## Target directory //
to_0 <- file.path(tempdir(), "backup")
dir.create(to_0, showWarnings=FALSE, recursive=TRUE)

## Open target directory in file browser //
.openDirectory(to_0) 

##------------------------------------------------------------------------------
## Actual application //
##------------------------------------------------------------------------------
  
fpath <- compressLibrary(lib = R.home("library"), to = to_0)
fpath 
file.exists(fpath)
time_1 <- file.info(fpath)$mtime  
  
fpath <- compressLibrary(to = to_0, overwrite = TRUE)
time_2 <- file.info(fpath)$mtime  
time_1 < time_2  
  
## With timestamp
fpath_1 <- compressLibrary(to = to_0, add_timestamp = TRUE)
fpath_2 <- compressLibrary(to = to_0, add_timestamp = TRUE)
  
## Condition handling //
try(compressLibrary(lib = "nonexistingpath", to = to_0))
try(compressLibrary(to = "nonexistingpath"))
  
## Explicit file paths for 'to' //
to <- file.path(to_0, "test.zip")
compressLibrary(to = to)
compressLibrary(to = to, add_timestamp = TRUE)

}
