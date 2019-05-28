library(tidyverse)
library(rdrobust)

source(here::here("src", "3_tidy.R"))

# Primer intento: total de ingresos (yt)

Y <- data_yt$outcome
X <- data_yt$share_fem
T <- data_yt$treatment
T_X <- T*X

out_yt <- rdplot(Y, X, nbins = c(10,10), 
              c = 0.5, binselect = 'esmv')
summary(out_yt)

## 20 Quantile-spaced bins (bins del paper)

out_yt <- rdplot(Y, X, nbins = c(10,10), c = 0.500000001,
             binselect = 'qs', cex.axis = 1.5, 
             cex.lab = 1.5, x.label = 'Share earned by the wife',
             y.label = 'Number of couples', 
             title = 'Distribution of Relative Income (ECH data)') 

summary(out_yt)

# Segundo intento: ingresos laborales (yl)

Y <- data_yl$outcome2
X <- data_yl$share_fem2
T <- data_yl$treatment
T_X <- T*X

out_yl <- rdplot(Y, X, nbins = c(10,10), 
              c = 0.5, binselect = 'esmv')
summary(out_yl)

## 20 Quantile-spaced bins (bins del paper)

out_yl <- rdplot(Y, X, nbins = c(10,10), c = 0.500000001,
              binselect = 'qs', cex.axis = 1.5, 
              cex.lab = 1.5, x.label = 'Share earned by the wife',
              y.label = 'Number of couples', 
              title = 'Distribution of Relative Income (ECH data)') 

summary(out_yl)
