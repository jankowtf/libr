#' @title 
#' Is Package Loaded
#'
#' @description 
#' Checks if package is loaded.
#' 
#' @param pkg \strong{Signature argument}.
#'    Object containing package information.
#' @example inst/examples/isPackageLoaded.R
#' @seealso \code{
#'   	\link[libr]{isPackageLoaded-character-method},
#' 		\link[devtools]{unload}
#' }
#' @template author
#' @template references
#' @export isPackageLoaded
setGeneric(
  name="isPackageLoaded", 
  signature = c(
    "pkg"
  ),
  def = function(
    pkg = "."
  ) {
  standardGeneric("isPackageLoaded")
})

#' @title 
#' Is Package Loaded
#'
#' @inheritParams isPackageLoaded
#' @param pkg \code{\link{missing}}.  
#' @return See method 
#'    \code{\link[libr]{isPackageLoaded-character-method}}
#' @seealso \code{
#'     \link[libr]{isPackageLoaded}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "isPackageLoaded", 
  signature = signature(
    pkg = "missing"
  ), 
  definition = function(
    pkg
  ) {
      
  isPackageLoaded(pkg = pkg)

  }
)

#' @title 
#' Is Package Loaded
#' 
#' @inheritParams isPackageLoaded
#' @param pkg \code{\link{character}}.  
#' @return TODO
#' @seealso \code{
#'     \link[libr]{isPackageLoaded}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "isPackageLoaded", 
  signature = signature(
    pkg = "character"
  ), 
  definition = function(
    pkg
  ) {
      
  ## Ensure 'pkg' as expected by 'devtools' //    
  pkg <- asPackage(pkg)
  
  return(pkg$package %in% loadedNamespaces())

  }
)

