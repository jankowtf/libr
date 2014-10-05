libr (v0.1.1)
======

Functionality for processing file system ressources

## Installation

```
require("devtools")
devtools::install_github("Rappster/conditionr")
devtools::install_github("Rappster/repositr")
devtools::install_github("Rappster/libr")
require("libr")
```

## Library-related functions/methods

Compress library

```
compressLibrary(to = tempdir(), add_timestamp = TRUE)

# ...
#   adding: whisker/tests/testinterpolation.R (deflated 85%)
#   adding: whisker/tests/testinverted.R (deflated 79%)
#   adding: whisker/tests/testpartials.R (deflated 76%)
#   adding: whisker/tests/testsections.R (deflated 80%)
# [1] "C:/Users/jat/AppData/Local/Temp/RtmpmUzR0I/library_20141005135348.zip"
```

Delete library


```
deleteLibrary(lib = "/path/to/non-standard/lib")
```

**NOTE:
The function makes sure that you don't accidentally delete your user or 
system package library**

```
deleteLibrary(lib = R.home("library"))

#  Error in deleteLibrary(lib = R.home("library")) : 
#   2014-10-05 14:28:49/libr/deleteLibrary/UnauthorizedLibraryOperation> 
# Standard libraries cannot be deleted //
# [1] * Library: Q:/home/apps/rapptools/apps/r/R-3.1.1/library 
```

Ensure latest package versions

**NOTE: has not reached productive state yet!**

```
ensureLatestPackageVersions(
  lib = "/path/to/lib",
  repos = "/path/to/repository",
  pkgs = "names of packages to be considered"
)
```

## Package-related functions/methods

### Suitable input as instance of class `package`

1. If current working directory corresponds to package project

  ```
asPackage()

# $package
# [1] "libr"
# 
# $type
# [1] "Package"
# 
# $title
# [1] "Functionality for handling package libraries"
# 
# $version
# [1] "0.1.0.1"
# 
# $`authors@r`
# [1] "\"Janko Thyson <janko.thyson@rappster.de> [aut, cre]\""
# 
# $maintainer
# [1] "Janko Thyson <janko.thyson@rappster.de>"
# 
# $description
# [1] "The package provides useful functionality with respect to\npackages and package libraries."
# 
# $depends
# [1] "\nR (>= 3.1.1)"
# 
# $license
# [1] "GPL (>= 2)"
# 
# $roxygen
# [1] "list(wrap = FALSE)"
# 
# $needscompilation
# [1] "no"
# 
# $repository
# [1] "CRAN"
# 
# $lazydata
# [1] "true"
# 
# $imports
# [1] "\ndevtools,\nconditionr,\nrepositr"
# 
# $path
# [1] "Q:\\home\\wsp\\rapp2\\libr"
# 
# attr(,"class")
# [1] "package"
```

2. Specify path to package project explicitly

  ```
asPackage(x = "path/to/package/project")
```

3. Name of an installed or loaded package

  ```
asPackage(x = "devtools")

# $package
# [1] "devtools"
# 
# $title
# [1] "Tools to make developing R code easier"
# 
# $version
# [1] "1.6.0.9000"
# 
# $`authors@r`
# [1] "as.person(c(\n    \"Hadley Wickham <hadley@rstudio.com> [aut, cre]\",\n    \"Winston Chang [aut]\",\n    \"RStudio [cph]\",\n    \"R Core team [ctb] (Some namespace and vignette code extracted from base R)\"\n    ))"
# 
# $description
# [1] "Collection of package development tools."
# 
# $depends
# [1] "\nR (>= 3.0.2)"
# 
# $imports
# [1] "\nhttr (>= 0.4),\nRCurl,\nutils,\ntools,\nmethods,\nmemoise,\nwhisker,\nevaluate,\ndigest,\nrstudioapi,\njsonlite"
# 
# $suggests
# [1] "\ntestthat (>= 0.7),\nroxygen2 (>= 4.0.2),\nBiocInstaller,\nRcpp (>= 0.10.0),\nMASS,\nrmarkdown,\nknitr"
# 
# $license
# [1] "GPL (>= 2)"
# 
# $author
# [1] "Hadley Wickham [aut, cre],\n  Winston Chang [aut],\n  RStudio [cph],\n  R Core team [ctb] (Some namespace and vignette code extracted from base\n    R)"
# 
# $maintainer
# [1] "Hadley Wickham <hadley@rstudio.com>"
# 
# $built
# [1] "R 3.1.1; x86_64-w64-mingw32; 2014-09-30 08:59:32 UTC; windows"
# 
# $path
# [1] "Q:\\home\\apps\\rapptools\\apps\\r\\R-3.1.1\\library\\devtools"
# 
# attr(,"class")
# [1] "package"
```

### Unload package 

1. Current working directory corresponds to package project

  ```
## For package 'libr'
devtools::load_all()
# Loading libr
"libr" %in% loadedNamespaces()
# [1] TRUE
unloadPackage()
"libr" %in% loadedNamespaces()
# [1] FALSE
```

2. Explicit path to to package project

  ```
## For package 'libr'
devtools::load_all(pkg = "/path/to/package/project")
# Loading libr
"libr" %in% loadedNamespaces()
# [1] TRUE
unloadPackage(pkg = "/path/to/package/project")
"libr" %in% loadedNamespaces()
# [1] FALSE
```

3. Name of loaded package

  ```
require("devtools")
"devtools" %in% loadedNamespaces()
# [1] TRUE
unloadPackage(pkg = "devtools")
"devtools" %in% loadedNamespaces()
# [1] FALSE
```

## Convenience functions/methods

Is directory a package library?

```
isLibrary(R.home("library"))
# [1] TRUE
isLibrary("path/to/non-library/directory")
# [1] FALSE
```

Is package installed? 

```
isPackageInstalled("devtools")
# [1] TRUE
isPackageInstalled("some.package")
# [1] FALSE
``` 

Is package loaded? 

```
isPackageLoaded("devtools")
# [1] FALSE
require("devtools")
isPackageLoaded("devtools")
# [1] TRUE
```