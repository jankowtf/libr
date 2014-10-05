#' @title 
#' Is Package Loaded (generic)
#'
#' @description 
#' Checks if package is loaded.
#' 
#' @details
#' See main method: \code{\link[libr]{isPackageLoaded-character-method}}.
#' 
#' @param pkg \strong{Signature argument}.
#'    Object containing package information.
#' @example inst/examples/isPackageLoaded.r
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
#' Is Package Loaded (missing-method)
#'
#' @details
#' See generic: \code{\link[libr]{isPackageLoaded}}.
#' See main method: \code{\link[libr]{isPackageLoaded-character-method}}.
#'
#' @inheritParams isPackageLoaded
#' @param pkg \code{\link{missing}}.  
#' @return See method 
#'    \code{\link[libr]{isPackageLoaded-character-method}}.
#' @example inst/examples/isPackageLoaded.r
#' @seealso \code{
#'     \link[libr]{isPackageLoaded},
#'     \link[libr]{isPackageLoaded-character-method}
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
#' Is Package Loaded (character-method)
#' 
#' @details
#' See generic: \code{\link[libr]{isPackageLoaded}}.
#' 
#' @inheritParams isPackageLoaded
#' @param pkg \code{\link{character}}.  
#' @return \code{\link{logical}}. \code{TRUE}: loaded; \code{FALE}: not loaded.
#' @example inst/examples/isPackageLoaded.r
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
