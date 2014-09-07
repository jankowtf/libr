#' @title
#' Is Package Installed
#'
#' @description 
#' Checks if package is installed.
#' 
#' @param pkg \strong{Signature argument}.
#'    Object containing package information.
#' @param lib \strong{Signature argument}.
#'    Object containing library location information.
#' @param simplified \code{\link{logical}}.
#'    Simplified result, i.e. query if installed in any library 
#'    (\code{TRUE}, default) 
#'    or detailed result, i.e. check for each package library in \code{lib} 
#'    (\code{FALSE}). 
#' @example inst/examples/isPackageInstalled.R
#' @seealso \code{
#'    \link[rapp.core.library]{isPackageInstalled-character-character-method}
#' } 
#' @template author
#' @template references
#' @export isPackageInstalled
setGeneric(name="isPackageInstalled", 
  signature = c(
    "pkg",
    "lib"
  ),
  def = function(
    pkg,
    lib = .libPaths(),
    simplified = TRUE
  ) {
  standardGeneric("isPackageInstalled")
})

#' @title
#' Is Package Installed
#'
#' @description 
#' Checks if package is installed.
#' 
#' @inheritParams isPackageInstalled
#' @param pkg \code{\link{character}}.  
#' @param lib \code{\link{missing}}.  
#' @return See method 
#'    \code{\link[rapp.core.library]{isPackageInstalled-character-character-method}}
#' @seealso \code{
#'    \link[rapp.core.library]{isPackageInstalled}
#' } 
#' @template author
#' @template references
#' @export
setMethod(f = "isPackageInstalled", 
  signature = signature(
    pkg = "character",  
    lib = "missing"
  ), 
  definition = function(
    pkg,
    lib,
    simplified
  ) {
    
  isPackageInstalled(
    pkg = pkg,
    lib = lib,
    simplified = simplified
  ) 
  
  } 
)

#' @title
#' Is Package Installed
#'
#' @description 
#' Checks if package is installed.
#' 
#' @inheritParams isPackageInstalled
#' @param pkg \code{\link{character}}.  
#' @param lib \code{\link{character}}.  
#' @return \code{\link{logical}}. \code{TRUE} if package is installed,
#'    \code{FALSE} if it is not.
#' @seealso \code{
#'    \link[rapp.core.library]{isPackageInstalled}
#' } 
#' @template author
#' @template references
#' @export
setMethod(f = "isPackageInstalled", 
  signature = signature(
    pkg = "character",  
    lib = "character"
  ), 
  definition = function(
    pkg,
    lib,
    simplified
  ) {
    
  out <- sapply(lib, function(ii) {
    pkg %in% list.files(ii)
  })
  
  if (simplified) {
    out <- any(out)
  }
  out
  
  } 
)




