#' @title
#' Is Package Library
#'
#' @description 
#' Checks if a specified directory is a package library.
#' 
#' @param lib \strong{Signature argument}.
#'    Object containing library location information.
#' @param look_for \code{\link{character}}.
#'    Directories or files to look for. Currently, this only consists of 
#'    \code{"DESCRIPTION"} as this seems to be the least common denominator 
#'    for a package library's content.
#' @param strict \code{\link{logical}}.
#'    Should certain conditions lead to an error (\code{TRUE}) or only to 
#'    an return value of \code{FALSE} (\code{FALSE}, default).
#' @example inst/examples/isPackageLibrary.R
#' @seealso \code{
#'    \link[rapp.core.library]{isPackageLibrary-character-method}
#' } 
#' @template author
#' @template references
#' @export isPackageLibrary
setGeneric(name="isPackageLibrary", 
  signature = c(
    "lib"
  ),
  def = function(
    lib,
    look_for = "DESCRIPTION",
    strict = FALSE
  ) {
  standardGeneric("isPackageLibrary")
})

#' @title
#' Is Package Library
#'
#' @description 
#' Checks if a specified directory is a package library.
#' 
#' @inheritParams isPackageLibrary
#' @param lib \code{\link{character}}.  
#' @return \code{\link{logical}}. \code{TRUE} if \code{lib} is a package library,
#'    \code{FALSE} if it is not.
#' @seealso \code{
#'    \link[rapp.core.library]{isPackageLibrary}
#' } 
#' @template author
#' @template references
#' @export
#' @import rapp.core.condition
setMethod(f = "isPackageLibrary", 
  signature = signature(  
    lib = "character"
  ), 
  definition = function(
    lib,
    look_for,
    strict
  ) {
    
  if (!file.exists(lib)) {
    if (strict) {
      rapp.core.condition::signalCondition(
        condition = "InvalidLibraryLocation",
        msg = c(
          "Library does not exist",
          Library = lib
        ),
        ns = "rapp.core.library",
        type = "error"
      )
    } else {
      return(FALSE)
    }
  }    
  if (!file.info(lib)$isdir) {
    if (strict) {
      rapp.core.condition::signalCondition(
        condition = "InvalidLibraryLocation",
        msg = c(
          "Specified library is not a directory",
          Library = lib
        ),
        ns = "rapp.core.library",
        type = "error"
      )
    } else {
      return(FALSE)
    }
  }    
  pkgs <- list.files(lib, full.names = TRUE)
  if (length(pkgs)) {
    tmp <- sapply(pkgs, function(ii) {
      to_check <- file.path(ii, look_for)
      all(sapply(to_check, file.exists))
    })
    out <- all(tmp)
  } else {
    out <- FALSE
  }
  out
  
  } 
)

