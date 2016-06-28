* new regression

set maxvar 32767



cd "F:\temp_result"






/*

sum   tv_hours_per_week_w1 video_hours_per_week_w1 computer_games_hours_per_week_w1 tv_video_comp_games_w1  eat_breakfast_w1 ///
tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1 ///
ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1 ///
 BMI_w1 BMI_zscore_w1 overweight_w1 obese_w1 [aweight = GSWGT1]

*/







* imputation:


* reference: 
/*
http://www.colorado.edu/ibs/crs/workshops/Missing_Data_11-15-2011/SlidesHandout.pdf
https://www.ssc.wisc.edu/sscc/pubs/stata_mi_decide.htm
http://sites.stat.psu.edu/~jls/mifaq.html
http://www.csos.jhu.edu/contact/staff/jwayman_pub/wayman_multimp_aera2003.pdf
https://www3.nd.edu/~rwilliam/stats2/l13.pdf: good
*/






use  F:\temp_data\panel_data, clear




cd "D:\temp_result"


* need regression on sleep hours

global demographic_panel age_w BIO_SEX zNeuroticism_w1 zConscientiousness_w1 i.race num_siblings_w AH_PVT i.no_mom_w i.no_dad_w age_mom_w age_dad_w

global mom_occupation_panel i.res_mom_occupation_w

global mom_edu_panel i.res_mom_educ_w i.mom_edu_impute_indicator_w 

global dad_educ_career_panel res_dad_work_hours_v2_w  i.res_dad_occupation_w  i.dwh_impute_indicator_w i.res_dad_educ_w i.dad_edu_impute_indicator_w 

global family_income_panel family_income_1994 i.fam_income_impute_ind

global supervision_panel  i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w

global time_panel  i.month_year_w

/*

* change + to add, delete constant 

*************new *******

foreach personality in zConscientiousness_w1 zNeuroticism_w1 {


foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
ever_marijuana_30_w ever_all_but_m_drugs_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w {


	reg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("No control") tex excel  nocons nor2 title("Table: `yvariable'")  keep(c.res_mom_work_hours_v2_w##c.`personality')    replace
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Demographic") tex excel  nocons nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append

	reg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Mom occupation") tex excel   nocons nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Mom education") tex excel  nocons nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Dad career and education") tex excel   nocons nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append	
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Family income") tex excel  nocons  nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append	
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Supervision") tex  excel  nocons nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append	
	

	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Time") tex excel  nocons  nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append	
	
	
	
	
}	

}





cd "D:\temp_result_panel"


foreach personality in zConscientiousness_w1 zNeuroticism_w1 {


foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
ever_marijuana_30_w ever_all_but_m_drugs_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w {


	areg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w [pw=GSWGT], absorb(FAMID) vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality'_FE, ctitle("No control") tex excel  nocons nor2 title("Table: `yvariable'")  keep(c.res_mom_work_hours_v2_w##c.`personality')    replace addtext(FE, Sibling)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality'_FE, ctitle("Add Demographic") tex excel  nocons nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append  addtext(FE, Sibling)

	areg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel [pw=GSWGT], absorb(FAMID) vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality'_FE, ctitle("Add Mom occupation") tex excel   nocons nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append addtext(FE, Sibling)
	
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality'_FE, ctitle("Add Mom education") tex excel  nocons nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append	addtext(FE, Sibling)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality'_FE, ctitle("Add Dad career and education") tex excel   nocons nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append	 addtext(FE, Sibling)
	
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality'_FE, ctitle("Add Family income") tex excel  nocons  nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append	addtext(FE, Sibling)
	
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality'_FE, ctitle("Add Supervision") tex  excel  nocons nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append	addtext(FE, Sibling)
	

	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality'_FE, ctitle("Add Time") tex excel  nocons  nor2 keep(c.res_mom_work_hours_v2_w##c.`personality') append	addtext(FE, Sibling)
	
	
	
	
}	

}


*/


cd C:\Users\jkwok\Desktop\results

generate int_zConscientiousness_w1 =  res_mom_work_hours_v2_w*zConscientiousness_w1
generate int_zNeuroticism_w1 =  res_mom_work_hours_v2_w*zNeuroticism_w1

