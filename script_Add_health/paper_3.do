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



global demographic age_w1 i.BIO_SEX i.race num_siblings_w1 AH_PVT i.no_mom_w1 i.no_dad_w1 age_mom_w1 age_dad_w1

global mom_occupation i.res_mom_occupation_w1

global mom_edu i.res_mom_educ_w1 i.mom_edu_impute_indicator_w1 

global dad_educ_career res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  i.dwh_impute_indicator_w1 i.res_dad_educ_w1 i.dad_edu_impute_indicator_w1

global family_income family_income_1994 i.fam_income_impute_ind

global supervision  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1

global time  i.month_year_w1


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


 

*trouble_sleep_w 

use F:\temp_data\panel_data, clear

foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w parent_present_when_eat_w decision_w {

	foreach yvariable in general_health_w headache_w feeling_hot_w stomach_ache_w cold_sweats_w physical_weak_w sore_throat_w tired_w pain_urination_w sick_w wake_up_tired_w  skin_problem_w dizziness_w chest_pain_w muscle_pain_w poor_appetite_w   trouble_relax_w moodiness_w freq_crying_w  fearful_w  {



		oprobit `yvariable' `xvariable' res_mom_work_hours_v2_w zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $time_panel  [pw=GSWGT], vce(cluster PSUSCID_w )
	    outreg2 using "F:/proposal_2",  nocons excel tex append  keep(`xvariable' res_mom_work_hours_v2_w)  

	}



}
		areg `yvariable' `xvariable' res_mom_work_hours_v2_w2 zConscientiousness_w1 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], absorb(AID) vce(cluster AID)












foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w parent_present_when_eat_w decision_w {

	foreach yvariable in ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
BMI_w BMI_zscore_w overweight_w obese_w {


		reg `yvariable' c.`xvariable'##c.zConscientiousness_w1 res_mom_work_hours_v2_w  i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $time_panel  [pw=GSWGT], vce(cluster PSUSCID_w )
	    outreg2 using "F:/proposal_3",  nocons excel tex append  keep(c.`xvariable'##c.zConscientiousness_w1)  

	}



}






foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w parent_present_when_eat_w decision_w {

	foreach yvariable in general_health_w headache_w feeling_hot_w stomach_ache_w cold_sweats_w physical_weak_w sore_throat_w tired_w pain_urination_w sick_w wake_up_tired_w  skin_problem_w dizziness_w chest_pain_w muscle_pain_w poor_appetite_w   trouble_relax_w moodiness_w freq_crying_w  fearful_w  {



	    areg `yvariable' `xvariable' res_mom_work_hours_v2_w zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $time_panel  [pw=GSWGT], absorb(AID2) vce(cluster AID)       
	    outreg2 using "F:/proposal_4",  nocons excel tex append  keep(`xvariable' res_mom_work_hours_v2_w)  

	}



}




foreach variable  in headache_w feeling_hot_w stomach_ache_w cold_sweats_w physical_weak_w sore_throat_w tired_w pain_urination_w sick_w wake_up_tired_w  skin_problem_w dizziness_w chest_pain_w muscle_pain_w poor_appetite_w   trouble_relax_w moodiness_w freq_crying_w  fearful_w {

gen `variable'_cont = .

replace `variable'_cont = 0 if `variable' == 0
replace `variable'_cont = 5 if `variable' == 1
replace `variable'_cont = 52 if `variable' == 2
replace `variable'_cont = 320 if `variable' == 3
replace `variable'_cont = 365 if `variable' == 4
}






foreach variable  in headache_w feeling_hot_w stomach_ache_w {

gen `variable'_dum = .

replace `variable'_dum = 0 if `variable' == 0
replace `variable'_dum = 5 if (`variable' == 1 | `variable' == 2 | `variable' == 3 | `variable' == 4)

}



general_health_w


foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w parent_present_when_eat_w decision_w {

	foreach yvariable in  headache_w_cont feeling_hot_w_cont stomach_ache_w_cont cold_sweats_w_cont physical_weak_w_cont sore_throat_w_cont tired_w_cont pain_urination_w_cont sick_w_cont wake_up_tired_w_cont  skin_problem_w_cont dizziness_w_cont chest_pain_w_cont muscle_pain_w_cont poor_appetite_w_cont   trouble_relax_w_cont moodiness_w_cont freq_crying_w_cont  fearful_w_cont {  

	    areg `yvariable' `xvariable' res_mom_work_hours_v2_w zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $time_panel  [pw=GSWGT], absorb(AID2) vce(cluster AID)       
	    outreg2 using "F:/proposal_4",  nocons excel tex append  keep(`xvariable' res_mom_work_hours_v2_w)  

	}



}






foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w parent_present_when_eat_w decision_w {

	foreach yvariable in  headache_w_cont feeling_hot_w_cont stomach_ache_w_cont cold_sweats_w_cont physical_weak_w_cont sore_throat_w_cont tired_w_cont pain_urination_w_cont sick_w_cont wake_up_tired_w_cont  skin_problem_w_cont dizziness_w_cont chest_pain_w_cont muscle_pain_w_cont poor_appetite_w_cont   trouble_relax_w_cont moodiness_w_cont freq_crying_w_cont  fearful_w_cont {  

	    areg `yvariable' `xvariable' res_mom_work_hours_v2_w zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $time_panel  [pw=GSWGT], absorb(AID) vce(cluster AID)       
	    outreg2 using "F:/proposal_5",  nocons excel tex append  keep(`xvariable' res_mom_work_hours_v2_w)  

	}



}



* use subsample

foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w parent_present_when_eat_w decision_w {

	foreach yvariable in  headache_w_cont feeling_hot_w_cont stomach_ache_w_cont cold_sweats_w_cont physical_weak_w_cont sore_throat_w_cont tired_w_cont pain_urination_w_cont sick_w_cont wake_up_tired_w_cont  skin_problem_w_cont dizziness_w_cont chest_pain_w_cont muscle_pain_w_cont poor_appetite_w_cont   trouble_relax_w_cont moodiness_w_cont freq_crying_w_cont  fearful_w_cont {  

	    areg `yvariable' `xvariable' res_mom_work_hours_v2_w zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $time_panel  [pw=GSWGT], absorb(FAMID) vce(cluster FAMID)       
	    outreg2 using "F:/proposal_6",  nocons excel tex append  keep(`xvariable' res_mom_work_hours_v2_w)  

	}



}




* use subsample
* family FE

* IV might work


use constructed_variables, clear

foreach yvariable in num_fast_food_w2 num_eat_breakfast_w2 num_eat_lunch_w2 num_eat_dinner_w2 vege_fruits_w2  bad_food_w2 {

	foreach xvariable in before_school_supervision_w2 after_school_supervision_w2 bedtime_supervision_w2  parent_present_when_eat_w2 decision_w2 {


		areg `yvariable' `xvariable' res_mom_work_hours_v2_w2 zConscientiousness_w1 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], absorb(FAMID) vce(cluster FAMID)
	    outreg2 using "F:/proposal_7",  nocons excel tex append  keep(`xvariable') 

	}



}



* use subsample
* individual FE

foreach yvariable in num_fast_food_w2 num_eat_breakfast_w2 num_eat_lunch_w2 num_eat_dinner_w2 vege_fruits_w2  bad_food_w2 {

	foreach xvariable in before_school_supervision_w2 after_school_supervision_w2 bedtime_supervision_w2  parent_present_when_eat_w2 decision_w2 {


		areg `yvariable' `xvariable' res_mom_work_hours_v2_w2 zConscientiousness_w1 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], absorb(AID) vce(cluster AID)
	    outreg2 using "F:/proposal_9",  nocons excel tex append  keep(`xvariable') 

	}



}



reg H4EC2 c.zNeuroticism_w1 ##ib3.H4LM25 BIO_SEX AH_PVT  i.race i.IMONTH4 i.H4OD4 i.H4GH1 H4BMI [pweight = GSWGT4_2 ] if (H4EC2 < 9999996 & H4LM25 <5)



works! neuroticism also works
areg H4EC2 c.zExtraversion_w4##ib3.H4LM25 BIO_SEX AH_PVT  i.race i.IMONTH4 i.H4OD4 i.H4GH1 H4BMI [pweight = GSWGT4_2 ] if (H4EC2 < 9999996 & H4LM25 <5), absorb(FAMID)
