#' @title
#' Functionality for handling package libraries
#'
#' @description
#' The package provides useful functionality with respect to 
#' packages and package libraries.
#' 
#' @section Main functions/methods: 
#' 
#' \itemize{
#'    \item{\code{\link[libr]{asPackage}}: }{
#'    
#'        Complements the functionality of \code{\link[devtools]{as.package}}.
#'        Input can also be the name of a loaded or installed package.
#'    }
#'    \item{\code{\link[libr]{unloadPackage}}: }{
#'    
#'        Complements the functionality of \code{\link[devtools]{unload}} 
#'        by combining it with \code{\link[libr]{asPackage}}.
#'    }
#' }
#' 
#' @section Convenience functions/methods:
#' 
#' \itemize{
#'    \item{\code{\link[libr]{isLibrary}}: }{
#'    
#'        Checks if a certain directory path corresponds to a package library.
#'    }
#'    \item{\code{\link[libr]{isPackageInstalled}}: }{
#'    
#'        Checks if package is installed in a specific package library.
#'    }
#'    \item{\code{\link[libr]{isPackageLoaded}}: }{
#'    
#'        Checks if package is loaded (attached to search path).
#'    }
#' }
#' 
#' @section Library management
#' 
#' \itemize{
#'    \item{\code{\link[libr]{compressLibrary}}: }{
#'    
#'        Compresses a package library so it can be backed up or transferred.
#'    }
#'    \item{\code{\link[libr]{deleteLibrary}}: }{
#'    
#'        Deletes a package library. Mainly designed when working with 
#'        multiple libraries for systematic testing/sandboxing purposes
#'        (e.g. testing new package versions in a own "fresh" library which
#'        is deleted again if everything went according to plan).
#'    }
#'    \item{\code{\link[libr]{ensureLatestPackageVersions}}: }{
#'    
#'        Ensure that latest package versions are installed. Currently, 
#'        this is mainly targeted at self-developed packages rather than
#'        packages contributed by other developers.
#'    }
#' }
#'          
#' @template author
#' @template references
#' @docType package
#' @name libr
NULL
