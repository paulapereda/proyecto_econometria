library(tidyverse)
library(lpdensity)
library(rddensity)
library(rdlocrand)
library(rdrobust)

data <- readRDS("data/data.rds")

# Primer intento: usando ponderadores

Y <- data$outcome
X <- data$share_fem
T <- data$treatment
T_X <- T*X

out <- rdplot(Y, X, nbins = c(10,10), 
              c = 0.5, binselect = 'esmv')
summary(out)

## 20 Quantile-spaced bins

out <- rdplot(Y, X, nbins = c(10,10), c = 0.4,
             binselect = 'qs', cex.axis = 1.5, 
             cex.lab =1.5, x.label = 'Share earned by the wife',
             y.label = 'Fraction of couples', 
             title = 'Distribution of Relative Income (ECH data)') 

summary(out)

##
