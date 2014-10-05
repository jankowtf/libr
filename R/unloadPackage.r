#' @title 
#' Unload Package (generic)
#'
#' @description 
#' Unloads package from search path.
#' 
#' @details
#' See generic: \code{\link[libr]{unloadPackage}}.
#' See main method: \code{\link[libr]{unloadPackage-character-method}}.
#' 
#' @param pkg \strong{Signature argument}.
#'    Object containing package information.
#' @example inst/examples/unloadPackage.r
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
#' Unload Package (missing-method)
#'
#' @details
#' See generic: \code{\link[libr]{unloadPackage}}.
#' See main method: \code{\link[libr]{unloadPackage-character-method}}.
#'
#' @inheritParams unloadPackage
#' @param pkg \code{\link{missing}}.  
#' @return See method 
#'    \code{\link[libr]{unloadPackage-character-method}}.
#' @example inst/examples/unloadPackage.r
#' @seealso \code{
#'    \link[libr]{unloadPackage},
#'    \link[libr]{unloadPackage-character-method}
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
#' Unload Package (character-method)
#'
#' @details
#' See generic: \code{\link[libr]{unloadPackage}}.
#'
#' @inheritParams unloadPackage
#' @param pkg \code{\link{character}}.  
#' @return \code{\link{NULL}}.
#' @example inst/examples/unloadPackage.r
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

