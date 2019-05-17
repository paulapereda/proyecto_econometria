library(tidyverse)

tor::load_rds('data/')

#tengo que quedarme solo con las observaciones de la EUT que solo estén en la misma (sin contar el idnetificador)

ech_eut_2013 <- eut_2013 %>% 
  left_join(ech_2013, by = c("numero" = "bc_correlat"))
