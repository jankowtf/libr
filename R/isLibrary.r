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
#' @example inst/examples/isLibrary.R
#' @seealso \code{
#'    \link[libr]{isLibrary-character-method}
#' } 
#' @template author
#' @template references
#' @export isLibrary
setGeneric(name="isLibrary", 
  signature = c(
    "lib"
  ),
  def = function(
    lib,
    look_for = "DESCRIPTION",
    strict = FALSE
  ) {
  standardGeneric("isLibrary")
})

#' @title
#' Is Package Library
#'
#' @description 
#' Checks if a specified directory is a package library.
#' 
#' @inheritParams isLibrary
#' @param lib \code{\link{character}}.  
#' @return \code{\link{logical}}. \code{TRUE} if \code{lib} is a package library,
#'    \code{FALSE} if it is not.
#' @seealso \code{
#'    \link[libr]{isLibrary}
#' } 
#' @template author
#' @template references
#' @export
#' @import conditionr
setMethod(f = "isLibrary", 
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
      conditionr::signalCondition(
        condition = "InvalidLibraryLocation",
        msg = c(
          "Library does not exist",
          Library = lib
        ),
        ns = "libr",
        type = "error"
      )
    } else {
      return(FALSE)
    }
  }    
  if (!file.info(lib)$isdir) {
    if (strict) {
      conditionr::signalCondition(
        condition = "InvalidLibraryLocation",
        msg = c(
          "Specified library is not a directory",
          Library = lib
        ),
        ns = "libr",
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

