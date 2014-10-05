#' @title 
#' Unload Package 
#'
#' @description 
#' Unloads from search path package.
#' 
#' @param pkg \strong{Signature argument}.
#'    Object containing package information.
#' @example inst/examples/unloadPackage.R
#' @seealso \code{
#'   	\link[libr]{unloadPackage-character-method},
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
#' @inheritParams unloadPackage
#' @param pkg \code{\link{missing}}.  
#' @return See method 
#'    \code{\link[libr]{unloadPackage-character-method}}
#' @seealso \code{
#'     \link[libr]{unloadPackage}
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
#'     \link[libr]{unloadPackage}
#' }
#' @template author
#' @template references
#' @export
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
  pkg <- asPackage(pkg)
  
  ## Dispatch to actual 'devtools' function //
  devtools::unload(pkg = pkg)

  }
)

