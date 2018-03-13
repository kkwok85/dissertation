set matsize 10000
* boostrap test for conscientious X MWH
program drop hausmantest2
program hausmantest2, eclass
tempname b bols bfe
reg total_smoke_a_month_w  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
c.zConscientiousness_w1##c.res_dad_work_hours_v2_w  c.zNeuroticism_w1##c.res_dad_work_hours_v2_w c.zExtraversion_w1##c.res_dad_work_hours_v2_w  i.dwh_impute_indicator_w ///
c.zConscientiousness_w1##c.age_w c.zConscientiousness_w1##i.BIO_SEX c.zConscientiousness_w1##i.race c.zConscientiousness_w1##c.num_siblings_w c.zConscientiousness_w1##c.AH_PVT c.zConscientiousness_w1##i.no_mom_w c.zConscientiousness_w1##i.no_dad_w c.zConscientiousness_w1##c.age_mom_w c.zConscientiousness_w1##c.age_dad_w	///
c.zConscientiousness_w1##i.res_mom_occupation_w	///
c.zConscientiousness_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zConscientiousness_w1##i.res_dad_occupation_w c.zConscientiousness_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zConscientiousness_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zConscientiousness_w1##i.month_year_w	 ///
c.zNeuroticism_w1##c.age_w c.zNeuroticism_w1##i.BIO_SEX c.zNeuroticism_w1##i.race c.zNeuroticism_w1##c.num_siblings_w c.zNeuroticism_w1##c.AH_PVT c.zNeuroticism_w1##i.no_mom_w c.zNeuroticism_w1##i.no_dad_w c.zNeuroticism_w1##c.age_mom_w c.zNeuroticism_w1##c.age_dad_w ///
c.zNeuroticism_w1##i.res_mom_occupation_w ///
c.zNeuroticism_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zNeuroticism_w1##i.res_dad_occupation_w c.zNeuroticism_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zNeuroticism_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zNeuroticism_w1##i.month_year_w	 ///
c.zExtraversion_w1##c.age_w c.zExtraversion_w1##i.BIO_SEX c.zExtraversion_w1##i.race c.zExtraversion_w1##c.num_siblings_w c.zExtraversion_w1##c.AH_PVT c.zExtraversion_w1##i.no_mom_w c.zExtraversion_w1##i.no_dad_w c.zExtraversion_w1##c.age_mom_w c.zExtraversion_w1##c.age_dad_w  ///
c.zExtraversion_w1##i.res_mom_occupation_w  ///
c.zExtraversion_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zExtraversion_w1##i.res_dad_occupation_w c.zExtraversion_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zExtraversion_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zExtraversion_w1##i.month_year_w	///
[pw=GSWGT], vce(cluster PSUSCID_w)
matrix `bols' = e(b)
areg total_smoke_a_month_w  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
c.zConscientiousness_w1##c.res_dad_work_hours_v2_w  c.zNeuroticism_w1##c.res_dad_work_hours_v2_w c.zExtraversion_w1##c.res_dad_work_hours_v2_w  i.dwh_impute_indicator_w ///
c.zConscientiousness_w1##c.age_w c.zConscientiousness_w1##i.BIO_SEX c.zConscientiousness_w1##i.race c.zConscientiousness_w1##c.num_siblings_w c.zConscientiousness_w1##c.AH_PVT c.zConscientiousness_w1##i.no_mom_w c.zConscientiousness_w1##i.no_dad_w c.zConscientiousness_w1##c.age_mom_w c.zConscientiousness_w1##c.age_dad_w	///
c.zConscientiousness_w1##i.res_mom_occupation_w	///
c.zConscientiousness_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zConscientiousness_w1##i.res_dad_occupation_w c.zConscientiousness_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zConscientiousness_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zConscientiousness_w1##i.month_year_w	 ///
c.zNeuroticism_w1##c.age_w c.zNeuroticism_w1##i.BIO_SEX c.zNeuroticism_w1##i.race c.zNeuroticism_w1##c.num_siblings_w c.zNeuroticism_w1##c.AH_PVT c.zNeuroticism_w1##i.no_mom_w c.zNeuroticism_w1##i.no_dad_w c.zNeuroticism_w1##c.age_mom_w c.zNeuroticism_w1##c.age_dad_w ///
c.zNeuroticism_w1##i.res_mom_occupation_w ///
c.zNeuroticism_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zNeuroticism_w1##i.res_dad_occupation_w c.zNeuroticism_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zNeuroticism_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zNeuroticism_w1##i.month_year_w	 ///
c.zExtraversion_w1##c.age_w c.zExtraversion_w1##i.BIO_SEX c.zExtraversion_w1##i.race c.zExtraversion_w1##c.num_siblings_w c.zExtraversion_w1##c.AH_PVT c.zExtraversion_w1##i.no_mom_w c.zExtraversion_w1##i.no_dad_w c.zExtraversion_w1##c.age_mom_w c.zExtraversion_w1##c.age_dad_w  ///
c.zExtraversion_w1##i.res_mom_occupation_w  ///
c.zExtraversion_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zExtraversion_w1##i.res_dad_occupation_w c.zExtraversion_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zExtraversion_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zExtraversion_w1##i.month_year_w	///
[pw=GSWGT],absorb(AID) vce(cluster PSUSCID_w)
matrix `bfe' = e(b)
matrix `b' = `bols' - `bfe'
ereturn post `b'
end


set seed 1
bootstrap _b, reps(50): hausmantest2





* http://www.stata.com/manuals13/rsuest.pdf
*https://www.stata.com/statalist/archive/2007-09/msg00282.html

bysort AID: center vege_fruits_dum_w  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 mwh_impute_indicator_w, casewise
reg c_vege_fruits_dum_w c_res_mom_work_hours_v2_w c_zConscientiousness_w1 c_zNeuroticism_w1 c_zExtraversion_w1 c_int_zConscientiousness_w1 c_int_zNeuroticism_w1 c_int_zExtraversion_w1 c_mwh_impute_indicator_w, nocons



svyset PSUSCID_w [pweight=GSWGT]

svy: reg vege_fruits_dum_w res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1 int_zConscientiousness_w1  int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w 
estimates store t1

xtreg vege_fruits_dum_w  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w , i(AID) fe
estimates store t2

svy: reg c_vege_fruits_dum_w c_res_mom_work_hours_v2_w c_zConscientiousness_w1 c_zNeuroticism_w1 c_zExtraversion_w1 c_int_zConscientiousness_w1 c_int_zNeuroticism_w1 c_int_zExtraversion_w1 c_mwh_impute_indicator_w, nocons
estimates store t3

suest t1 t3 ,  svy


test [t1]res_mom_work_hours_v2_w = [t3]c_res_mom_work_hours_v2_w, cons




program drop hausmantest2
program hausmantest2, eclass
tempname b bols bfe
reg vege_fruits_dum_w  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w [pw=GSWGT], vce(cluster PSUSCID_w)
matrix `bols' = e(b)