label variable res_mom_work_hours_v2_w "Mom work hours" 
label variable zConscientiousness_w1 "Child's conscient." 
label variable zNeuroticism_w1 "Child's neuroticism" 
label variable int_zConscientiousness_w1 "Mom work hours X child's conscient." 
label variable int_zNeuroticism_w1 "Mom work hours X child's neuroticism" 





foreach personality in zConscientiousness_w1 zNeuroticism_w1 {


foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
ever_marijuana_30_w ever_all_but_m_drugs_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w {


	reg `yvariable' res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("No control") tex excel  nocons nor2 title("Table: `yvariable'")  keep(res_mom_work_hours_v2_w `personality' int_`personality')    replace  label
	
	reg `yvariable' res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Demographic") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w `personality' int_`personality') append label

	reg `yvariable' res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Mom occupation") tex excel   nocons nor2 keep(res_mom_work_hours_v2_w `personality' int_`personality') append label
	
	
	reg `yvariable' res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Mom education") tex excel  nocons nor2 keep(res_mom_work_hours_v2_w `personality' int_`personality') append	label
	
	reg `yvariable' res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Dad career and education") tex excel   nocons nor2 keep(res_mom_work_hours_v2_w `personality' int_`personality') append	 label
	
	
	reg `yvariable' res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Family income") tex excel  nocons  nor2 keep(res_mom_work_hours_v2_w `personality' int_`personality') append	label
	
	
	reg `yvariable' res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Supervision") tex  excel  nocons nor2 keep(res_mom_work_hours_v2_w `personality' int_`personality') append	label
	

	
	reg `yvariable' res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_`personality', ctitle("Add Time") tex excel  nocons  nor2 keep(res_mom_work_hours_v2_w `personality' int_`personality') append	label
	
	
	
	
}	

}











* Generate tables for panel + OLS!



foreach personality in zConscientiousness_w1 zNeuroticism_w1 { 

eststo clear

eststo A`personality': quietly reg BMI_zscore_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo B`personality': quietly areg BMI_zscore_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo C`personality': quietly reg lose_weight_dum_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo D`personality': quietly areg lose_weight_dum_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo E`personality': quietly reg tried_cigarette_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo F`personality': quietly areg tried_cigarette_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo G`personality': quietly reg regular_cigarette_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo H`personality': quietly areg regular_cigarette_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo I`personality': quietly reg how_many_days_smoke_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo J`personality': quietly areg how_many_days_smoke_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo K`personality': quietly reg how_many_cigarettes_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo L`personality': quietly areg how_many_cigarettes_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo M`personality': quietly reg total_smoke_a_month_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo N`personality': quietly areg total_smoke_a_month_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo O`personality': quietly reg ever_drink_alcohol_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo P`personality': quietly areg ever_drink_alcohol_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo Q`personality': quietly reg drink_days_v2_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo R`personality': quietly areg drink_days_v2_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo S`personality': quietly reg drink_amount_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo T`personality': quietly areg drink_amount_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo U`personality': quietly reg total_drink_per_year_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo V`personality': quietly areg total_drink_per_year_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo W`personality': quietly reg ever_marijuana_30_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo X`personality': quietly areg ever_marijuana_30_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)

eststo Y`personality': quietly reg ever_all_but_m_drugs_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo Z`personality': quietly areg ever_all_but_m_drugs_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)





esttab A`personality' B`personality' C`personality' D`personality' E`personality' F`personality' G`personality' H`personality' I`personality' J`personality' K`personality' L`personality' M`personality' N`personality' using `personality'_OLS_FE.tex, label title(OLS versus Sibling FE: Mom work hours X child's `personality') ///
se star(* 0.1 ** 0.05 *** 0.01) keep(res_mom_work_hours_v2_w `personality' int_`personality') booktabs mtitles("OLS" "SFE" "OLS" "SFE" "OLS" "SFE" "OLS" "SFE" "OLS" "SFE" "OLS" "SFE" "OLS" "SFE" ) mgroups("BMI Z-score" "Lose weight" "Ever smoked" "Regular smoker" "Num. of smoke days" "Num. of cigarettes" "Total num. of cigarettes", pattern(1 0 1 0 1 0 1 0 1 0 1 0 1 0 ) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) replace

esttab O`personality' P`personality' Q`personality' R`personality' S`personality' T`personality' U`personality' V`personality' W`personality' X`personality' Y`personality' Z`personality' using `personality'_OLS_FE2.tex, label  title(OLS versus Sibling FE: Mom work hours X child's `personality') ///
se star(* 0.1 ** 0.05 *** 0.01) keep(res_mom_work_hours_v2_w `personality' int_`personality') booktabs mtitles( "OLS" "SFE" "OLS" "SFE" "OLS" "SFE" "OLS" "SFE" "OLS" "SFE" "OLS" "SFE" ) mgroups( "Ever drank alcohol" "Num. of drink days" "Num. of drink amount" "Total num. of drink" "Smoked marijuana" "Used other drugs" , pattern(1 0 1 0 1 0 1 0 1 0 1 0  ) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
replace addnotes("Robust Standard errors in parentheses. Sampling weights are applied. The controls are listed in the summary statistics table and they are the same as the last column of the previous OLS tables. Missing values of the controls such as family income and mother working hours are imputed either using the mean value of the sample or filled with 0. Missing indicators are applied in the regression models.")

}










* test 



gen FAMID_2 = FAMID*wave*wave


duplicates report FAMID_2 


foreach personality in zConscientiousness_w1 zNeuroticism_w1 { 

eststo clear

eststo A`personality': quietly reg BMI_zscore_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo B`personality': quietly areg BMI_zscore_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo B2`personality': quietly areg BMI_zscore_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo C`personality': quietly reg lose_weight_dum_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo D`personality': quietly areg lose_weight_dum_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo D2`personality': quietly areg lose_weight_dum_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo E`personality': quietly reg tried_cigarette_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo F`personality': quietly areg tried_cigarette_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo F2`personality': quietly areg tried_cigarette_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo G`personality': quietly reg regular_cigarette_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo H`personality': quietly areg regular_cigarette_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo H2`personality': quietly areg regular_cigarette_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo I`personality': quietly reg how_many_days_smoke_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo J`personality': quietly areg how_many_days_smoke_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo J2`personality': quietly areg how_many_days_smoke_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo K`personality': quietly reg how_many_cigarettes_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo L`personality': quietly areg how_many_cigarettes_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo L2`personality': quietly areg how_many_cigarettes_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo M`personality': quietly reg total_smoke_a_month_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo N`personality': quietly areg total_smoke_a_month_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo N2`personality': quietly areg total_smoke_a_month_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo O`personality': quietly reg ever_drink_alcohol_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo P`personality': quietly areg ever_drink_alcohol_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo P2`personality': quietly areg ever_drink_alcohol_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo Q`personality': quietly reg drink_days_v2_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo R`personality': quietly areg drink_days_v2_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo R2`personality': quietly areg drink_days_v2_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo S`personality': quietly reg drink_amount_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo T`personality': quietly areg drink_amount_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo T2`personality': quietly areg drink_amount_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo U`personality': quietly reg total_drink_per_year_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo V`personality': quietly areg total_drink_per_year_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo V2`personality': quietly areg total_drink_per_year_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo W`personality': quietly reg ever_marijuana_30_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo X`personality': quietly areg ever_marijuana_30_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo X2`personality': quietly areg ever_marijuana_30_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)

eststo Y`personality': quietly reg ever_all_but_m_drugs_w res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster PSUSCID_w)
eststo Z`personality': quietly areg ever_all_but_m_drugs_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID) vce(cluster PSUSCID_w)
eststo Z2`personality': quietly areg ever_all_but_m_drugs_w  res_mom_work_hours_v2_w `personality' int_`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT],  absorb(FAMID_2) vce(cluster PSUSCID_w)





esttab B2`personality'  B`personality' D2`personality' D`personality' F2`personality' F`personality'  H2`personality' H`personality'  J2`personality' J`personality'  L2`personality' L`personality' N2`personality' N`personality' using `personality'_OLS_FE.tex, label title(OLS versus Sibling FE: Mom work hours X child's `personality') ///
se star(* 0.1 ** 0.05 *** 0.01) keep(res_mom_work_hours_v2_w `personality' int_`personality') booktabs mtitles("BFE" "SFE" "BFE" "SFE" "BFE" "SFE" "BFE" "SFE" "BFE" "SFE" "BFE" "SFE" "BFE" "SFE" ) mgroups("BMI Z-score" "Lose weight" "Ever smoked" "Regular smoker" "Num. of smoke days" "Num. of cigarettes" "Total num. of cigarettes", pattern(1 0 1 0 1 0 1 0 1 0 1 0 1 0 ) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) replace

esttab  P2`personality' P`personality'  R2`personality' R`personality'  T2`personality' T`personality'  V2`personality' V`personality'  X2`personality' X`personality'  Z2`personality' Z`personality' using `personality'_OLS_FE2.tex, label  title(OLS versus Sibling FE: Mom work hours X child's `personality') ///
se star(* 0.1 ** 0.05 *** 0.01) keep(res_mom_work_hours_v2_w `personality' int_`personality') booktabs mtitles( "BFE" "SFE" "BFE" "SFE" "BFE" "SFE" "BFE" "SFE" "BFE" "SFE" "BFE" "SFE" ) mgroups( "Ever drank alcohol" "Num. of drink days" "Num. of drink amount" "Total num. of drink" "Smoked marijuana" "Used other drugs" , pattern(1 0 1 0 1 0 1 0 1 0 1 0  ) prefix(\multicolumn{@span}{c}{) suffix(}) span erepeat(\cmidrule(lr){@span})) ///
replace addnotes("Robust Standard errors in parentheses. Sampling weights are applied. The controls are listed in the summary statistics table and they are the same as the last column of the previous OLS tables. Missing values of the controls such as family income and mother working hours are imputed either using the mean value of the sample or filled with 0. Missing indicators are applied in the regression models.")





} 

















foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w {


	ivregress 2sls `yvariable' zConscientiousness_w1 i.mwh_impute_indicator_w (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = youngest_sib_age_w c.youngest_sib_age_w#c.zConscientiousness_w1)[pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append
	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = youngest_sib_age_w c.youngest_sib_age_w#c.zConscientiousness_w1)[pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append

	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w i.mwh_impute_indicator_w (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = youngest_sib_age_w c.youngest_sib_age_w#c.zConscientiousness_w1)[pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append
	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = youngest_sib_age_w c.youngest_sib_age_w#c.zConscientiousness_w1)[pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append

	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w family_income_1994 i.mwh_impute_indicator_w i.dwh_impute_indicator_w i.fam_income_impute_ind (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = youngest_sib_age_w c.youngest_sib_age_w#c.zConscientiousness_w1)[pw=GSWGT] , vce(cluster AID)
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append 

	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = youngest_sib_age_w c.youngest_sib_age_w#c.zConscientiousness_w1) [pw=GSWGT], vce(cluster AID)                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append

	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w age_mom_w age_dad_w i.month_year_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = youngest_sib_age_w c.youngest_sib_age_w#c.zConscientiousness_w1) [pw=GSWGT], vce(cluster AID)                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append 
	
	ivregress 2sls `yvariable' zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w age_mom_w age_dad_w i.res_mom_educ_w i.res_dad_educ_w i.month_year_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w i.dad_edu_impute_indicator_w i.mom_edu_impute_indicator_w  (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = youngest_sib_age_w c.youngest_sib_age_w#c.zConscientiousness_w1) [pw=GSWGT], vce(cluster AID)                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append 
	
	
	
	
	

}
















foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w {



	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w [pw=GSWGT], absorb(AID2) vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append addtext(FE, FAMILY)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w [pw=GSWGT], absorb(AID2) vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append addtext(FE, FAMILY)

	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w i.mwh_impute_indicator_w [pw=GSWGT], absorb(AID2) vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append addtext(FE, FAMILY)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w [pw=GSWGT], absorb(AID2) vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append addtext(FE, FAMILY)

	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w family_income_1994 i.mwh_impute_indicator_w i.dwh_impute_indicator_w i.fam_income_impute_ind [pw=GSWGT] , absorb(AID2) vce(cluster AID)
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(FE, FAMILY)


	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w [pw=GSWGT], absorb(AID2) vce(cluster AID)                         
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(FE, FAMILY)

	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w age_mom_w age_dad_w i.month_year_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w [pw=GSWGT], absorb(AID2) vce(cluster AID)                          
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(FE, FAMILY)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w age_mom_w age_dad_w i.res_mom_educ_w i.res_dad_educ_w i.month_year_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w i.dad_edu_impute_indicator_w i.mom_edu_impute_indicator_w  [pw=GSWGT], absorb(AID2) vce(cluster AID)                       
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(FE, FAMILY)
	
	
	
	
	
	
	
	
	
}













foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w {

	
	
	
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w [pw=GSWGT], absorb(PSUSCID_w) vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append addtext(FE, SCHOOL)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w [pw=GSWGT], absorb(PSUSCID_w) vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append addtext(FE, SCHOOL)

	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w i.mwh_impute_indicator_w [pw=GSWGT], absorb(PSUSCID_w) vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append addtext(FE, SCHOOL)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w [pw=GSWGT], absorb(PSUSCID_w) vce(cluster AID)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append addtext(FE, SCHOOL)

	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w family_income_1994 i.mwh_impute_indicator_w i.dwh_impute_indicator_w i.fam_income_impute_ind [pw=GSWGT] , absorb(PSUSCID_w) vce(cluster AID)
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(FE, SCHOOL)


	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w [pw=GSWGT], absorb(PSUSCID_w) vce(cluster AID)                         
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(FE, SCHOOL)

	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w age_mom_w age_dad_w i.month_year_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w [pw=GSWGT], absorb(PSUSCID_w) vce(cluster AID)                          
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(FE, SCHOOL)
	
	areg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w age_mom_w age_dad_w i.res_mom_educ_w i.res_dad_educ_w i.month_year_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w i.dad_edu_impute_indicator_w i.mom_edu_impute_indicator_w  [pw=GSWGT], absorb(PSUSCID_w) vce(cluster AID)                       
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(FE, SCHOOL)
	
	
	
	

	



}









gen mwh_conscientious_w1 = res_mom_work_hours_v2_w*zConscientiousness_w1
gen IV_conscientious_w = youngest_sib_age_w*zConscientiousness_w1


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
	
	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel i.mwh_impute_indicator_w (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w)[pw=GSWGT], r fe cluster(PSUSCID_w)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)

	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w i.mwh_impute_indicator_w (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w)[pw=GSWGT], r fe cluster(PSUSCID_w)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)
	
	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w)[pw=GSWGT], r fe cluster(PSUSCID_w)
	outreg2 using `yvariable', ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)

	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w family_income_1994 i.mwh_impute_indicator_w i.dwh_impute_indicator_w i.fam_income_impute_ind (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w)[pw=GSWGT] ,r fe cluster(PSUSCID_w)
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)


	
	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w) [pw=GSWGT],r fe cluster(PSUSCID_w)                      
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)

	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w age_mom_w age_dad_w i.month_year_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w) [pw=GSWGT], r fe cluster(PSUSCID_w)                      
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)
	
	xi: xtivreg2  `yvariable' zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w age_mom_w age_dad_w i.res_mom_educ_w i.res_dad_educ_w i.month_year_w i.mwh_impute_indicator_w i.dwh_impute_indicator_w i.dad_edu_impute_indicator_w i.mom_edu_impute_indicator_w  (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w) [pw=GSWGT], r fe cluster(PSUSCID_w)                       
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append  addtext(FE-IV, SCHOOL)
	
	
	

}








 
 
 
 * replace FAMID  = AID if FAMID == . & AID !=.
 
 
 destring AID, gen (test2)
 
 

