clear all
set more off

cap cd "/Users/paulapereda/Documents/OneDrive - Universidad de Montevideo/Econometrics II/Proyecto Final/ech_eut"

/* Mergeo la ECH y la EUT */
 
use "eut_2013_13.dta"
rename numero bc_correlat
rename nper bc_nper

save eut_2013_edited, replace

use "p13", clear

merge 1:1 bc_correlat bc_nper using "/Users/paulapereda/Documents/OneDrive - Universidad de Montevideo/Econometrics II/Proyecto Final/ech_eut/eut_2013_edited.dta", force

save eut_ech_merge, replace

/* Me quedo œnicamente con los que efectivamente se mergearon */

keep if _merge == 3

/* Me quedo con aquellos cuya relaci—n de parentesco es o jefe o c—nyuge */ 

keep if bc_pe4 == 2 | bc_pe4 == 1

/* Check */  

bys bc_correlat: egen check = min(bc_pe4)

tab check

drop if check == 2

/* Me quedo solo con las parejas */ 

gen pareja = 1 if bc_pe4 == 2

recode pareja (.=0) 

bys bc_correlat: egen hogares = max(pareja)

tab hogares

keep if hogares == 1

bys bc_correlat: egen aux = sum(bc_pe2)

/* Me quedo solo con las parejas heterosexuales */

gen parejas_hetero = 1 if aux == 3

keep if parejas_hetero == 1

bys bc_correlat: egen ing_n = sum(bc_pt1)

gen share_fem = bc_pt1/ing_n if bc_pe2 == 2

save base_ok, replace

/* ÀHabemus discontinuidad? */

hist share_fem if share_fem>0 & share_fem!=.

save base_ok, replace
gen counter=.


/* ÁMil gracias a Horacio Rueda! */
