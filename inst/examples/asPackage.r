\dontrun{

## When 'x' specifies the directory path of a package project //
## Requirements: create a new package project with name 'example.package'
asPackage(x = "path/to/example.package")

## When 'x' specifies the name of a loaded package //
asPackage(x = "base")

## When 'x' specifies the name of an unloaded package //
try(asPackage(x = "nonexistingpackage")

}
