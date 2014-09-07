#' @title 
#' Delete Package Library
#'
#' @description 
#' Deletes an R package library if it does not correspond to 
#' \code{R.home("library")}.
#' 
#' @param lib \strong{Signature argument}.
#' 		Object containing package library information.
#' @template threedot
#' @example inst/examples/deletePackageLibrary.r
#' @template author
#' @template references
#' @seealso \code {
#'    \link[rapp.core.library]{deletePackageLibrary-character-method}
#' }
#' @export
setGeneric(
  name = "deletePackageLibrary",
  signature = c(
    "lib"
  ),
  def = function(
    lib,
    ...,
    .ctx,
    .ns
  ) {
    standardGeneric("deletePackageLibrary")       
  }
)

#' @title 
#' Delete Package Library
#'
#' @description 
#' Deletes an R package library if it does not correspond to 
#' \code{R.home("library")}.
#' 
#' @inheritParams deletePackageLibrary
#' @param lib \code{\link{character}}.
#' @return \code{\link{numeric}}. \code{0} or \code{1}.
#' @example inst/examples/deletePackageLibrary.r
#' @template author
#' @template references
#' @seealso \code {
#'    \link[rapp.core.library]{deletePackageLibrary}
#' }
#' @export
#' @import rapp.core.condition
setMethod(
  f = "deletePackageLibrary", 
  signature = signature(
    lib = "character"
  ), 
  definition = function(
    lib,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Validate //
  if (!isPackageLibrary(lib = lib, strict = TRUE)) {
    rapp.core.condition::signalCondition(
      condition = "InvalidLibraryLocation",
      msg=c(
        "Invalid library location",
        Library = lib
      ),
      ns = "rapp.core.library",
      type="error"
    )
  }
  if (lib == R.home("library")) {
    rapp.core.condition::signalCondition(
      condition = "UnauthorizedLibraryOperation",
      msg=c(
        "Base library cannot be deleted",
        Library = lib
      ),
      ns = "rapp.core.library",
      type="error"
    )
  }
  
  ## Delete //
  out <- !as.logical(unlink(lib, force=TRUE, recursive=TRUE))
  
  ## Return value //
  return(out)
    
  }
)
