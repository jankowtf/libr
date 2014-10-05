#' @title 
#' Compress Package Library
#'
#' @description 
#' Compresses a R package library of a \emph{rapp} project.
#' 
#' @param lib \strong{Signature argument}.
#' 		Object containing package library information.
#' @param to \strong{Signature argument}.
#' 		Object containing information about the compression's target location.
#' @param add_timestamp \code{\link{logical}}.
#'    Add timestamp to file name (\code{TRUE}) or not (\code{FALSE}, default)
#' @param overwrite \code{\link{logical}}. Dimension: 1.
#' 		If file already exists: \code{TRUE} means file is overwritten,
#' 		\code{FALSE} (default) means it is not overwritten.
#' @template threedot
#' @example inst/examples/compressLibrary.R
#' @seealso \code{
#'    \link[libr]{compressLibrary-character-character-method}
#' }
#' @template author
#' @template references
#' @export
setGeneric(
  name = "compressLibrary",
  signature = c(
    "lib", 
    "to"
  ),
  def = function(
    lib = R.home("library"),
    to = dirname(lib),
    add_timestamp = FALSE,
    overwrite = FALSE,
    ...
  ) {
    standardGeneric("compressLibrary")       
  }
)

#' @title 
#' Compress Package Library
#'
#' @description 
#' Compresses a R package library of a \emph{rapp} project.
#' 
#' @inheritParams compressLibrary
#' @param lib \code{\link{character}}.
#' @param to \code{\link{missing}}.
#' @return See method 
#'    \code{\link[libr]{compressLibrary-character-character-method}}
#' @seealso \code{
#'    \link[libr]{compressLibrary}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "compressLibrary", 
  signature = signature(
    lib = "missing",
    to = "missing"
  ), 
  definition = function(
    lib,
    to,
    add_timestamp,
    overwrite,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Dispatch //
  out <- compressLibrary(
    lib = lib,
    to = to,
    add_timestamp = add_timestamp,
    overwrite = overwrite,
    ...
  )
  
  ## Return value //
  return(out)
    
  }
)

#' @title 
#' Compress Package Library
#'
#' @description 
#' Compresses a R package library of a \emph{rapp} project.
#' 
#' @inheritParams compressLibrary
#' @param lib \code{\link{character}}.
#' @param to \code{\link{missing}}.
#' @return See method 
#'    \code{\link[libr]{compressLibrary-character-character-method}}
#' @seealso \code{
#'    \link[libr]{compressLibrary}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "compressLibrary", 
  signature = signature(
    lib = "missing",
    to = "character"
  ), 
  definition = function(
    lib,
    to,
    add_timestamp,
    overwrite,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Dispatch //
  out <- compressLibrary(
    lib = lib,
    to = to,
    add_timestamp = add_timestamp,
    overwrite = overwrite,
    ...
  )
  
  ## Return value //
  return(out)
    
  }
)

#' @title 
#' Compress Package Library
#'
#' @description 
#' Compresses a R package library of a \emph{rapp} project.
#' 
#' @inheritParams compressLibrary
#' @param lib \code{\link{character}}.
#' @param to \code{\link{missing}}.
#' @return See method 
#'    \code{\link[libr]{compressLibrary-character-character-method}}
#' @seealso \code{
#'    \link[libr]{compressLibrary}
#' }
#' @template author
#' @template references
#' @export
setMethod(
  f = "compressLibrary", 
  signature = signature(
    lib = "character",
    to = "missing"
  ), 
  definition = function(
    lib,
    to,
    add_timestamp,
    overwrite,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Dispatch //
  out <- compressLibrary(
    lib = lib,
    to = to,
    add_timestamp = add_timestamp,
    overwrite = overwrite,
    ...
  )
  
  ## Return value //
  return(out)
    
  }
)

