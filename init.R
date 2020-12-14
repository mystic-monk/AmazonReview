# init.R
#
# R code to install packages if not already installed
#

my_packages = c("ggplot2","e1071","caret","randomForest", "dplyr","data.table")

install_if_missing = function(p) {
  if (p %in% rownames(installed.packages()) == FALSE) {
    install.packages(p)
  }
}

invisible(sapply(my_packages, install_if_missing))

library(caret)
library(irlba)
library(randomForest)

