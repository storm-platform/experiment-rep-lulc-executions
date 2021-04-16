# Install devtools, rmarkdown, knitr, testthat and Rcpp if not already available
install.packages(c("rmarkdown", "knitr",
                   "testthat", "remotes",
                   "qpdf", "terra",
                   "rstac", "IRkernel"), repos = "https://cran.uni-muenster.de")

#
# check the environment type
#
remotes::install_deps(dependencies = TRUE)

#
# install sits package
#
remotes::install_github('e-sensing/sits@v0.10.0', dependencies = FALSE)
remotes::install_github("e-sensing/inSitu@772e0dda670d7bb5afcf68473b124287387be87a")
remotes::install_github("e-sensing/sitsdata@fb7aa1d268158e70561ffc97c2a7508137a39369")
