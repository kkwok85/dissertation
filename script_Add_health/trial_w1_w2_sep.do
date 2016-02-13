








use "F:\temp_data\panel_data", clear

cd "C:\Users\jkwok\Desktop\result_wave1_wave2_sep"

global demographic_panel age_w BIO_SEX i.race num_siblings_w AH_PVT i.no_mom_w i.no_dad_w age_mom_w age_dad_w

global mom_occupation_panel i.res_mom_occupation_w

global mom_edu_panel i.res_mom_educ_w i.mom_edu_impute_indicator_w 

global dad_educ_career_panel res_dad_work_hours_v2_w  i.res_dad_occupation_w  i.dwh_impute_indicator_w i.res_dad_educ_w i.dad_edu_impute_indicator_w 

global family_income_panel family_income_1994 i.fam_income_impute_ind

global supervision_panel  i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w

global time_panel  i.month_year_w



forvalues i = 1(1)2 {


foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w {


	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w [pw=GSWGT] if wave == `i', vce(cluster AID)
	outreg2 using `yvariable'_w`i', ctitle("No control") excel  title("Table: `yvariable'")  keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1)    replace
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel [pw=GSWGT] if wave == `i', vce(cluster AID)
	outreg2 using `yvariable'_w`i', ctitle("+ Demographic") excel  keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append

	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel [pw=GSWGT] if wave == `i', vce(cluster AID)
	outreg2 using `yvariable'_w`i', ctitle("+ Mom occupation") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  [pw=GSWGT] if wave == `i', vce(cluster AID)
	outreg2 using `yvariable'_w`i', ctitle("+ Mom education") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel [pw=GSWGT] if wave == `i', vce(cluster AID)
	outreg2 using `yvariable'_w`i', ctitle("+ Dad career and education") tex    keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel [pw=GSWGT] if wave == `i', vce(cluster AID)
	outreg2 using `yvariable'_w`i', ctitle("+ Family income") excel    keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT] if wave == `i', vce(cluster AID)
	outreg2 using `yvariable'_w`i', ctitle("+ Supervision") excel    keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	

	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] if wave == `i', vce(cluster AID)
	outreg2 using `yvariable'_w`i', ctitle("+ Time") excel    keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	
	
}	

}
