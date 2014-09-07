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
#'   	\link[rapp.core.library]{isPackageLoaded-character-method},
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
#' @description 
#' Checks if package is loaded.
#' 
#' @details
#' Details 
#' 
#' @inheritParams isPackageLoaded
#' @param pkg \code{\link{missing}}.  
#' @return See method 
#'    \code{\link[rapp.core.library]{isPackageLoaded-character-method}}
#' @seealso \code{
#'     \link[rapp.core.library]{isPackageLoaded}
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
#' Unload Package 
#'
#' @description 
#' Unloads package.
#' 
#' @details
#' Details 
#'
#' @inheritParams isPackageLoaded
#' @param pkg \code{\link{character}}.  
#' @return TODO
#' @seealso \code{
#'     \link[rapp.core.library]{isPackageLoaded}
#' }
#' @template author
#' @template references
#' @export
#' @import rapp.core.package
setMethod(
  f = "isPackageLoaded", 
  signature = signature(
    pkg = "character"
  ), 
  definition = function(
    pkg
  ) {
      
  ## Ensure 'pkg' as expected by 'devtools' //    
  pkg <- rapp.core.package::asPackage(pkg)
  
  return(paste0("package:", pkg$package) %in% search())

  }
)

