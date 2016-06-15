







use "F:\temp_data\panel_data", clear

cd "C:\Users\jkwok\Desktop\result_iv__mom_report_work_status"

global demographic_panel age_w BIO_SEX i.race num_siblings_w AH_PVT i.no_mom_w i.no_dad_w age_mom_w age_dad_w

global mom_occupation_panel i.res_mom_occupation_w

global mom_edu_panel i.res_mom_educ_w i.mom_edu_impute_indicator_w 

global dad_educ_career_panel res_dad_work_hours_v2_w  i.res_dad_occupation_w  i.dwh_impute_indicator_w i.res_dad_educ_w i.dad_edu_impute_indicator_w 

global family_income_panel family_income_1994 i.fam_income_impute_ind

global supervision_panel  i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w

global time_panel  i.month_year_w


foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w {


	ivregress 2sls `yvariable' zConscientiousness_w1 i.mwh_impute_indicator_w (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1)[pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_iv, ctitle(`yvariable') excel  append
	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1)[pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_iv, ctitle(`yvariable') excel  append

	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1)[pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_iv, ctitle(`yvariable') excel  append
	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1)[pw=GSWGT] if wave == 1 , vce(cluster AID)
	outreg2 using `yvariable'_iv, ctitle(`yvariable') excel  append

	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1)[pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_iv, word ctitle(`yvariable') excel  append 

	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel  (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1) [pw=GSWGT] if wave == 1, vce(cluster AID)                           
	outreg2 using `yvariable'_iv, word ctitle(`yvariable') excel  append

	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1) [pw=GSWGT] if wave == 1, vce(cluster AID)                           
	outreg2 using `yvariable'_iv, word ctitle(`yvariable') excel  append 
	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel  (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1) [pw=GSWGT] if wave == 1, vce(cluster AID)                           
	outreg2 using `yvariable'_iv, word ctitle(`yvariable') excel  append 
	
	
	
	
	

}




foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w {


	ivregress 2sls `yvariable' zConscientiousness_w1 i.mwh_impute_indicator_w (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1)[pw=GSWGT] , vce(cluster AID)
	outreg2 using `yvariable'_iv_2waves, ctitle(`yvariable') excel  append
	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1)[pw=GSWGT] , vce(cluster AID)
	outreg2 using `yvariable'_iv_2waves, ctitle(`yvariable') excel  append

	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1)[pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable'_iv_2waves, ctitle(`yvariable') excel  append
	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1)[pw=GSWGT]  , vce(cluster AID)
	outreg2 using `yvariable'_iv_2waves, ctitle(`yvariable') excel  append

	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1)[pw=GSWGT] , vce(cluster AID)
	outreg2 using `yvariable'_iv_2waves, word ctitle(`yvariable') excel  append 

	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel  (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1) [pw=GSWGT] , vce(cluster AID)                           
	outreg2 using `yvariable'_iv_2waves, word ctitle(`yvariable') excel  append

	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1) [pw=GSWGT], vce(cluster AID)                           
	outreg2 using `yvariable'_iv_2waves, word ctitle(`yvariable') excel  append 
	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel  (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = i.mom_full_time_mom_report_v2_w i.mom_full_time_mom_report_v2_w#c.zConscientiousness_w1) [pw=GSWGT] , vce(cluster AID)                           
	outreg2 using `yvariable'_iv_2waves, word ctitle(`yvariable') excel  append 
	
	
	
	
	

}


*good!!

xi: xtivreg2 regular_cigarette_w zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel ( res_mom_work_hours_v2_w  mwh_conscientious_w1   =   mom_mom3   mom_mom3_conscientious_w1 ) [pw=GSWGT] if wave == 1, r fe cluster(FAMID)
xi: xtivreg2  regular_cigarette_w zNeuroticism_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel ( res_mom_work_hours_v2_w  mwh_zNeuroticism_w1  =   mom_mom3   mom_mom3_zNeuroticism_w1 ) [pw=GSWGT] if wave == 1, r fe cluster(FAMID)

tab mom_full_time_mom_report_v2_w, gen(mom_mom)

gen mom_mom1_conscientious_w1 = mom_mom1*zConscientiousness_w1
gen mom_mom2_conscientious_w1 = mom_mom2*zConscientiousness_w1
gen mom_mom3_conscientious_w1 = mom_mom3*zConscientiousness_w1

gen mom_mom3_zNeuroticism_w1 = mom_mom3*zNeuroticism_w1


tab mom_full_time_child_report_v2_w, gen(mom_child)

gen mom_child1_conscientious_w1 = mom_child1*zConscientiousness_w1
gen mom_child2_conscientious_w1 = mom_child2*zConscientiousness_w1
gen mom_child3_conscientious_w1 = mom_child3*zConscientiousness_w1

gen mwh_conscientious_w1 = res_mom_work_hours_v2_w*zConscientiousness_w1
gen IV_conscientious_w = youngest_sib_age_w*zConscientiousness_w1

gen mwh_zNeuroticism_w1 = res_mom_work_hours_v2_w*zNeuroticism_w1

*gen mwh_w1 = res_mom_work_hours_v2_w*zExtraversion_w1
*gen IV2_w = youngest_sib_age_w*zExtraversion_w1



xtset FAMID


xtset AID2


xtset PSUSCID_w


foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w {


	xi: xtivreg2  `yvariable' zConscientiousness_w1 i.mwh_impute_indicator_w (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w)[pw=GSWGT], r fe cluster(PSUSCID_w)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)
	
	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w)[pw=GSWGT], r fe cluster(PSUSCID_w)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)

	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w)[pw=GSWGT], r fe cluster(PSUSCID_w)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)
	
	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w)[pw=GSWGT], r fe cluster(PSUSCID_w)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)

	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel  (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w)[pw=GSWGT] ,r fe cluster(PSUSCID_w)
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)


	
	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel  (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w) [pw=GSWGT],r fe cluster(PSUSCID_w)                      
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)

	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel  (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w) [pw=GSWGT], r fe cluster(PSUSCID_w)                      
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)
	
	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w) [pw=GSWGT], r fe cluster(PSUSCID_w)                       
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)
	
	
	

}


