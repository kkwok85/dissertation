cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"



* cd "C:\Users\Julian.Julian-PC\Dropbox\J file\dissertation\Add_health_data\temp_data"


clear


use constructed_variables, clear









foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 times_tv_videos_w1 roller_blading_cycling_w1 play_active_sport_w1 exercise_w1 hang_out_frds_w1 tv_hours_per_week_w1 video_hours_per_week_w1	 computer_games_hours_per_week_w1 listen_radio_hours_per_week_w1 {


	reg `varname' mom_full_time_child_report_w1 dad_full_time_child_report_w1 
	outreg2 using result1, word ctitle(`varname')  append 

	reg `varname' mom_full_time_mom_report_w1 dad_full_time_mom_report_w1
	outreg2 using result2, word ctitle(`varname')  append 


}






foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 times_tv_videos_w1 roller_blading_cycling_w1 play_active_sport_w1 exercise_w1 hang_out_frds_w1 tv_hours_per_week_w1 video_hours_per_week_w1	 computer_games_hours_per_week_w1 listen_radio_hours_per_week_w1 {


	reg `varname' mom_full_time_child_report_w1_v2 dad_full_time_child_report_w1_v2 
	reg `varname' mom_full_time_mom_report_w1 dad_full_time_mom_report_w1 

}









foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 sports time_use_w1 time_use_no_radio_w1 {


	reg `varname' mom_full_time_child_report_w1 dad_full_time_child_report_w1 
	outreg2 using result3, word ctitle(`varname')  append 


	reg `varname' mom_full_time_mom_report_w1 dad_full_time_mom_report_w1
	outreg2 using result4, word ctitle(`varname')  append 


}






foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 sports time_use_w1 time_use_no_radio_w1 {


	reg `varname' mom_full_time_child_report_w1  
	outreg2 using result5, word ctitle(`varname')  append 


	reg `varname' mom_full_time_mom_report_w1 
	outreg2 using result6, word ctitle(`varname')  append 


}










foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 sports time_use_w1 time_use_no_radio_w1 {


	reg `varname' mom_full_time_child_report_v3_w1 dad_full_time_child_report_v3_w1 


	reg `varname' mom_full_time_mom_report_v2_w1 dad_full_time_mom_report_v2_w1


}






*************************************************************************************** check variables ************************************************************************
br mom_full_time_child_report_w1  dad_full_time_child_report_w1 mom_full_time_mom_report_w1 dad_full_time_mom_report_w1 mom_full_time_child_report_w1_v2 dad_full_time_child_report_w1_v2 ///
full_time_spouse full_time_mom_or_dad  sex_mom_or_dad  sex_mom_or_dad sex_spouse res_dad_work_hours_w1 res_mom_work_hours_w1



tab mom_full_time_child_report_w1 
tab dad_full_time_child_report_w1 
tab mom_full_time_mom_report_w1 
tab dad_full_time_mom_report_w1
tab mom_full_time_child_report_w1_v2 
tab dad_full_time_child_report_w1_v2 

* seems that using 35 hours to separate part time and full time is better


sum mom_full_time_child_report_w1 
sum dad_full_time_child_report_w1 
sum mom_full_time_mom_report_w1 
sum dad_full_time_mom_report_w1
sum mom_full_time_child_report_w1_v2 
sum dad_full_time_child_report_w1_v2 

* version 1 of child report looks closer to mom's report

foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 times_tv_videos_w1 roller_blading_cycling_w1 play_active_sport_w1 exercise_w1 hang_out_frds_w1 tv_hours_per_week_w1 video_hours_per_week_w1	 computer_games_hours_per_week_w1 listen_radio_hours_per_week_w1 {
	sum `varname' 
}


br BMI_w1 work_in_house_w1 hobbies_w1 times_tv_videos_w1 roller_blading_cycling_w1 play_active_sport_w1 exercise_w1 hang_out_frds_w1 tv_hours_per_week_w1 video_hours_per_week_w1	 computer_games_hours_per_week_w1 listen_radio_hours_per_week_w1





















* new regression

set maxvar 32767
use "F:\temp_data\constructed_variables", clear

cd "C:\Users\jkwok\Desktop\mom_vs_child_wh"







* check if mom report has problem

foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w {


	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1  [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_mom_report, ctitle("No control") excel word title("Table: `yvariable'")  keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1)    replace
	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1  $demographic_panel [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_mom_report, ctitle("+ Demographic") excel word  keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append

	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1  $demographic_panel $mom_occupation_panel [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_mom_report, ctitle("+ Mom occupation") excel word   keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append
	
	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1 $demographic_panel $mom_occupation_panel $mom_edu_panel  [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_mom_report, ctitle("+ Mom education") excel word   keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append	
	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1  $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_mom_report, ctitle("+ Dad career and education") excel word    keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1  $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_mom_report, ctitle("+ Family income") excel word    keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1  $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_mom_report, ctitle("+ Supervision") excel word    keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append	
	

	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1  $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] if wave == 1 , vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_mom_report, ctitle("+ Time") excel word    keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append	
	
	
	
	
}	




foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w {


	reg `yvariable' i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1  [pw=GSWGT]  if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_child_report, noaster ctitle("No control") excel word  title("Table: `yvariable'")  keep(i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1)    replace
	
	reg `yvariable' i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1  $demographic_panel [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_child_report, noaster ctitle("+ Demographic") excel word  keep(i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1) append

	reg `yvariable' i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1  $demographic_panel $mom_occupation_panel [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_child_report, noaster ctitle("+ Mom occupation") excel word   keep(i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1) append
	
	
	reg `yvariable' i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1  $demographic_panel $mom_occupation_panel $mom_edu_panel  [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_child_report, noaster ctitle("+ Mom education") excel word   keep(i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1) append	
	
	reg `yvariable' i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1  $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_child_report, noaster ctitle("+ Dad career and education") excel  word   keep(i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1  $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_child_report, noaster ctitle("+ Family income") excel  word   keep(i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1  $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_child_report, noaster ctitle("+ Supervision") excel word    keep(i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1) append	
	

	
	reg `yvariable' i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1  $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] if wave == 1, vce(cluster PSUSCID_w)
	outreg2 using `yvariable'_int_child_report, noaster ctitle("+ Time") excel  word   keep(i.mom_full_time_child_report_v3_w##c.zConscientiousness_w1) append	
	
	
	
	
}	




























foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w {


	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_no_star_w1, noaster ctitle("No control") excel  title("Table: `yvariable'")  keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1)    replace
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_no_star_w1, noaster ctitle("+ Demographic") excel keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append

	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_no_star_w1, noaster ctitle("+ Mom occupation") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_no_star_w1, noaster ctitle("+ Mom education") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_no_star_w1, noaster ctitle("+ Dad career and education") excel    keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_no_star_w1, noaster ctitle("+ Family income") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_no_star_w1, noaster ctitle("+ Supervision") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	

	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_no_star_w1, noaster ctitle("+ Time") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	
	
}	












foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w {


	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w [pw=GSWGT] if (wave == 1 & mom_full_time_mom_report_v2_w !=.), vce(cluster AID)
	outreg2 using `yvariable'_no_star_mom_miss_w1, noaster ctitle("No control") excel  title("Table: `yvariable'")  keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1)    replace
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel [pw=GSWGT] if (wave == 1 & mom_full_time_mom_report_v2_w !=.), vce(cluster AID)
	outreg2 using `yvariable'_no_star_mom_miss_w1, noaster ctitle("+ Demographic") excel keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append

	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel [pw=GSWGT] if (wave == 1 & mom_full_time_mom_report_v2_w !=.), vce(cluster AID)
	outreg2 using `yvariable'_no_star_mom_miss_w1, noaster ctitle("+ Mom occupation") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  [pw=GSWGT] if (wave == 1 & mom_full_time_mom_report_v2_w !=.), vce(cluster AID)
	outreg2 using `yvariable'_no_star_mom_miss_w1, noaster ctitle("+ Mom education") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel [pw=GSWGT] if (wave == 1 & mom_full_time_mom_report_v2_w !=.), vce(cluster AID)
	outreg2 using `yvariable'_no_star_mom_miss_w1, noaster ctitle("+ Dad career and education") excel    keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel [pw=GSWGT] if (wave == 1 & mom_full_time_mom_report_v2_w !=.), vce(cluster AID)
	outreg2 using `yvariable'_no_star_mom_miss_w1, noaster ctitle("+ Family income") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT] if (wave == 1 & mom_full_time_mom_report_v2_w !=.), vce(cluster AID)
	outreg2 using `yvariable'_no_star_mom_miss_w1, noaster ctitle("+ Supervision") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	

	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] if (wave == 1 & mom_full_time_mom_report_v2_w !=.), vce(cluster AID)
	outreg2 using `yvariable'_no_star_mom_miss_w1, noaster ctitle("+ Time") excel   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	
	
}	











