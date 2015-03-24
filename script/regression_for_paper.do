





	
* 6 outcomes: tv hours, video_hours_per_week_w1, what you eat in breakfast, communicate with frds, smoke, drink, sex
* 2 error: sex, drink  lie_to_parents_w1 drink_when_parents_not_home_w1

	
/*
******** side reg	
	reg  computer_games_hours_per_week_w1 i.decide_how_much_tv_w1##c.zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r

		reg  computer_games_hours_per_week_w1 i.decide_how_much_tv_w1##c.zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r
******** side reg	
*/

* IV for staying home

* freedom: allowance, parents control over something, residence mom hours, mom stay home , later: res_mom_at_home_leave_school_w1 res_mom_at_home_return_school_w1 res_mom_at_home_go_to_bed_w1




	
	replace res_mom_at_home_leave_school_w1 = 0 if res_mom_at_home_leave_school_w1 == 6
	replace res_mom_at_home_return_school_w1 = 0 if res_mom_at_home_return_school_w1 == 6
	


	
	gen mom_at_home_index = res_mom_at_home_leave_school_w1 + res_mom_at_home_return_school_w1 + res_mom_at_home_go_to_bed_w1
	
	gen mom_at_home_index_dummy = 0 if  mom_at_home_index <= 3	
	replace mom_at_home_index_dummy = 1 if mom_at_home_index > 3 & mom_at_home_index <= 9
	replace mom_at_home_index_dummy = 2 if mom_at_home_index > 9

	
	gen res_mom_at_home_go_to_bed_d_w1 = 0 if res_mom_at_home_go_to_bed_w1 == 1 | res_mom_at_home_go_to_bed_w1 == 2
	replace res_mom_at_home_go_to_bed_d_w1 = 1 if res_mom_at_home_go_to_bed_w1 == 3 | res_mom_at_home_go_to_bed_w1 == 4 | res_mom_at_home_go_to_bed_w1 == 5
	
	
	
	
	  possible controls: i.want_college_w1  i.mom_care_about_u_w1 family_attention allowance_w1    drink_days_w1
	

	* interaction with res_mom_at_home_leave_school_w1 res_mom_at_home_return_school_w1  res_mom_at_home_go_to_bed_w1
	* find IV for working hours and when stay home 
	
	* another topic: flexibility of time: better child and health outcome
	
	* write a ado file to show how adding each coefficient reduce sample size and how it affects variable of interest
	
	
	
	
   count if missing( zExtraversion_w1  )
	
	
	
	
	
	
	
	
	
	
	oprobit mom_at_home_index_dummy res_mom_work_hours_v2_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r
	
	
	probit decide_how_much_tv_w1 i.mom_at_home_index_dummy  res_mom_work_hours_v2_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r
	
	
	
	probit  decide_time_at_home_weekend_w1 i.mom_at_home_index_dummy  res_mom_work_hours_v2_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r
	
	
	
	probit decide_what_time_go_bed_w1 i.mom_at_home_index_dummy  res_mom_work_hours_v2_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r
	
	
	
	probit decide_what_you_eat_w1 i.mom_at_home_index_dummy  res_mom_work_hours_v2_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r
	
	
	reg allowance_w1 i.mom_at_home_index_dummy  res_mom_work_hours_v2_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r
	
	
	
	
	
	
	
	
	* 0.59
	
	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1 i.grade_ELA_w1 i.grade_math_w1 , r

	
	
	
	

	
	
	
	
	* res_mom_work_hours
	
	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1, r
	outreg2 using result_2_tv_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_tv_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_tv_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)


	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_tv_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_tv_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) r
	


	* res mom at home or not
		
	reg tv_hours_per_week_w1 i.mom_at_home_index_dummy, r
	outreg2 using result_2_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	reg tv_hours_per_week_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	reg tv_hours_per_week_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	reg tv_hours_per_week_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	reg tv_hours_per_week_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy)
	 


	

	* res mom control
	
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1, r
	outreg2 using result_2_tv_control, word ctitle(`yvariable')  excel append  keep(i.decide_how_much_tv_w1) replace


	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_tv_control, word ctitle(`yvariable')  excel append  keep(i.decide_how_much_tv_w1) 
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_tv_control, word ctitle(`yvariable')  excel append  keep(i.decide_how_much_tv_w1) 


	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_tv_control, word ctitle(`yvariable')  excel append  keep(i.decide_how_much_tv_w1) 

	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_tv_control, word ctitle(`yvariable')  excel append  keep(i.decide_how_much_tv_w1) 
	


	


    * allowance
	
	reg tv_hours_per_week_w1 allowance_w1, r
	outreg2 using result_2_tv_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) replace

	reg tv_hours_per_week_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_tv_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	reg tv_hours_per_week_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_tv_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 


	reg tv_hours_per_week_w1 allowance_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_tv_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	
	reg tv_hours_per_week_w1 allowance_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_tv_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1)
	


	
	

	
	
	

	
	
	
/* skip this	
	
	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##i.decide_how_much_tv_w1, r
	outreg2 using IV2, title(IV) bdec(4) ctitle(1) tex replace excel keep(res_mom_work_hours_v2_w1)

	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##i.decide_how_much_tv_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(2) tex append  excel keep(res_mom_work_hours_v2_w1)

	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##i.decide_how_much_tv_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(3) tex append  excel keep(res_mom_work_hours_v2_w1)


	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##i.decide_how_much_tv_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r
	outreg2 using IV2, title(IV) bdec(4) ctitle(4) tex append  excel keep(res_mom_work_hours_v2_w1)

	
	
margins, dydx(res_mom_work_hours_v2_w1) at(decide_how_much_tv_w1=(0 1)) vsquish	
	
	
	
	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##i.decide_how_much_tv_w1, r
	outreg2 using IV2, title(IV) bdec(4) ctitle(1) tex replace excel keep(res_mom_work_hours_v2_w1)

	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##i.decide_how_much_tv_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(2) tex append  excel keep(res_mom_work_hours_v2_w1)

	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##i.decide_how_much_tv_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(3) tex append  excel keep(res_mom_work_hours_v2_w1)


	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##i.decide_how_much_tv_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r
	outreg2 using IV2, title(IV) bdec(4) ctitle(4) tex append  excel keep(res_mom_work_hours_v2_w1)

	
	
	
margins, dydx(mom_stay_home_out_w1) at(decide_how_much_tv_w1=(0 1)) vsquish	
	
	
*/	
	
	
	/*
	
	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##c.zConscientiousness_w1, r
	outreg2 using IV2, title(IV) bdec(4) ctitle(1) tex replace excel keep(res_mom_work_hours_v2_w1)

	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##c.zConscientiousness_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(2) tex append  excel keep(res_mom_work_hours_v2_w1)

	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##c.zConscientiousness_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(3) tex append  excel keep(res_mom_work_hours_v2_w1)


	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##c.zConscientiousness_w1 i.decide_how_much_tv_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r

		
margins, dydx(mom_stay_home_out_w1) at(zConscientiousness_w1=(-2 2)) vsquish	
	
		
		
	
	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1, r
	outreg2 using IV2, title(IV) bdec(4) ctitle(1) tex replace excel keep(res_mom_work_hours_v2_w1)

	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(2) tex append  excel keep(res_mom_work_hours_v2_w1)

	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(3) tex append  excel keep(res_mom_work_hours_v2_w1)


	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 i.decide_how_much_tv_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 i.mom_stay_home_out_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r

		
	
	
margins, dydx(res_mom_work_hours_v2_w1) at(zConscientiousness_w1=(-2 2)) vsquish	
	
	
	

	
	
	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##c.res_mom_work_hours_v2_w1, r
	outreg2 using IV2, title(IV) bdec(4) ctitle(1) tex replace excel keep(res_mom_work_hours_v2_w1)

	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##c.res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(2) tex append  excel keep(res_mom_work_hours_v2_w1)

	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##c.res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(3) tex append  excel keep(res_mom_work_hours_v2_w1)


	reg tv_hours_per_week_w1 i.mom_stay_home_out_w1##c.res_mom_work_hours_v2_w1   i.decide_how_much_tv_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1  res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r

	
	

	
	margins, dydx(res_mom_work_hours_v2_w1) at(mom_stay_home_out_w1=(1 2 3)) vsquish	

	*/
		
		
		
		
		
 
	
	

		
	
*************************************************************************************************************************************************************	
	
	
   	
	
	* res_mom_work_hours
	
	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1, r
	outreg2 using result_2_frd_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_frd_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_frd_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_frd_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	ologit hang_out_frds_w1 c.res_mom_work_hours_v2_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_frd_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 
	


	* res mom at home or not
		
	ologit hang_out_frds_w1 i.mom_at_home_index_dummy, r
	outreg2 using result_2_frd_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	ologit hang_out_frds_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_frd_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	ologit hang_out_frds_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_frd_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	ologit hang_out_frds_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_frd_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	ologit hang_out_frds_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_frd_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 
	 


	
	

	* res mom control
	
	
	ologit hang_out_frds_w1 i.decide_hang_around_with_w1, r
	outreg2 using result_2_frd_control, word ctitle(`yvariable')  excel append  keep(i.decide_hang_around_with_w1) replace

	ologit hang_out_frds_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_frd_control, word ctitle(`yvariable')  excel append  keep(i.decide_hang_around_with_w1) 

	ologit hang_out_frds_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_frd_control, word ctitle(`yvariable')  excel append  keep(i.decide_hang_around_with_w1) 


	ologit hang_out_frds_w1 i.decide_hang_around_with_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_frd_control, word ctitle(`yvariable')  excel append  keep(i.decide_hang_around_with_w1) 

	
	ologit hang_out_frds_w1 i.decide_hang_around_with_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_frd_control, word ctitle(`yvariable')  excel append  keep(i.decide_hang_around_with_w1) 
	


	


    * allowance
	
	ologit hang_out_frds_w1 allowance_w1, r
	outreg2 using result_2_frd_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) replace

	ologit hang_out_frds_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_frd_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	ologit hang_out_frds_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_frd_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 


	ologit hang_out_frds_w1 allowance_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_frd_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	
	ologit hang_out_frds_w1 allowance_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_frd_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 
	
	


	
	
	

	
	
/* maybe 	
	
	
gen 	marijuana_frds_dummy_w1 =0 if marijuana_frds_w1 == 0
replace marijuana_frds_dummy_w1 = 1 if marijuana_frds_w1 > 0 
	
	
	
	
		reg marijuana_frds_dummy_w1 i.decide_hang_around_with_w1, r
	
	reg marijuana_frds_dummy_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	
	reg marijuana_frds_dummy_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 

	reg marijuana_frds_dummy_w1 i.decide_hang_around_with_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r

	
	
		
		reg marijuana_frds_dummy_w1 allowance_w1, r
	
	reg marijuana_frds_dummy_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	
	reg marijuana_frds_dummy_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 

	reg marijuana_frds_dummy_w1 allowance_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r

	
	*/
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
*************************************************************************************************************************************************************	
	
	
	
	
	* res_mom_work_hours
	
	probit eat_breakfast_w1 res_mom_work_hours_v2_w1, r
	outreg2 using result_2_breakfast_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace


	probit eat_breakfast_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_breakfast_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit eat_breakfast_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_breakfast_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit eat_breakfast_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_breakfast_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	probit eat_breakfast_w1 c.res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_breakfast_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 
	


	* res mom at home or not
		
	probit eat_breakfast_w1 i.mom_at_home_index_dummy, r 
	outreg2 using result_2_breakfast_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	probit eat_breakfast_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_breakfast_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit eat_breakfast_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_breakfast_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy)


	probit eat_breakfast_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_breakfast_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	probit eat_breakfast_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_breakfast_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 
	


	
	

	* res mom control (eat breakfast = have nothing for breakfast)
	
	
	probit eat_breakfast_w1 i.decide_what_you_eat_w1, r
	outreg2 using result_2_breakfast_control, word ctitle(`yvariable')  excel append  keep(i.decide_what_you_eat_w1) replace

	probit eat_breakfast_w1 i.decide_what_you_eat_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_breakfast_control, word ctitle(`yvariable')  excel append  keep(i.decide_what_you_eat_w1) 

	probit eat_breakfast_w1 i.decide_what_you_eat_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_breakfast_control, word ctitle(`yvariable')  excel append  keep(i.decide_what_you_eat_w1) 


	probit eat_breakfast_w1 i.decide_what_you_eat_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_breakfast_control, word ctitle(`yvariable')  excel append  keep(i.decide_what_you_eat_w1) 

	
	probit eat_breakfast_w1 i.decide_what_you_eat_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r	
	outreg2 using result_2_breakfast_control, word ctitle(`yvariable')  excel append  keep(i.decide_what_you_eat_w1) 


	


    * allowance
	
	probit eat_breakfast_w1 allowance_w1, r
	outreg2 using result_2_breakfast_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) replace

	probit eat_breakfast_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_breakfast_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 
	
	probit eat_breakfast_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_breakfast_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 


	probit eat_breakfast_w1 allowance_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_breakfast_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	
	probit eat_breakfast_w1 allowance_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_breakfast_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 
	


	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
*************************************************************************************************************************************************************


	
*	possible addition control: 	** i.mom_att_sex_w1 **i.mom_talk_wrongdoings_w1  **family_pays_attention_w1

	
	* res_mom_work_hours
	
	probit ever_had_sex_w1 res_mom_work_hours_v2_w1, r
	outreg2 using result_2_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit ever_had_sex_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit ever_had_sex_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit ever_had_sex_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	 $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported i.had_relationship_w1,r
	outreg2 using result_2_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

		

	probit ever_had_sex_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	 $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report i.had_relationship_w1,r
	outreg2 using result_2_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 
	


	* res mom at home or not
		
	probit ever_had_sex_w1 i.mom_at_home_index_dummy, r
	outreg2 using result_2_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace
	
	probit ever_had_sex_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit ever_had_sex_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	probit ever_had_sex_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	 $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported i.had_relationship_w1,r
	outreg2 using result_2_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	probit ever_had_sex_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	 $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report i.had_relationship_w1,r
	outreg2 using result_2_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 



	
	

	* res mom control (not available)
	
	

	

    * allowance
	
	probit ever_had_sex_w1 allowance_w1, r
	outreg2 using result_2_sex_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) replace

	probit ever_had_sex_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_sex_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 
	
	probit ever_had_sex_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_sex_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 


	probit ever_had_sex_w1 allowance_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	 $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported i.had_relationship_w1,r
	outreg2 using result_2_sex_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	
	probit ever_had_sex_w1 allowance_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	 $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report i.had_relationship_w1,r
	outreg2 using result_2_sex_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
*************************************************************************************************************************************************************	
	
	
	
	* res_mom_work_hours
	
	probit drink_alcohol_w1 res_mom_work_hours_v2_w1, r
	outreg2 using result_2_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit drink_alcohol_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit drink_alcohol_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)


	probit drink_alcohol_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	probit drink_alcohol_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 



	* res mom at home or not
		
	probit drink_alcohol_w1 i.mom_at_home_index_dummy, r
	outreg2 using result_2_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	probit drink_alcohol_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit drink_alcohol_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	probit drink_alcohol_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	probit drink_alcohol_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 
	 


	
	

	* res mom control (not available)
	
	

	


    * allowance
	
	probit drink_alcohol_w1 allowance_w1, r
	outreg2 using result_2_alcohol_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) replace

	probit drink_alcohol_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_alcohol_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1)

	probit drink_alcohol_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_alcohol_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 


	probit drink_alcohol_w1 allowance_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_alcohol_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	
	probit drink_alcohol_w1 allowance_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_alcohol_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 
	










	
	
	
	
	
	
	
	
	
	
	
	
	
	
*************************************************************************************************************************************************************	
	
		
	* res_mom_work_hours
	
	probit tried_cigarette_w1 res_mom_work_hours_v2_w1, r
	outreg2 using result_2_cigarette_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit tried_cigarette_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_cigarette_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit tried_cigarette_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_cigarette_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit tried_cigarette_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_cigarette_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	probit tried_cigarette_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_cigarette_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 
	


	* res mom at home or not
		
	probit tried_cigarette_w1 i.mom_at_home_index_dummy, r
	outreg2 using result_2_cigarette_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	probit tried_cigarette_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_cigarette_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit tried_cigarette_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_cigarette_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	probit tried_cigarette_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_cigarette_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	probit tried_cigarette_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_cigarette_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 
	


	
	

	* res mom control (not available)
	
	

	


    * allowance
	
	probit tried_cigarette_w1 allowance_w1, r
	outreg2 using result_2_cigarette_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) replace

	probit tried_cigarette_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_cigarette_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	probit tried_cigarette_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_cigarette_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 


	probit tried_cigarette_w1 allowance_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_cigarette_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	
	probit tried_cigarette_w1 allowance_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_cigarette_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 
	






	
	

	
	
		

	

	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
*************************************************************************************************************************************************************	
	
		
	
			
	* res_mom_work_hours
	
	reg how_many_times_marijuana_w1 res_mom_work_hours_v2_w1, r
	outreg2 using result_2_marijuana_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace
	

	reg how_many_times_marijuana_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_marijuana_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	reg how_many_times_marijuana_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_marijuana_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)


	reg how_many_times_marijuana_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_marijuana_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	reg how_many_times_marijuana_w1 res_mom_work_hours_v2_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_marijuana_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 
	


	* res mom at home or not
		
	reg how_many_times_marijuana_w1 i.mom_at_home_index_dummy, r
	outreg2 using result_2_marijuana_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	reg how_many_times_marijuana_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_marijuana_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	reg how_many_times_marijuana_w1 i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_marijuana_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	reg how_many_times_marijuana_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_marijuana_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 
	
	
	reg how_many_times_marijuana_w1 i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_marijuana_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 
	 


	
	

	* res mom control (not available)
	
	

	


    * allowance
	
	reg how_many_times_marijuana_w1 allowance_w1, r
	outreg2 using result_2_marijuana_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) replace

	reg how_many_times_marijuana_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_marijuana_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	reg how_many_times_marijuana_w1 allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_marijuana_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 


	reg how_many_times_marijuana_w1 allowance_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_marijuana_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	
	reg how_many_times_marijuana_w1 allowance_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_marijuana_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 
	






	
	
	
*************************************************************************************************************************************************************	



    * res_mom_work_hours
	
	probit error_sex_dummy res_mom_work_hours_v2_w1, r
	outreg2 using result_2_error_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace
	

	probit error_sex_dummy res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_error_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit error_sex_dummy res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_error_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)


	probit error_sex_dummy res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_error_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

/*	* not working
	probit error_sex_dummy res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
*/	


	* res mom at home or not
		
	probit error_sex_dummy i.mom_at_home_index_dummy, r
	outreg2 using result_2_error_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	probit error_sex_dummy i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_error_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit error_sex_dummy i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_error_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	probit error_sex_dummy i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_error_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
/*	* not working
	probit error_sex_dummy i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	
*/

	
	

	* res mom control (not available)
	
	

	


    * allowance
	
	probit error_sex_dummy allowance_w1, r
	outreg2 using result_2_error_sex_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) replace

	probit error_sex_dummy allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_error_sex_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 

	probit error_sex_dummy allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_error_sex_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 


	probit error_sex_dummy allowance_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_error_sex_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 
	
	
/* 	
	probit error_sex_dummy allowance_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_error_sex_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) replace
	
*/













/*

	
	* see a pattern
	probit error_sex_dummy i.res_mom_at_home_return_school_w1  , r

	probit error_sex_dummy i.res_mom_at_home_return_school_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 

	probit error_sex_dummy i.res_mom_at_home_return_school_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994 , r 

	probit error_sex_dummy  i.res_mom_at_home_return_school_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1  res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	     $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r
	
		
		
	* no pattern. Maybe data?
		probit error_sex_dummy i.res_mom_at_home_go_to_bed_w1  , r

	probit error_sex_dummy i.res_mom_at_home_go_to_bed_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 

	probit error_sex_dummy i.res_mom_at_home_go_to_bed_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994 , r 

	probit error_sex_dummy  i.res_mom_at_home_go_to_bed_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1  res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	     $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  i.expect_college_w1 i.mom_disappoint_college_w1 i.dad_disappoint_college_w1 i.dad_disappoint_hs_w1, r
	
		
	*/	
		
		
		
		
		
		

		
		
		
		
		
*************************************************************************************************************************************************************	
		
		
		
		
		
		
		
		
	* res_mom_work_hours
	
	probit error_alcohol_dummy res_mom_work_hours_v2_w1, r
	outreg2 using result_2_error_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit error_alcohol_dummy res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_error_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit error_alcohol_dummy res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_error_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit error_alcohol_dummy res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_error_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit error_alcohol_dummy res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_error_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 



	* res mom at home or not
		
	probit error_alcohol_dummy i.mom_at_home_index_dummy, r
	outreg2 using result_2_error_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	probit error_alcohol_dummy i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_error_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit error_alcohol_dummy i.mom_at_home_index_dummy $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_error_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	probit error_alcohol_dummy i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_error_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	
	probit error_alcohol_dummy i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	outreg2 using result_2_error_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 
	


	
	

	* res mom control (not available)
	
	

	


    * allowance
	
	probit error_alcohol_dummy allowance_w1, r
	outreg2 using result_2_error_alcohol_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) replace

	probit error_alcohol_dummy allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using result_2_error_alcohol_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1)

	probit error_alcohol_dummy allowance_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg $family_wealth, r 
	outreg2 using result_2_error_alcohol_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 


	probit error_alcohol_dummy allowance_w1 zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported,r
	outreg2 using result_2_error_alcohol_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) 
	
/*	
	probit error_alcohol_dummy allowance_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r	
	outreg2 using result_2_error_alcohol_allowance, word ctitle(`yvariable')  excel append  keep(allowance_w1) replace
*/
		
		
		
		
		
		
	
		
			
			
			
			
