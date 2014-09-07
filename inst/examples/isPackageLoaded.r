\dontrun{

## When 'pkg' specifies the directory path of a package project //
## Requirements: create a new package project with name 'example.package'
try(isPackageLoaded(pkg = "path/to/example.package"))

## When 'pkg' specifies the name of a loaded package //
pkg <- "devtools"
isPackageLoaded(pkg = pkg)
require(pkg, character.only = TRUE)
isPackageLoaded(pkg = pkg)
rapp.core.library::unloadPackage(pkg)
isPackageLoaded(pkg = pkg)

## When 'pkg' specifies the name of an unloaded package //
try(isPackageLoaded(pkg = tempdir()))
try(isPackageLoaded(pkg = "nonexistingpackage"))

}
