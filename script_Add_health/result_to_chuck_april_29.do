use "F:\temp_data\panel_data", clear

cd "C:\Users\jkwok\Desktop\result_wh_conscientious"


foreach xvariable in zConscientiousness_w1 zNeuroticism_w1 {


foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w {



	reg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w [pw=GSWGT],  vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(OLS)
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel  [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(OLS)

	reg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(OLS)
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(OLS)

	reg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel [pw=GSWGT] , vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(OLS)

	reg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel $family_income_panel [pw=GSWGT] , vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(OLS)

	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT] , vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(OLS)	
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] , vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(OLS)	

	
	
}














foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w {



	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w [pw=GSWGT], absorb(FAMID) vce(cluster FAMID)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(FE, FAMILY)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel [pw=GSWGT], absorb(FAMID) vce(cluster FAMID)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(FE, FAMILY)

	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  [pw=GSWGT], absorb(FAMID) vce(cluster FAMID)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(FE, FAMILY)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel [pw=GSWGT], absorb(FAMID) vce(cluster FAMID)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(FE, FAMILY)

	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel [pw=GSWGT] , absorb(FAMID) vce(cluster FAMID)
	outreg2 using `yvariable'_`xvariable', word ctitle(`yvariable') excel  append addtext(FE, FAMILY)


	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel $family_income_panel [pw=GSWGT] , absorb(FAMID) vce(cluster FAMID)
	outreg2 using `yvariable'_`xvariable', word ctitle(`yvariable') excel  append addtext(FE, FAMILY)	

	
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT] , absorb(FAMID) vce(cluster FAMID)
	outreg2 using `yvariable'_`xvariable', word ctitle(`yvariable') excel  append addtext(FE, FAMILY)	
	
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] , absorb(FAMID) vce(cluster FAMID)
	outreg2 using `yvariable'_`xvariable', word ctitle(`yvariable') excel  append addtext(FE, FAMILY)	

	
	
}









foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w {



	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w [pw=GSWGT], absorb(AID) vce(cluster AID)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(FE, Individual)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel [pw=GSWGT], absorb(AID) vce(cluster AID)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(FE, Individual)

	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel i.mwh_impute_indicator_w [pw=GSWGT], absorb(AID) vce(cluster AID)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(FE, Individual)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel [pw=GSWGT], absorb(AID) vce(cluster AID)
	outreg2 using `yvariable'_`xvariable', ctitle(`yvariable') excel  append addtext(FE, Individual)

	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel [pw=GSWGT] , absorb(AID) vce(cluster AID)
	outreg2 using `yvariable'_`xvariable', word ctitle(`yvariable') excel  append addtext(FE, Individual)


	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel $family_income_panel [pw=GSWGT] , absorb(AID) vce(cluster AID)
	outreg2 using `yvariable'_`xvariable', word ctitle(`yvariable') excel  append addtext(FE, Individual)	

	
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT] , absorb(AID) vce(cluster AID)
	outreg2 using `yvariable'_`xvariable', word ctitle(`yvariable') excel  append addtext(FE, Individual)	
	
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`xvariable' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel  $mom_edu_panel $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] , absorb(AID) vce(cluster AID)
	outreg2 using `yvariable'_`xvariable', word ctitle(`yvariable') excel  append addtext(FE, Individual)	

	
	
}




}


