cd "F:\temp_data"


set maxvar 32767

clear



use constructed_variables, clear


global demographic_panel age_w BIO_SEX i.race num_siblings_w AH_PVT i.no_mom_w i.no_dad_w age_mom_w age_dad_w

global mom_occupation_panel i.res_mom_occupation_w

global mom_edu_panel i.res_mom_educ_w i.mom_edu_impute_indicator_w 

global dad_educ_career_panel res_dad_work_hours_v2_w  i.res_dad_occupation_w  i.dwh_impute_indicator_w i.res_dad_educ_w i.dad_edu_impute_indicator_w 

global family_income_panel family_income_1994 i.fam_income_impute_ind

global supervision_panel  i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w

global time_panel  i.month_year_w






global demographic age_w2 i.BIO_SEX i.race num_siblings_w2 AH_PVT i.no_mom_w2 i.no_dad_w2 age_mom_w2 age_dad_w2

global mom_occupation i.res_mom_occupation_w2

global mom_edu i.res_mom_educ_w2 i.mom_edu_impute_indicator_w2 

global dad_educ_career res_dad_work_hours_v2_w2  i.res_dad_occupation_w2  i.dwh_impute_indicator_w2 i.res_dad_educ_w2 i.dad_edu_impute_indicator_w2

global family_income family_income_1994 i.fam_income_impute_ind

global supervision  i.decide_time_at_home_weekend_w2 i.decide_hang_around_with_w2 i.decide_what_u_wear_w2 i.decide_how_much_tv_w2 i.decide_what_tv_programs_w2 i.decide_what_time_go_bed_w2 i.decide_what_you_eat_w2

global time  i.month_year_w2






gen fam_income_impute_ind = 1 if family_income_1994 ==.
replace fam_income_impute_ind = 0 if family_income_1994 !=.


sum family_income_1994 [aweight = GSWGT1]

replace family_income_1994 = r(mean) if AID != "." & family_income_1994 == . & fam_income_impute_ind == 1















reg H2NU77 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time    [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU78 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time   [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU79 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU80 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg bad_food_w2 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg vege_fruits_w2 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )


ivregress 2sls bad_food_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  (res_mom_work_hours_v2_w2 = youngest_sib_age_w2)  [pw=GSWGT2], vce(cluster PSUSCID_w2 )




reg H2NU77 res_mom_work_hours_v2_w2 decision_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU78 res_mom_work_hours_v2_w2 decision_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU79 res_mom_work_hours_v2_w2 decision_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time   [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU80 res_mom_work_hours_v2_w2 decision_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg bad_food_w2 res_mom_work_hours_v2_w2 decision_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg vege_fruits_w2 res_mom_work_hours_v2_w2 decision_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )






res_mom_at_home_leave_school_w2 
res_mom_at_home_return_school_w2 
res_mom_at_home_go_to_bed_w2


 
reg H2NU77 res_mom_work_hours_v2_w2 i.res_mom_at_home_leave_school_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU78 res_mom_work_hours_v2_w2 i.res_mom_at_home_leave_school_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU79 res_mom_work_hours_v2_w2 i.res_mom_at_home_leave_school_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time   [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU80 res_mom_work_hours_v2_w2 i.res_mom_at_home_leave_school_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )

reg vege_fruits_w2  res_mom_work_hours_v2_w2 i.res_mom_at_home_return_school_w2    $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )







reg vege_fruits_w2  res_mom_work_hours_v2_w2 i.bedtime_supervision_w2    $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )









foreach yvariable in num_fast_food_w2 num_eat_breakfast_w2 num_eat_lunch_w2 num_eat_dinner_w2 vege_fruits_w2  bad_food_w2 {

	foreach xvariable in before_school_supervision_w2 after_school_supervision_w2 bedtime_supervision_w2  parent_present_when_eat_w2 decision_w2 {


		reg `yvariable' `xvariable' res_mom_work_hours_v2_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
	    outreg2 using "F:/proposal_1",  nocons excel tex append  keep(`xvariable') 

	}



}



use F:\temp_data\panel_data, clear

foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w parent_present_when_eat_w decision_w {

	foreach yvariable in general_health_w headache_w feeling_hot_w stomach_ache_w cold_sweats_w physical_weak_w sore_throat_w tired_w pain_urination_w sick_w wake_up_tired_w  skin_problem_w dizziness_w chest_pain_w muscle_pain_w poor_appetite_w  trouble_sleep_w  trouble_relax_w moodiness_w freq_crying_w  fearful_w  {



		oprobit `yvariable' `xvariable' res_mom_work_hours_v2_w zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $time_panel  [pw=GSWGT], vce(cluster PSUSCID_w )
	    outreg2 using "F:/proposal_2",  nocons excel tex append  keep(`xvariable')  

	}



}

