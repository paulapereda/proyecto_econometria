library(tidyverse)

ech_eut_2013 <- ech_eut_2013 %>% 
  filter(e30 == 1 | e30 == 2) %>% 
  filter(bc_pe3 < 66 | bc_pe3 > 17) %>% 
  group_by(numero) %>% 
  mutate(ingreso_personal_nucleo = sum(bc_pt1)) %>% 
  mutate(share_fem = ifelse(bc_pe2 == 2, bc_pt1/ingreso_personal_nucleo, NA))
  


keep if e30 == 1 | e30 == 2
keep if bc_pe3 < 66 | bc_pe3 > 17
tab e30
bys bc_correlat: egen ingreso_personal_nucleo=sum(bc_pt1)
gen share_fem = bc_pt1/ingreso_personal_nucleo if bc_pe2==2