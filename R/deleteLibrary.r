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
#' @example inst/examples/deleteLibrary.r
#' @template author
#' @template references
#' @seealso \code {
#'    \link[libr]{deleteLibrary-character-method}
#' }
#' @export
setGeneric(
  name = "deleteLibrary",
  signature = c(
    "lib"
  ),
  def = function(
    lib,
    ...,
    .ctx,
    .ns
  ) {
    standardGeneric("deleteLibrary")       
  }
)

#' @title 
#' Delete Package Library
#'
#' @description 
#' Deletes an R package library if it does not correspond to 
#' \code{R.home("library")}.
#' 
#' @inheritParams deleteLibrary
#' @param lib \code{\link{character}}.
#' @return \code{\link{numeric}}. \code{0} or \code{1}.
#' @example inst/examples/deleteLibrary.r
#' @template author
#' @template references
#' @seealso \code {
#'    \link[libr]{deleteLibrary}
#' }
#' @export
#' @import conditionr
setMethod(
  f = "deleteLibrary", 
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
  if (!isLibrary(lib = lib, strict = TRUE)) {
    conditionr::signalCondition(
      condition = "InvalidLibraryLocation",
      msg=c(
        "Invalid library location",
        Library = lib
      ),
      ns = "libr",
      type="error"
    )
  }
  if (lib == R.home("library")) {
    conditionr::signalCondition(
      condition = "UnauthorizedLibraryOperation",
      msg=c(
        "Base library cannot be deleted",
        Library = lib
      ),
      ns = "libr",
      type="error"
    )
  }
  
  ## Delete //
  out <- !as.logical(unlink(lib, force=TRUE, recursive=TRUE))
  
  ## Return value //
  return(out)
    
  }
)
