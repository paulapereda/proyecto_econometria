library(tidyverse)
library(rdrobust)
library(rdd)

source(here::here("src", "3_tidy.R"))

# Primer intento: total de ingresos (yt)

Y <- data_yt$outcome
X <- data_yt$share_fem
T <- data_yt$treatment
T_X <- T*X

out_yt <- rdplot(Y, X, nbins = c(10,10), 
              c = 0.5, binselect = 'esmv')
summary(out_yt)

## (i) 20 Quantile-spaced bins (n° bins del paper)

out_yt <- rdplot(Y, X, nbins = c(10,10), c = 0.500000001,
             binselect = 'qs', cex.axis = 1.5, 
             cex.lab = 1.5, x.label = 'Share earned by the wife',
             y.label = 'Number of couples', 
             title = 'Distribution of Relative Income (ECH-EUT data, 2013)') 

summary(out_yt)

## (ii) Probando con el paquete RDD

reg_yt <- RDestimate(outcome ~ share_fem, data = data_yt, cutpoint = 0.500000001)

plot(reg_yt)

title(main = "Distribution of Relative Income (ECH-EUT data, 2013)", 
      xlab = "Share earned by the wife",
      ylab = "Number of couples")

# Segundo intento: ingresos laborales (yl)

Y <- data_yl$outcome2
X <- data_yl$share_fem2
T <- data_yl$treatment
T_X <- T*X

out_yl <- rdplot(Y, X, nbins = c(10,10), 
              c = 0.5, binselect = 'esmv')
summary(out_yl)

## (i) 20 Quantile-spaced bins (n° bins del paper)

out_yl <- rdplot(Y, X, nbins = c(10,10), c = 0.500000001,
              binselect = 'qs', cex.axis = 1.5, 
              cex.lab = 1.5, x.label = 'Share earned by the wife',
              y.label = 'Number of couples', 
              title = 'Distribution of Relative Income (ECH data)') 

summary(out_yl)

## (ii) Probando con el paquete RDD

reg_yl <- RDestimate(outcome2 ~ share_fem2, data = data_yl, cutpoint = 0.500000001)

plot(reg_yl)

title(main = "Distribution of Relative Income (ECH-EUT data, 2013)", 
      xlab = "Share earned by the wife",
      ylab = "Number of couples")

