\dontrun{

isPackageLibrary(lib = R.home("library"))
isPackageLibrary(lib = tempdir())
isPackageLibrary(lib = "nonexistingdirectory")
isPackageLibrary(lib = "nonexistingdirectory", strict = TRUE)
isPackageLibrary(lib = "DESCRIPTION")
isPackageLibrary(lib = "DESCRIPTION", strict = TRUE)

}
