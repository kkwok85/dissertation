* new regression

set maxvar 32767
use "F:\temp_data\panel_data", clear

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

/*
gen fam_income_impute_ind = 1 if family_income_1994 ==.
replace fam_income_impute_ind = 0 if family_income_1994 !=.



mi set wide 
mi register imputed family_income_1994
mi register  regular res_mom_occupation_w1 res_dad_occupation_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 race res_mom_at_home_leave_school_w1 res_mom_at_home_return_school_w1 res_dad_at_home_leave_school_w1 res_dad_at_home_return_school_w1

mi impute regress family_income_1994   i.res_mom_occupation_w1 i.res_dad_occupation_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.race i.res_mom_at_home_leave_school_w1 i.res_mom_at_home_return_school_w1 i.res_dad_at_home_leave_school_w1 i.res_dad_at_home_return_school_w1, add(15) force

mi rename res_mom_at_home_leave_school_w1  mom_leave_school_w1
mi rename res_mom_at_home_return_school_w1 mom_return_school_w1, noupdate
mi rename res_dad_at_home_leave_school_w1 dad_leave_school_w1, noupdate
mi rename res_dad_at_home_return_school_w1 dad_return_school_w1, noupdate


*/

* for panel

/*
gen fam_income_impute_ind = 1 if family_income_1994 ==.
replace fam_income_impute_ind = 0 if family_income_1994 !=.



mi set wide 
mi register imputed family_income_1994
mi register  regular res_mom_occupation_w res_dad_occupation_w res_mom_work_hours_v2_w res_dad_work_hours_v2_w race res_mom_at_home_leave_school_w res_mom_at_home_return_school_w res_dad_at_home_leave_school_w res_dad_at_home_return_school_w

mi impute regress family_income_1994   i.res_mom_occupation_w i.res_dad_occupation_w res_mom_work_hours_v2_w res_dad_work_hours_v2_w i.race i.res_mom_at_home_leave_school_w i.res_mom_at_home_return_school_w i.res_dad_at_home_leave_school_w i.res_dad_at_home_return_school_w, add(15) force

mi rename res_mom_at_home_leave_school_w  mom_leave_school_w, noupdate
mi rename res_mom_at_home_return_school_w mom_return_school_w, noupdate
mi rename res_dad_at_home_leave_school_w dad_leave_school_w, noupdate
mi rename res_dad_at_home_return_school_w dad_return_school_w, noupdate


*/













/* this is just for 5 imputations
mi xeq 0 1 5: sum family_income_1994


m=0 data:
-> sum family_income_1994

Variable         Obs	Mean	Std. Dev.	Min	Max
				
family_~1994      15,351	45.72816	51.61657	0	999

m=1 data:
-> sum family_income_1994

Variable         Obs	Mean	Std. Dev.	Min	Max
				
family_~1994      20,567	45.09695	51.49319	-134.7672	999

m=5 data:
-> sum family_income_1994

Variable         Obs	Mean	Std. Dev.	Min	Max
				
family_~1994      20,567	45.08111	51.83985	-138.8117	999
*/







/*

destring FAMILY_ID, replace

destring SCID, replace
destring PSUSCID, replace













* do school fixed effect (ask why some data are dropped?)

xtset SSCHLCDE

xtset PSUSCID

xtset FAMILY_ID

xtset    W1COUNTY
xtset	W1STATE
xtreg tried_cigarette_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , fe 

egen month_PSUSCID =group(IMONTH PSUSCID)

areg tried_cigarette_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , absorb(month_PSUSCID)

xtset month_PSUSCID 
xtreg tried_cigarette_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , fe


xi: regress tried_cigarette_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1  i.month_PSUSCID 







* testing
 mi xeq 0: reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r
 reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r

*/

 
 


* do impute, mi impute





egen month_PSUSCID =group(IMONTH PSUSCID)
egen month_W1STATE =group(IMONTH W1STATE)
egen month_FAMILY_ID =group(IMONTH FAMID)
egen month_PSUSCID_W1STATE = group(IMONTH PSUSCID W1STATE)
egen month_PSUSCID_W1STATE_FAMID = group(IMONTH PSUSCID W1STATE FAMID)


egen wave_FAMILY_ID = group(wave FAMID) 
egen wave_state = group(wave STATE_w) 
egen wave_PSUSCID = group(wave PSUSCID) 
egen wave_PSUSCID_state = group(wave PSUSCID STATE_w) 
egen wave_PSUSCID_state_FAMILY = group(wave PSUSCID STATE_w FAMID) 












new control
age_mom_w age_dad_w i.res_mom_educ_w i.res_dad_educ_w i.month_year_w



BMI_w1 BMI_zscore_w1 overweight_w1 obese_w1

tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1 


* need regression on sleep hours

global demographic_panel age_w BIO_SEX i.race num_siblings_w AH_PVT i.no_mom_w i.no_dad_w age_mom_w age_dad_w

global mom_occupation_panel i.res_mom_occupation_w

global mom_edu_panel i.res_mom_educ_w i.mom_edu_impute_indicator_w 

global dad_educ_career_panel res_dad_work_hours_v2_w  i.res_dad_occupation_w  i.dwh_impute_indicator_w i.res_dad_educ_w i.dad_edu_impute_indicator_w 

global family_income_panel family_income_1994 i.fam_income_impute_ind

global supervision_panel  i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w

global time_panel  i.month_year_w



*************new *******

foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w {


	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w [pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle("No control") tex  title("Table: `yvariable'")  keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1)    replace
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel [pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle("+ Demographic") tex  keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append

	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel [pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle("+ Mom occupation") tex   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  [pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle("+ Mom education") tex   keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel [pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle("+ Dad career and education") tex    keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel [pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle("+ Family income") tex    keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle("+ Supervision") tex    keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	

	
	reg `yvariable' c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT], vce(cluster AID)
	outreg2 using `yvariable', ctitle("+ Time") tex    keep(c.res_mom_work_hours_v2_w##c.zConscientiousness_w1) append	
	
	
	
	
}	





* check if mom report has problem

foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w {


	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_int_no_star_w1, noaster ctitle("No control") excel  title("Table: `yvariable'")  keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1)    replace
	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_int_no_star_w1, noaster ctitle("+ Demographic") excel  keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append

	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_int_no_star_w1, noaster ctitle("+ Mom occupation") excel   keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append
	
	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_int_no_star_w1, noaster ctitle("+ Mom education") excel   keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append	
	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_int_no_star_w1, noaster ctitle("+ Dad career and education") tex    keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_int_no_star_w1, noaster ctitle("+ Family income") excel    keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append	
	
	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_int_no_star_w1, noaster ctitle("+ Supervision") excel    keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append	
	

	
	reg `yvariable' i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] if wave == 1, vce(cluster AID)
	outreg2 using `yvariable'_int_no_star_w1, noaster ctitle("+ Time") excel    keep(i.mom_full_time_mom_report_v2_w##c.zConscientiousness_w1) append	
	
	
	
	
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
