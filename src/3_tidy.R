library(tidyverse)

# Tasks:
#    (i) agrupar por hogar e construir el wifeincome y husbandincome,
#    (ii) construir el relativeincome,
#    (iii) construir una dummy que cuando el relative income sea más grande que 0.5, sea TRUE (1)

data_yt <- readRDS("data/ech_eut_filtered.rds") %>% 
  mutate(treatment = ifelse(share_fem > 0.5, 1, 0),
         share_fem = round(share_fem, 2)) %>%
  filter(sexo == 2) %>% 
  filter(bc_pe3 < 66) %>% 
  filter(bc_pe3 > 17) %>% 
  filter(share_fem != 0) %>% 
  filter(share_fem != 1) %>% 
  filter(share_fem > 0.1) %>% 
  filter(share_fem < 0.9) %>% 
  group_by(share_fem) %>% 
  mutate(outcome = n())

data_yl <- readRDS("data/ech_eut_filtered.rds") %>% 
  mutate(treatment2 = ifelse(share_fem2 > 0.5, 1, 0),
         share_fem2 = round(share_fem2, 2)) %>%
  filter(sexo == 2) %>% 
  filter(bc_pe3 < 66) %>% 
  filter(bc_pe3 > 17) %>% 
  filter(share_fem2 != 0) %>% 
  filter(share_fem2 != 1) %>% 
  filter(share_fem2 > 0.1) %>% 
  filter(share_fem2 < 0.9) %>% 
  group_by(share_fem2) %>% 
  mutate(outcome2 = n())

ech_2013 <- readRDS("data/ech_filtered.rds") %>% 
  mutate(treatment = ifelse(share_fem > 0.5, 1, 0)) %>%
  mutate(share_fem = round(share_fem, 2)) %>% 
  filter(bc_pe2 == 2) %>% 
  filter(bc_pe3 < 66) %>% 
  filter(bc_pe3 > 17) %>% 
  filter(share_fem != 0) %>% 
  filter(share_fem != 1) %>% 
  filter(share_fem > 0.1) %>% 
  filter(share_fem < 0.9) %>% 
  group_by(share_fem) %>% 
  mutate(outcome2 = n())


