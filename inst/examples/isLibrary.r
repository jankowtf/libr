\dontrun{

isLibrary(lib = R.home("library"))
isLibrary(lib = tempdir())
isLibrary(lib = "nonexistingdirectory")
isLibrary(lib = "nonexistingdirectory", strict = TRUE)
isLibrary(lib = "DESCRIPTION")
isLibrary(lib = "DESCRIPTION", strict = TRUE)

}
