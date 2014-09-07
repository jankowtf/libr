#' @title 
#' Unload Package 
#'
#' @description 
#' Unloads package.
#' 
#' @param pkg \strong{Signature argument}.
#'    Object containing package information.
#' @example inst/examples/unloadPackage.R
#' @seealso \code{
#'   	\link[rapp.core.library]{unloadPackage-character-method},
#' 		\link[devtools]{unload}
#' }
#' @template author
#' @template references
#' @export unloadPackage
setGeneric(
  name="unloadPackage", 
  signature = c(
    "pkg"
  ),
  def = function(
    pkg = "."
  ) {
  standardGeneric("unloadPackage")
})

#' @title 
#' Unload Package 
#'
#' @description 
#' Unloads package.
#' 
#' @details
#' Details 
#' 
#' @inheritParams unloadPackage
#' @param pkg \code{\link{missing}}.  
#' @return See method 
#'    \code{\link[rapp.core.library]{unloadPackage-character-method}}
#' @seealso \code{
#'     \link[rapp.core.library]{unloadPackage}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "unloadPackage", 
  signature = signature(
    pkg = "missing"
  ), 
  definition = function(
    pkg
  ) {
      
  unloadPackage(pkg = pkg)

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
#' @inheritParams unloadPackage
#' @param pkg \code{\link{character}}.  
#' @return TODO
#' @seealso \code{
#'     \link[rapp.core.library]{unloadPackage}
#' }
#' @template author
#' @template references
#' @export
#' @import rapp.core.package
#' @import devtools
setMethod(
  f = "unloadPackage", 
  signature = signature(
    pkg = "character"
  ), 
  definition = function(
    pkg
  ) {
      
  ## Ensure 'pkg' as expected by 'devtools' //    
  pkg <- rapp.core.package::asPackage(pkg)
  
  ## Dispatch to actual 'devtools' function //
  devtools::unload(pkg = pkg)

  }
)