areg vege_fruits_dum_w  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w [pw=GSWGT], absorb(AID) vce(cluster PSUSCID_w)
matrix `bfe' = e(b)
matrix `b' = `bols' - `bfe'
ereturn post `b'
end
set seed 1
bootstrap _b, reps(100): hausmantest2




* how to finish centering:

use http://www.stata-press.com/data/r13/fvex, clear
regress y i.group age
tabulate group, generate(g)
regress y g2 g3 age


 
  use http://dss.princeton.edu/training/Panel101.dta, clear
  
  xtset country year
  xtreg y x1 i.opinion, fe
  
  tabulate opinion, generate(op)

  
  bysort country: center y x1 op2 op3 op4, casewise
  reg c_y c_x1 c_op2 c_op3 c_op4, nocons

  
  
  
  
  
  
  
  
  
  
  
  

how_many_cigarettes_w 
total_smoke_a_month_w 
ever_marijuana_30_w 
BMI_zscore_w 
overweight_w  
vege_fruits_dum_w  
  
log using "C:\Users\AYSPS\Desktop\OLS_vs_FE.smcl"
  
 foreach  yvariable in how_many_days_smoke_w total_smoke_a_month_w ever_marijuana_30_w BMI_zscore_w overweight_w  vege_fruits_dum_w {   
 
quietly reg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
c.zConscientiousness_w1##c.res_dad_work_hours_v2_w  c.zNeuroticism_w1##c.res_dad_work_hours_v2_w c.zExtraversion_w1##c.res_dad_work_hours_v2_w  i.dwh_impute_indicator_w ///
c.zConscientiousness_w1##c.age_w c.zConscientiousness_w1##i.BIO_SEX c.zConscientiousness_w1##i.race c.zConscientiousness_w1##c.num_siblings_w c.zConscientiousness_w1##c.AH_PVT c.zConscientiousness_w1##i.no_mom_w c.zConscientiousness_w1##i.no_dad_w c.zConscientiousness_w1##c.age_mom_w c.zConscientiousness_w1##c.age_dad_w	///
c.zConscientiousness_w1##i.res_mom_occupation_w	///
c.zConscientiousness_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zConscientiousness_w1##i.res_dad_occupation_w c.zConscientiousness_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zConscientiousness_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zConscientiousness_w1##i.month_year_w	 ///
c.zNeuroticism_w1##c.age_w c.zNeuroticism_w1##i.BIO_SEX c.zNeuroticism_w1##i.race c.zNeuroticism_w1##c.num_siblings_w c.zNeuroticism_w1##c.AH_PVT c.zNeuroticism_w1##i.no_mom_w c.zNeuroticism_w1##i.no_dad_w c.zNeuroticism_w1##c.age_mom_w c.zNeuroticism_w1##c.age_dad_w ///
c.zNeuroticism_w1##i.res_mom_occupation_w ///
c.zNeuroticism_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zNeuroticism_w1##i.res_dad_occupation_w c.zNeuroticism_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zNeuroticism_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zNeuroticism_w1##i.month_year_w	 ///
c.zExtraversion_w1##c.age_w c.zExtraversion_w1##i.BIO_SEX c.zExtraversion_w1##i.race c.zExtraversion_w1##c.num_siblings_w c.zExtraversion_w1##c.AH_PVT c.zExtraversion_w1##i.no_mom_w c.zExtraversion_w1##i.no_dad_w c.zExtraversion_w1##c.age_mom_w c.zExtraversion_w1##c.age_dad_w  ///
c.zExtraversion_w1##i.res_mom_occupation_w  ///
c.zExtraversion_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zExtraversion_w1##i.res_dad_occupation_w c.zExtraversion_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zExtraversion_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zExtraversion_w1##i.month_year_w	///
[pw=GSWGT], vce(cluster PSUSCID_w)
estimates store OLS_`yvariable'


quietly areg `yvariable'   res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
c.zConscientiousness_w1##c.res_dad_work_hours_v2_w  c.zNeuroticism_w1##c.res_dad_work_hours_v2_w c.zExtraversion_w1##c.res_dad_work_hours_v2_w  i.dwh_impute_indicator_w ///
c.zConscientiousness_w1##c.age_w c.zConscientiousness_w1##i.BIO_SEX c.zConscientiousness_w1##i.race c.zConscientiousness_w1##c.num_siblings_w c.zConscientiousness_w1##c.AH_PVT c.zConscientiousness_w1##i.no_mom_w c.zConscientiousness_w1##i.no_dad_w c.zConscientiousness_w1##c.age_mom_w c.zConscientiousness_w1##c.age_dad_w	///
c.zConscientiousness_w1##i.res_mom_occupation_w	///
c.zConscientiousness_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zConscientiousness_w1##i.res_dad_occupation_w c.zConscientiousness_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zConscientiousness_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zConscientiousness_w1##i.month_year_w	 ///
c.zNeuroticism_w1##c.age_w c.zNeuroticism_w1##i.BIO_SEX c.zNeuroticism_w1##i.race c.zNeuroticism_w1##c.num_siblings_w c.zNeuroticism_w1##c.AH_PVT c.zNeuroticism_w1##i.no_mom_w c.zNeuroticism_w1##i.no_dad_w c.zNeuroticism_w1##c.age_mom_w c.zNeuroticism_w1##c.age_dad_w ///
c.zNeuroticism_w1##i.res_mom_occupation_w ///
c.zNeuroticism_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zNeuroticism_w1##i.res_dad_occupation_w c.zNeuroticism_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zNeuroticism_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zNeuroticism_w1##i.month_year_w	 ///
c.zExtraversion_w1##c.age_w c.zExtraversion_w1##i.BIO_SEX c.zExtraversion_w1##i.race c.zExtraversion_w1##c.num_siblings_w c.zExtraversion_w1##c.AH_PVT c.zExtraversion_w1##i.no_mom_w c.zExtraversion_w1##i.no_dad_w c.zExtraversion_w1##c.age_mom_w c.zExtraversion_w1##c.age_dad_w  ///
c.zExtraversion_w1##i.res_mom_occupation_w  ///
c.zExtraversion_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zExtraversion_w1##i.res_dad_occupation_w c.zExtraversion_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zExtraversion_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zExtraversion_w1##i.month_year_w	///
[pw=GSWGT],absorb(AID) vce(cluster PSUSCID_w)
estimates store fixed_`yvariable'

hausman fixed_`yvariable' OLS_`yvariable', force


}

