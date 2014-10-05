#' @title 
#' Ensure Latest Package Versions
#'
#' @description 
#' Ensures that latest package versions are installed based on a comparison of 
#' the package library and the package repository/repositories.
#' 
#' @param lib \strong{Signature argument}.
#'    Object containing library information.
#' @param repos \strong{Signature argument}.
#'    Object containing repository information.
#' @param pkgs \strong{Signature argument}.
#'    Object containing package name information.
#' @template threedot
#' @example inst/examples/ensureLatestPackageVersions.R
#' @template author
#' @template references
#' @export ensureLatestPackageVersions
setGeneric(
  name="ensureLatestPackageVersions", 
  signature = c(
    "lib",
    "repos",
    "pkgs"
  ),
  def = function(
    lib = R.home("library"),
    repos = file.path("file://", Sys.getenv("HOME"), ".rapp/repos"),
    pkgs = character(),
    ...
  ) {
  standardGeneric("ensureLatestPackageVersions")
})

#' @title 
#' Ensure Latest Package Versions (\code{missing-missing-missing-method})
#'
#' @description 
#' Ensures that latest package versions are installed based on a comparison of 
#' the package library and the package repository/repositories.
#' 
#' @inheritParams ensureLatestPackageVersions
#' @param lib \code{\link{missing}}. 
#' @param repos \code{\link{missing}}. 
#' @param pkgs \code{\link{missing}}. 
#' @return TODO 
#' @example inst/examples/ensureLatestPackageVersions.R
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureLatestPackageVersions", 
  signature = signature(
    lib = "missing",
    repos = "missing",
    pkgs = "missing"
  ), 
  definition = function(
    lib,
    repos,
    pkgs,
    ...
  ) {
  
  return(ensureLatestPackageVersions(
    lib = lib,
    repos = repos,
    pkgs = pkgs, 
    ...
  ))

  } 
)

#' @title 
#' Ensure Latest Package Versions (\code{character-missing-missing-method})
#'
#' @description 
#' Ensures that latest package versions are installed based on a comparison of 
#' the package library and the package repository/repositories.
#' 
#' @inheritParams ensureLatestPackageVersions
#' @param lib \code{\link{character}}. 
#' @param repos \code{\link{missing}}. 
#' @param pkgs \code{\link{missing}}. 
#' @return TODO 
#' @example inst/examples/ensureLatestPackageVersions.R
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureLatestPackageVersions", 
  signature = signature(
    lib = "character",
    repos = "missing",
    pkgs = "missing"
  ), 
  definition = function(
    lib,
    repos,
    pkgs,
    ...
  ) {
  
  return(ensureLatestPackageVersions(
    lib = lib,
    repos = repos,
    pkgs = pkgs, 
    ...
  ))

  } 
)

#' @title 
#' Ensure Latest Package Versions (\code{missing-character-missing-method})
#'
#' @description 
#' Ensures that latest package versions are installed based on a comparison of 
#' the package library and the package repository/repositories.
#' 
#' @inheritParams ensureLatestPackageVersions
#' @param lib \code{\link{missing}}. 
#' @param repos \code{\link{character}}. 
#' @param pkgs \code{\link{missing}}. 
#' @return TODO 
#' @example inst/examples/ensureLatestPackageVersions.R
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureLatestPackageVersions", 
  signature = signature(
    lib = "missing",
    repos = "character",
    pkgs = "missing"
  ), 
  definition = function(
    lib,
    repos,
    pkgs,
    ...
  ) {
  
  return(ensureLatestPackageVersions(
    lib = lib,
    repos = repos,
    pkgs = pkgs, 
    ...
  ))

  } 
)

#' @title 
#' Ensure Latest Package Versions (\code{character-character-missing-method})
#'
#' @description 
#' Ensures that latest package versions are installed based on a comparison of 
#' the package library and the package repository/repositories.
#' 
#' @inheritParams ensureLatestPackageVersions
#' @param lib \code{\link{character}}. 
#' @param repos \code{\link{character}}. 
#' @param pkgs \code{\link{missing}}. 
#' @return TODO 
#' @example inst/examples/ensureLatestPackageVersions.R
#' @template author
#' @template references
#' @export
setMethod(
  f = "ensureLatestPackageVersions", 
  signature = signature(
    lib = "character",
    repos = "character",
    pkgs = "missing"
  ), 
  definition = function(
    lib,
    repos,
    pkgs,
    ...
  ) {
  
  return(ensureLatestPackageVersions(
    lib = lib,
    repos = repos,
    pkgs = pkgs, 
    ...
  ))

  } 
)

#' @title 
#' Ensure Latest Package Versions (\code{character-character-character-method})
#'
#' @description 
#' Ensures that latest package versions are installed based on a comparison of 
#' the package library and the package repository/repositories.
#' 
#' @inheritParams ensureLatestPackageVersions
#' @param lib \code{\link{character}}. 
#' @param repos \code{\link{character}}. 
#' @param pkgs \code{\link{character}}. 
#' @return TODO 
#' @example inst/examples/ensureLatestPackageVersions.R
#' @template author
#' @template references
#' @export
#' @import conditionr
#' @import repositr
setMethod(
  f = "ensureLatestPackageVersions", 
  signature = signature(
    lib = "character",
    repos = "character",
    pkgs = "character"
  ), 
  definition = function(
    lib,
    repos,
    pkgs,
    ...
  ) {
  
  repos <- repositr::normalizeRepositoryPath(
    repos = repos, 
    type = "url_file"
  )
  
  pkg_info <- tryCatch(
    old.packages(lib.loc = lib, repos = repos),
    error = function(cond) {
      conditionr::signalCondition(
        condition = "RepositoryLookupHadError",
        msg = c(
          "Repository lookup had error",
          Details = "probable cause is invalid repository location",
          Repository = repos,
          Library = lib,
          "Original message" = conditionMessage(cond)
        ),
        ns = "libr",
        type = "error"
      )  
    },
    warning = function(cond) {
        conditionr::signalCondition(
        condition = "RepositoryLookupHadWarning",
        msg = c(
          "Repository lookup had warning",
          Details = "probable cause is invalid repository location",
          Repository = repos,
          Library = lib,
          "Original message" = conditionMessage(cond)
        ),
        ns = "libr",
        type = "error"
      )  
    }
  )
  
  if (length(pkg_info)) {
    if (!length(pkgs)) {
      pkgs <- pkg_info[, "Package"]
    }
    
    is_loaded <- which(sapply(pkgs, isPackageLoaded))
    if (length(is_loaded)) {
      sapply(pkgs[is_loaded], unloadPackage)
    } 
    
    out <- install.packages(
      pkgs = pkgs,
      lib = lib,
      repos = repos
    )
  } else {
    out <- FALSE
  }
  return(out)

  } 
)


