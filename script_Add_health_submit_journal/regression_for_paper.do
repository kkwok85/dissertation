set matsize 10000

cd "$data_output"
use panel_data, clear
cd "$result_output"


generate int_zConscientiousness_w1 =  res_mom_work_hours_v2_w*zConscientiousness_w1
generate int_zNeuroticism_w1 =  res_mom_work_hours_v2_w*zNeuroticism_w1
generate int_zExtraversion_w1 =  res_mom_work_hours_v2_w*zExtraversion_w1

label variable res_mom_work_hours_v2_w "Mom work hours (MWH)" 
label variable zConscientiousness_w1 "Child's conscient." 
label variable zNeuroticism_w1 "Child's neuroticism" 
label variable zExtraversion_w1 "Child's extraversion" 

label variable int_zConscientiousness_w1 "MWH X child's conscient." 
label variable int_zNeuroticism_w1 "MWH X child's neuroticism" 
label variable int_zExtraversion_w1 "MWH X child's extraversion" 


foreach yvariable in BMI_zscore_w overweight_w obese_w   {
 
 
reg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w [pw=GSWGT], vce(cluster PSUSCID_w) 
outreg2 using weight-related, ctitle("No control") tex excel  nocons nor2  keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 )    append label
 
 
reg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
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
outreg2 using weight-related, ctitle("Add All") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 ) append label





	
areg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
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
outreg2 using weight-related, ctitle("Individual FE") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1) append label


}






***************************************************





foreach yvariable in  diet_for_weight_w exercise_for_weight_w vege_fruits_dum_w   {
 
 
reg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w [pw=GSWGT], vce(cluster PSUSCID_w) 
outreg2 using eat-ex-related, ctitle("No control") tex excel  nocons nor2  keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 )    append label
 
 
reg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
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
outreg2 using eat-ex-related, ctitle("Add All") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 ) append label





	
areg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
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
outreg2 using eat-ex-related, ctitle("Individual FE") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1) append label


}




***************************************************



foreach yvariable in  how_many_cigarettes_w how_many_days_smoke_w  total_smoke_a_month_w   {
 
 
reg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w [pw=GSWGT], vce(cluster PSUSCID_w) 
outreg2 using smoking-related, ctitle("No control") tex excel  nocons nor2  keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 )    append label
 
 
reg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
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
outreg2 using smoking-related, ctitle("Add All") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 ) append label





	
areg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
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
outreg2 using smoking-related, ctitle("Individual FE") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1) append label


}




***************************************************



foreach yvariable in  drink_amount_w drink_days_v2_w  total_drink_per_year_w   {
 
 
reg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w [pw=GSWGT], vce(cluster PSUSCID_w) 
outreg2 using alcohol-related, ctitle("No control") tex excel  nocons nor2  keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 )    append label
 
 
reg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
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
outreg2 using alcohol-related, ctitle("Add All") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 ) append label





	
areg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
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
outreg2 using alcohol-related, ctitle("Individual FE") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1) append label


}



***************************************************



foreach yvariable in  ever_marijuana_30_w ever_all_but_m_drugs_w   {
 
 
reg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w [pw=GSWGT], vce(cluster PSUSCID_w) 
outreg2 using drug-related, ctitle("No control") tex excel  nocons nor2  keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 )    append label
 
 
reg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
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
outreg2 using drug-related, ctitle("Add All") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 ) append label





	
areg `yvariable'  res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1 i.mwh_impute_indicator_w ///
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
outreg2 using drug-related, ctitle("Individual FE") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  int_zConscientiousness_w1 int_zNeuroticism_w1 int_zExtraversion_w1) append label


}



