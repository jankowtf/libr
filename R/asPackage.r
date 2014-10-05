#' @title 
#' Coerce input to a package
#'
#' @description 
#' Possible inputs:
#' \itemize{
#'    \item{path}
#'    \item{package object}
#'    \item{package name (loaded package)}
#' }
#' 
#' @param x \strong{Signature argument}.
#'    Object to be transformed into an package.
#' @example inst/examples/asPackage.R
#' @seealso \code{
#'   	\link[libr]{asPackage-character-method},
#' 		\link[devtools]{as.package}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name="asPackage", 
  signature = c(
    "x"
  ),
  def = function(
    x = "."
  ) {
  standardGeneric("asPackage")
})

#' @title 
#' Coerce input to a package (missing-method)
#' 
#' @inheritParams asPackage
#' @param x \code{\link{missing}}.  
#' @return See method 
#'    \code{\link[libr]{asPackage-character-method}}
#' @seealso \code{
#'     \link[libr]{asPackage}
#' }
#' @export
setMethod(
  f = "asPackage", 
  signature = signature(
    x = "missing"
  ), 
  definition = function(
    x
  ) {
      
  return(asPackage(x = x))

  }
)

#' @title 
#' Coerce input to a package (character-method)
#' 
#' @inheritParams asPackage
#' @param x \code{\link{character}}.  
#' @return Complemented package description in \code{list} form but with 
#'    class attribute \code{package}.
#' @seealso \code{
#'     \link[libr]{asPackage}
#' }
#' @import devtools
#' @import conditionr
#' @export
setMethod(
  f = "asPackage", 
  signature = signature(
    x = "character"
  ), 
  definition = function(
    x
  ) {
      
  if (file.exists(x) && file.info(x)$isdir) {
  ## Supposing that 'x' is the package project directory //
#     devtools::as.package
#     devtools:::check_dir
    out <- devtools::as.package(x = x)
  } else {
  ## Supposing that 'x' is the name of either an installed or loaded 
  ## package //
    if (  x %in% loadedNamespaces() || 
          x %in% .packages(all.available = TRUE, lib.loc = .libPaths()[1])
    ) {
      desc <- unclass(packageDescription(pkg = x))
      if (length(attributes(desc)$file)) {
        attributes(desc)$file <- NULL
      }
      names(desc) <- tolower(names(desc))
      desc$path <- normalizePath(file.path(.libPaths()[1], x), mustWork = FALSE)
      out <- structure(desc, class = "package")
    } else {
      conditionr::signalCondition(
        condition = "InalidPackageName",
        msg = c(
          "Invalid package name",
          Reason = "not a name of an installed package",
          Name = x
        ),
        ns = "libr",
        type = "error"
      )
    }
  }
  return(out)

  }
)

