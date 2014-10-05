#' @title 
#' Delete Package Library (generic)
#'
#' @description 
#' Deletes an R package library unless it corresponds to either a personal
#' standard libraries (below \code{Sys.getenv("HOME")}) or \code{R.home("library")}.
#' 
#' @details 
#' See main method: \code{\link[libr]{deleteLibrary-character-method}}.
#' 
#' @param lib \strong{Signature argument}.
#' 		Object containing package library information.
#' @template threedot
#' @example inst/examples/deleteLibrary.r
#' @template author
#' @template references
#' @seealso \code {
#'    \link[libr]{deleteLibrary-character-method}
#' }
#' @export
setGeneric(
  name = "deleteLibrary",
  signature = c(
    "lib"
  ),
  def = function(
    lib,
    ...,
    .ctx,
    .ns
  ) {
    standardGeneric("deleteLibrary")       
  }
)

#' @title 
#' Delete Package Library (character-method)
#'
#' @description 
#' See generic \code{\link[libr]{deleteLibrary}}.
#' 
#' @inheritParams deleteLibrary
#' @param lib \code{\link{character}}.
#' @return \code{\link{numeric}}. \code{0} or \code{1}.
#' @example inst/examples/deleteLibrary.r
#' @template author
#' @template references
#' @seealso \code {
#'    \link[libr]{deleteLibrary}
#' }
#' @export
#' @import conditionr
setMethod(
  f = "deleteLibrary", 
  signature = signature(
    lib = "character"
  ), 
  definition = function(
    lib,
    ...
  ) {
  
  ## Validate //
  if (!isLibrary(lib = lib, strict = TRUE)) {
    conditionr::signalCondition(
      condition = "InvalidLibraryLocation",
      msg=c(
        "Invalid library location",
        Library = lib
      ),
      ns = "libr",
      type="error"
    )
  }
  
  ## Personal libs //
  r_vsn <- paste(R.version$major, gsub("\\..*", "", R.version$minor), sep = ".")
  if (.Platform$pkgType == "win.binary") {
    lib_p <- file.path(Sys.getenv("HOME"), "R/library", r_vsn)
  } else if (.Platform$OS.type == "mac.binary") {
    lib_p <- file.path(Sys.getenv("HOME"), "lib/R", r_vsn)
    ## Taken from http://stackoverflow.com/questions/2615128/where-does-r-store-packages
    ## --> Hopefully results in something like: '/Users/tex/lib/R/{version}'
  } else if (.Platform$OS.type == "source" && .Platform$OS.type == "unix") {
    lib_p <- file.path(Sys.getenv("HOME"), 
      c(
        "local/lib/R/site-library", 
        "lib/R/site-library",
        "lib/R/library"
      ), r_vsn)
      
    ## Taken from http://stackoverflow.com/questions/2615128/where-does-r-store-packages
    ## --> Hopefully results in something like: 
    ##     '/usr/local/lib/R/site-library/{version}'
    ##     '/usr/lib/R/site-library/{version}'
    ##     '/usr/lib/R/library/{version}'
  } else {
    stop("Don't know what to do for this OS type")
  }
  
  ## Make sure standard libs are never deleted //
  if (lib %in% c(lib_p, R.home("library"))) {
    conditionr::signalCondition(
      condition = "UnauthorizedLibraryOperation",
      msg=c(
        "Standard libraries cannot be deleted",
        Library = normalizePath(lib, winslash = "/")
      ),
      ns = "libr",
      type="error"
    )
  }
  
  ## Delete //
  out <- !as.logical(unlink(lib, force = TRUE, recursive = TRUE))
  
  ## Return value //
  return(out)
    
  }
)