log close




log using "C:\Users\AYSPS\Desktop\OLS_vs_FE2.smcl"


quietly reg how_many_days_smoke_w  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
c.zConscientiousness_w1##c.res_dad_work_hours_v2_w  c.zNeuroticism_w1##c.res_dad_work_hours_v2_w c.zExtraversion_w1##c.res_dad_work_hours_v2_w  i.dwh_impute_indicator_w ///
c.zConscientiousness_w1##c.age_w c.zConscientiousness_w1##i.BIO_SEX c.zConscientiousness_w1##i.race c.zConscientiousness_w1##c.num_siblings_w c.zConscientiousness_w1##c.AH_PVT c.zConscientiousness_w1##i.no_mom_w c.zConscientiousness_w1##i.no_dad_w c.zConscientiousness_w1##c.age_mom_w c.zConscientiousness_w1##c.age_dad_w	///
c.zConscientiousness_w1##i.res_mom_occupation_w	///
c.zConscientiousness_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zConscientiousness_w1##i.res_dad_occupation_w c.zConscientiousness_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zConscientiousness_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zConscientiousness_w1##i.month_year_w	 ///
c.zNeuroticism_w1##c.age_w c.zNeuroticism_w1##i.BIO_SEX c.zNeuroticism_w1##i.race c.zNeuroticism_w1##c.num_siblings_w c.zNeuroticism_w1##c.AH_PVT c.zNeuroticism_w1##i.no_mom_w c.zNeuroticism_w1##i.no_dad_w c.zNeuroticism_w1##c.age_mom_w c.zNeuroticism_w1##c.age_dad_w ///
c.zNeuroticism_w1##i.res_mom_occupation_w ///
c.zNeuroticism_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zNeuroticism_w1##i.res_dad_occupation_w c.zNeuroticism_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zNeuroticism_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zNeuroticism_w1##i.month_year_w	 ///
c.zExtraversion_w1##c.age_w c.zExtraversion_w1##i.BIO_SEX c.zExtraversion_w1##i.race c.zExtraversion_w1##c.num_siblings_w c.zExtraversion_w1##c.AH_PVT c.zExtraversion_w1##i.no_mom_w c.zExtraversion_w1##i.no_dad_w c.zExtraversion_w1##c.age_mom_w c.zExtraversion_w1##c.age_dad_w  ///
c.zExtraversion_w1##i.res_mom_occupation_w  ///
c.zExtraversion_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zExtraversion_w1##i.res_dad_occupation_w c.zExtraversion_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zExtraversion_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zExtraversion_w1##i.month_year_w	///
[pw=GSWGT], vce(cluster PSUSCID_w)
estimates store OLS_how_many_days_smoke_w


