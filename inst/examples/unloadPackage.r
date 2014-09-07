\dontrun{

## When 'pkg' specifies the directory path of a package project //
## Requirements: create a new package project with name 'example.package'
unloadPackage(pkg = "path/to/example.package")
"package::example.package" %in% search()

## When 'pkg' specifies the name of a loaded package //
pkg <- "devtools"
require(pkg, character.only = TRUE)
paste0("package:", pkg) %in% search()
unloadPackage(pkg = pkg)
paste0("package:", pkg) %in% search()

## When 'pkg' specifies the name of an unloaded package //
try(unloadPackage(pkg = tempdir()))
try(unloadPackage(pkg = "nonexistingpackage"))

}
