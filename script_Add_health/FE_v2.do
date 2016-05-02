
* this individual effect works!
areg vege_fruits_dum_w i.decide_what_you_eat_w c.parent_present_when_eat_w c.res_mom_work_hours_v2_w c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel   $time_panel [pw=GSWGT], absorb(AID) vce(cluster AID)



global health_w2 i.general_health_w2 i.trouble_sleep_w2 i.headache_w2 i.feeling_hot_w2 i.stomach_ache_w2 i.cold_sweats_w2 i.physical_weak_w2 i.sore_throat_w2 i.tired_w2 i.pain_urination_w2 i.sick_w2 i.wake_up_tired_w2  i.skin_problem_w2 i.dizziness_w2 i.chest_pain_w2 i.muscle_pain_w2 i.poor_appetite_w2   i.trouble_relax_w2 i.moodiness_w2 i.freq_crying_w2  i.fearful_w2


global health i.general_health_w i.trouble_sleep_w i.headache_w i.feeling_hot_w i.stomach_ache_w i.cold_sweats_w i.physical_weak_w i.sore_throat_w i.tired_w i.pain_urination_w i.sick_w i.wake_up_tired_w  i.skin_problem_w i.dizziness_w i.chest_pain_w i.muscle_pain_w i.poor_appetite_w   i.trouble_relax_w i.moodiness_w i.freq_crying_w  i.fearful_w










use F:\temp_data\panel_data, clear



foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w  parent_present_when_eat_w decision_w {


	foreach yvariable in num_fast_food_w2 num_eat_breakfast_w2 num_eat_lunch_w2 num_eat_dinner_w2 vege_fruits_w2 vege_fruits_dum_w cookies_dum_w   {


	reg `yvariable'  	`xvariable' c.res_mom_work_hours_v2_w c.zConscientiousness_w1 zNeuroticism_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel  $health $time_panel [pw=GSWGT] if wave == 2, vce(cluster PSUSCID_w)
	    outreg2 using "F:/proposal_12",  nocons excel tex append  keep(`xvariable') 

	}
}





foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w  parent_present_when_eat_w decision_w {


	foreach yvariable in num_fast_food_w2 num_eat_breakfast_w2 num_eat_lunch_w2 num_eat_dinner_w2 vege_fruits_w2 vege_fruits_dum_w cookies_dum_w   {


	reg `yvariable'  	`xvariable' c.res_mom_work_hours_v2_w c.zConscientiousness_w1 zNeuroticism_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel  $health $time_panel [pw=GSWGT] if (wave == 2 & FAMID != . ), vce(cluster PSUSCID_w)
	    outreg2 using "F:/proposal_14",  nocons excel tex append  keep(`xvariable') 

	}
}




foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w  parent_present_when_eat_w decision_w {


	foreach yvariable in num_fast_food_w2 num_eat_breakfast_w2 num_eat_lunch_w2 num_eat_dinner_w2 vege_fruits_w2 vege_fruits_dum_w cookies_dum_w   {


	areg `yvariable'  	`xvariable' c.res_mom_work_hours_v2_w c.zConscientiousness_w1 zNeuroticism_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel  $health $time_panel [pw=GSWGT] if wave == 2, absorb(FAMID) vce(cluster FAMID)
	    outreg2 using "F:/proposal_13",  nocons excel tex append  keep(`xvariable') 

	}
}








* sickness as IV?

foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w  parent_present_when_eat_w decision_w {


	foreach yvariable in num_fast_food_w2 num_eat_breakfast_w2 num_eat_lunch_w2 num_eat_dinner_w2 vege_fruits_w2 vege_fruits_dum_w cookies_dum_w   {


	areg `yvariable'  	`xvariable' c.res_mom_work_hours_v2_w c.zConscientiousness_w1 zNeuroticism_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel  $health $time_panel [pw=GSWGT] if wave == 2, absorb(FAMID) vce(cluster FAMID)
	    outreg2 using "F:/proposal_10",  nocons excel tex append  keep(`xvariable') 

	}
}








foreach xvariable in before_school_supervision_w after_school_supervision_w bedtime_supervision_w  parent_present_when_eat_w decision_w {


	foreach yvariable in  vege_fruits_dum_w cookies_dum_w   {


	areg `yvariable'  	`xvariable' c.res_mom_work_hours_v2_w c.zConscientiousness_w1 zNeuroticism_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel  $health $time_panel [pw=GSWGT] , absorb(AID) vce(cluster AID)
	    outreg2 using "F:/proposal_11",  nocons excel tex append  keep(`xvariable') 

	}
}



* full sample
sum i.before_school_supervision_w i.after_school_supervision_w i.bedtime_supervision_w  parent_present_when_eat_w decision_w num_fast_food_w2 num_eat_breakfast_w2 num_eat_lunch_w2 num_eat_dinner_w2 vege_fruits_w2 i.vege_fruits_dum_w i.cookies_dum_w  [aw=GSWGT] if wave == 2

sum c.res_mom_work_hours_v2_w c.zConscientiousness_w1 zNeuroticism_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel  $health $time_panel [aw=GSWGT] if wave == 2 


* subsample
sum i.before_school_supervision_w i.after_school_supervision_w i.bedtime_supervision_w  parent_present_when_eat_w decision_w num_fast_food_w2 num_eat_breakfast_w2 num_eat_lunch_w2 num_eat_dinner_w2 vege_fruits_w2 i.vege_fruits_dum_w i.cookies_dum_w  [aw=GSWGT] if (FAMID != . & wave == 2)

sum c.res_mom_work_hours_v2_w c.zConscientiousness_w1 zNeuroticism_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel  $health $time_panel [aw=GSWGT] if (FAMID != . & wave == 2)




