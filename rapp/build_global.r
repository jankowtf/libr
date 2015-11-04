packrat::off()
require("reposr")
repos <- "q:/home/repos/r"
expandRepository(repos)
getRepositoryPathByType(repos = repos, type = "source")
asRepository
devtools::build(path = )

