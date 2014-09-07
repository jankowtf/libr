packrat::off()
require("rapp.core.repos")
repos <- "q:/home/repos/r"
expandRepository(repos)
getRepositoryPathByType(repos = repos, type = "source")
asRepository
devtools::build(path = )

