library(tidyverse)

# Tasks:
#    (i) agrupar por hogar e construir el wifeincome y husbandincome,
#    (ii) construir el relativeincome,
#    (iii) construir una dummy que cuando el relative income sea más grande que 0.5, sea TRUE (1)


data <- readRDS("data/ech_eut_filtered.rds") %>% 
  mutate(treatment = ifelse(share_fem > 0.5, 1, 0)) %>%
  mutate(share_fem = round(share_fem, 2)) %>% 
  filter(sexo == 2) %>% 
  group_by(share_fem) %>% 
  mutate(outcome = peso_eut/sum(peso_eut)) # is this really ok?

#saveRDS(data, 'data/data.rds')

data_filtered_age <- data %>% 
  filter(bc_pe3 < 66 | bc_pe3 > 17)

#saveRDS(data_filtered_age, 'data/data_filtered_age.rds')

ech_2013 <- readRDS("data/ech_filtered.rds") %>% 
  mutate(treatment = ifelse(share_fem > 0.5, 1, 0)) %>%
  mutate(share_fem = round(share_fem, 2)) %>% 
  filter(bc_pe2 == 2) %>% 
  group_by(share_fem) %>% 
  mutate(outcome = bc_pesoan/sum(bc_pesoan)) # is this really ok?