quietly areg how_many_days_smoke_w   res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
c.zConscientiousness_w1##c.res_dad_work_hours_v2_w  c.zNeuroticism_w1##c.res_dad_work_hours_v2_w c.zExtraversion_w1##c.res_dad_work_hours_v2_w  i.dwh_impute_indicator_w ///
c.zConscientiousness_w1##c.age_w c.zConscientiousness_w1##i.BIO_SEX c.zConscientiousness_w1##i.race c.zConscientiousness_w1##c.num_siblings_w c.zConscientiousness_w1##c.AH_PVT c.zConscientiousness_w1##i.no_mom_w c.zConscientiousness_w1##i.no_dad_w c.zConscientiousness_w1##c.age_mom_w c.zConscientiousness_w1##c.age_dad_w	///
c.zConscientiousness_w1##i.res_mom_occupation_w	///
c.zConscientiousness_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zConscientiousness_w1##i.res_dad_occupation_w c.zConscientiousness_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zConscientiousness_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zConscientiousness_w1##i.month_year_w	 ///
c.zNeuroticism_w1##c.age_w c.zNeuroticism_w1##i.BIO_SEX c.zNeuroticism_w1##i.race c.zNeuroticism_w1##c.num_siblings_w c.zNeuroticism_w1##c.AH_PVT c.zNeuroticism_w1##i.no_mom_w c.zNeuroticism_w1##i.no_dad_w c.zNeuroticism_w1##c.age_mom_w c.zNeuroticism_w1##c.age_dad_w ///
c.zNeuroticism_w1##i.res_mom_occupation_w ///
c.zNeuroticism_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zNeuroticism_w1##i.res_dad_occupation_w c.zNeuroticism_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zNeuroticism_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zNeuroticism_w1##i.month_year_w	 ///
c.zExtraversion_w1##c.age_w c.zExtraversion_w1##i.BIO_SEX c.zExtraversion_w1##i.race c.zExtraversion_w1##c.num_siblings_w c.zExtraversion_w1##c.AH_PVT c.zExtraversion_w1##i.no_mom_w c.zExtraversion_w1##i.no_dad_w c.zExtraversion_w1##c.age_mom_w c.zExtraversion_w1##c.age_dad_w  ///
c.zExtraversion_w1##i.res_mom_occupation_w  ///
c.zExtraversion_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zExtraversion_w1##i.res_dad_occupation_w c.zExtraversion_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zExtraversion_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zExtraversion_w1##i.month_year_w	///
[pw=GSWGT],absorb(AID) vce(cluster PSUSCID_w)
estimates store fixed_how_many_days_smoke_w

hausman fixed_how_many_days_smoke_w OLS_how_many_days_smoke_w, force
log close
