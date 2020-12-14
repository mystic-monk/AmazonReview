# init.R
#
# R code to install packages if not already installed
#

my_packages = c("ggplot2","randomForest","data.table")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p)
  }
}

invisible(sapply(my_packages, install_if_missing))

library(randomForest)