replace test2 = FAMID if FAMID !=.
 
 
 
 

  
  
  
  
  ******new********
  
  
  
  
  
  
  
  
  * they are  the same!!!
  xtset wave_FAMILY_ID
  xtreg  how_many_cigarettes_w c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994  i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w , fe
  
  
  areg how_many_cigarettes_w c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 $demographic_panel  i.res_mom_occupation_w res_dad_work_hours_v2_w  i.res_dad_occupation_w   family_income_1994  i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w , absorb( wave_FAMILY_ID )
  
  
  * they are the same!!1
  
ivregress 2sls ever_drink_alcohol_w $demographic_panel  (res_mom_work_hours_v2_w c.res_mom_work_hours_v2_w#c.zConscientiousness_w1 = youngest_sib_age_w c.youngest_sib_age_w#c.zConscientiousness_w1)



ivregress 2sls ever_drink_alcohol_w $demographic_panel  (mwh_conscientious_w1 res_mom_work_hours_v2_w = IV_conscientious_w youngest_sib_age_w)

  
  
  
  

  
  
  
  
  
  
  
  * for presentation 
  
  
  * cluster is the same as vce(cluster XXX)
 
 
* OLS, OLS*FE for smoking
 
 foreach yvariable in tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1  {

     mi estimate, post: reg `yvariable' res_mom_work_hours_v2_w1 zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)                          
	outreg2 using presnetation_smoke_ols, ctitle(`yvariable') excel tex append keep(res_mom_work_hours_v2_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
  
 
 foreach yvariable in tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1  {

	mi estimate, post: areg `yvariable' res_mom_work_hours_v2_w1 zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using presnetation_smoke_FE, ctitle(`yvariable') excel tex append keep(res_mom_work_hours_v2_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
   

 
 
 * interaction, interaction*FE  for smoking

 
 foreach yvariable in tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1  {


     mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)                          
	outreg2 using presnetation_smoke_interaction, ctitle(OLS `yvariable') excel tex append keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
 
 
 foreach yvariable in tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1  {

	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using presnetation_smoke_interaction_FE, ctitle(`yvariable') excel tex append keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
   
 
 
 
 
  
* OLS, OLS*FE  for alcohol
 
 foreach yvariable in ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1   {

     mi estimate, post: reg `yvariable' res_mom_work_hours_v2_w1 zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)                          
	outreg2 using presnetation_alcohol_ols, ctitle(`yvariable') excel tex append keep(res_mom_work_hours_v2_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
 } 
 
 foreach yvariable in ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1   {

	mi estimate, post: areg `yvariable' res_mom_work_hours_v2_w1 zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using presnetation_alcohol_FE, ctitle(`yvariable') excel tex append keep(res_mom_work_hours_v2_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
   

 
 
 * interaction, interaction*FE for alcohol
 
 foreach yvariable in ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1   {


     mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)                          
	outreg2 using presnetation_alcohol_interaction, ctitle(OLS `yvariable') excel tex append keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
 
 }
 
 foreach yvariable in ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1   {

	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using presnetation_alcohol_interaction_FE, ctitle(`yvariable') excel tex append keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
   
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 foreach variable in  race res_mom_occupation_w1 res_dad_occupation_w1  {
 
 
 	tabulate `variable', gen(`variable'_dummy)

}

 
 
 
 
 * why aweight leads to smaller sample size????!!!!
 

 
 
estpost sum tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1 ///
ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1 ///
res_mom_work_hours_v2_w1 zConscientiousness_w1 age_w1 BIO_SEX race_dummy* num_siblings_w1 res_mom_occupation_w1_dummy* res_dad_occupation_w1_dummy* res_dad_work_hours_v2_w1  ///
family_income_1994 decide_time_at_home_weekend_w1 decide_hang_around_with_w1 ///
decide_what_u_wear_w1 decide_how_much_tv_w1 decide_what_tv_programs_w1 decide_what_time_go_bed_w1 decide_what_you_eat_w1 [aweight = GSWGT1]
 
 est store A 
esttab A using sum_stat.tex,  cells("count mean sd min max") replace 

 
  

  
  
  
 ** important 
* other possible y variables:  res_mom_at_home_leave_school_w1 res_mom_at_home_return_school_w1 res_mom_at_home_go_to_bed_w1  