#' @title 
#' Compress Package Library
#'
#' @description 
#' Compresses a R package library of a \emph{rapp} project.
#' 
#' @inheritParams compressLibrary
#' @param lib \code{\link{character}}.
#' @param to \code{\link{character}}.
#' @return \code{\link{character}}. File path of compressed package library.
#' @seealso \code{
#'    \link[libr]{compressLibrary}
#' }
#' @template author
#' @template references
#' @export
#' @import conditionr
setMethod(
  f = "compressLibrary", 
  signature = signature(
    lib = "character",
    to = "character"
  ), 
  definition=function(
    lib,
    to,
    add_timestamp,
    overwrite,
    ...
  ) {
    
#   ## Tracing //
#   if (length(as.numeric(getOption("rapp")$trace$tracelevel))) {
#     
#   }        
  
  ## Check if file or directory //
  is_file <- grepl("\\.zip$", to)  
  if (is_file) {
    fname <- gsub("\\.zip$", "", basename(to))
    to    <- dirname(to)
  }
  if (to == ".") {
    to <- lib
  }
    
  ## Existence check //
  if (!file.exists(lib)) {
    conditionr::signalCondition(
      condition = "DirectoryDoesNotExist",
      msg = c(
        "Directory does not exist",
        "Library" = lib
      ),
      type = "error"
    )
  }
  if (!file.exists(to)) {
    conditionr::signalCondition(
      condition = "TargetDirectoryDoesNotExist",
      msg = c(
        "Target directory does not exist",
        "Path" = to
      ),
      type = "error"
    )
  }
  
  ## Directory check //
  if (!isLibrary(lib = lib, strict = TRUE)) {
    conditionr::signalCondition(
      condition = "InvalidLibraryLocation",
      msg=c(
        "Invalid library location",
        Details = "did not match package library criteria",
        Library = lib
      ),
      type="error"
    )
  }
  if (!file.info(to)$isdir) {
    conditionr::signalCondition(
      condition = "InvalidTargetLocation",
      msg=c(
        "Target is not an existing directory",
        "Path" = to
      ),
      type="error"
    )
  }
  
  ## Final file path //
  tmp <- c(
    if (!is_file) {
      basename(lib)
    } else {
      fname
    },
    if (add_timestamp) {
      c("_", gsub("-|:| ", "", Sys.time()))
    } else {
      ""
    },
    ".zip"
  )
  fpath_compr <- normalizePath(file.path(to, paste(tmp, collapse = "")),
    winslash = "/", mustWork = FALSE
  )
  
  ## Compress //
  wd_0 <- getwd()
  out <- tryCatch(
    {
      setwd(lib)
      
      ## File path for renaming //
      if (to == lib) {
      ## This relocates the zipped file to the parent folder 
        fpath_compr_1 <- gsub(dirname(fpath_compr), "..", fpath_compr)
      } else {
        fpath_compr_1 <- fpath_compr
      }
      
      if (!file.exists(fpath_compr_1) | overwrite) {
        
        ## Delete if compressed file already exists //
        if (file.exists(fpath_compr)) {
          unlink(fpath_compr, force=TRUE)       
        }
        
        res <- utils::zip(zipfile=fpath_compr, files=".") 
        #tar(tarfile="test", files=".", compression="gzip")
        #tar(tarfile="xz.tz", files=".", compression="xz") # slow
        
        if (res != 0) {
          conditionr::signalCondition(
            condition = "CompressingFunctionReturnedWithError",
            msg = c(
              "Failed to compress directory",
              "Library" = lib,
              "Filepath" = fpath_compr
            ),
            type = "error"
          )
        }                        
        
        ## Relocate //
        if (file.exists(fpath_compr) && to == lib) {
          file.rename(from = fpath_compr, to = fpath_compr_1)
        } 
        out <- normalizePath(fpath_compr_1, winslash = "/")
      } else {
        out <- normalizePath(fpath_compr_1, winslash = "/")
      }
      unname(out)
    }, 
    error=function(cond) {
      conditionr::signalCondition(
        condition = "CompressionResultedInError",
        msg=c(
          "Compression resulted in error",
          "lib"=lib,
          "Filepath"=fpath_compr,
          "Error"=conditionMessage(cond)
        ),
        type="error"
      )
    },
    warning=function(cond) {
      conditionr::signalCondition(
        condition = "CompressionResultedInError",
        msg=c(
          "Compression resulted in warning",
          "lib"=lib,
          "Filepath"=fpath_compr,
          "Warning"=conditionMessage(cond)
        ),
        type="warning"
      )
    },
    finally={
      setwd(wd_0)
    }
  )
  
  ## Return value //
  return(out)

  }
)


