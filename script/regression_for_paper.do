
# maybe less behaviors, more x variables
    
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1, r
	outreg2 using IV1, title(IV) bdec(4) ctitle(1) tex replace
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV1, title(IV) bdec(4) ctitle(2) tex append
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV1, title(IV) bdec(4) ctitle(3) tex append

	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV1, title(IV) bdec(4) ctitle(4) tex append

	
	

foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1##c.`xvariable', r
	outreg2 using IV1_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV1_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV1_`xvariable', title(IV) bdec(4) ctitle(3) tex append
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV1_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}

	
	
	
	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1, r
	outreg2 using IV2, title(IV) bdec(4) ctitle(1) tex replace

	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(2) tex append

	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV2, title(IV) bdec(4) ctitle(3) tex append


	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV2, title(IV) bdec(4) ctitle(4) tex append

	
	

	
	
	
foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.`xvariable', r
	outreg2 using IV2_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV2_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV2_`xvariable', title(IV) bdec(4) ctitle(3) tex append

	
	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 i.decide_how_much_tv_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV2_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}
	
	
    
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
*************************************************************************************************************************************************************	

	


	
	
	    
	
	ologit hang_out_frds_w1 i.decide_hang_around_with_w1, r
	outreg2 using IV3, title(IV) bdec(4) ctitle(1) tex replace
	
	ologit hang_out_frds_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV3, title(IV) bdec(4) ctitle(2) tex append
	
	ologit hang_out_frds_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV3, title(IV) bdec(4) ctitle(3) tex append

	ologit hang_out_frds_w1 i.decide_hang_around_with_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV3, title(IV) bdec(4) ctitle(4) tex append

	
	

foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	ologit hang_out_frds_w1 i.decide_hang_around_with_w1##c.`xvariable', r
	outreg2 using IV3_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	ologit hang_out_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV3_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	ologit hang_out_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV3_`xvariable', title(IV) bdec(4) ctitle(3) tex append
	
	ologit hang_out_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV3_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}

	
	
	
	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1, r
	outreg2 using IV4, title(IV) bdec(4) ctitle(1) tex replace

	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV4, title(IV) bdec(4) ctitle(2) tex append

	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV4, title(IV) bdec(4) ctitle(3) tex append


	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV4, title(IV) bdec(4) ctitle(4) tex append

	
	

	
	
	
foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	ologit hang_out_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable', r
	outreg2 using IV4_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	ologit hang_out_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV4_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	ologit hang_out_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV4_`xvariable', title(IV) bdec(4) ctitle(3) tex append

	
	ologit hang_out_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 i.decide_how_much_tv_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV4_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}
	


	
	
	
	
	
	
	
	
	
	
	
	
	
*************************************************************************************************************************************************************	
	
	
	
	
	    
	
	reg smoke_frds_w1 i.decide_hang_around_with_w1, r
	outreg2 using IV5, title(IV) bdec(4) ctitle(1) tex replace
	
	reg smoke_frds_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV5, title(IV) bdec(4) ctitle(2) tex append
	
	reg smoke_frds_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV5, title(IV) bdec(4) ctitle(3) tex append

	reg smoke_frds_w1 i.decide_hang_around_with_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV5, title(IV) bdec(4) ctitle(4) tex append

	
	

foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	reg smoke_frds_w1 i.decide_hang_around_with_w1##c.`xvariable', r
	outreg2 using IV5_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	reg smoke_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV5_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	reg smoke_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV5_`xvariable', title(IV) bdec(4) ctitle(3) tex append
	
	reg smoke_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV5_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}

	
	
	
	reg smoke_frds_w1 res_mom_work_hours_v2_w1, r
	outreg2 using IV6, title(IV) bdec(4) ctitle(1) tex replace

	reg smoke_frds_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV6, title(IV) bdec(4) ctitle(2) tex append

	reg smoke_frds_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV6, title(IV) bdec(4) ctitle(3) tex append


	reg smoke_frds_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV6, title(IV) bdec(4) ctitle(4) tex append

	
	

	
	
	
foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	reg smoke_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable', r
	outreg2 using IV6_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	reg smoke_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV6_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	reg smoke_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV6_`xvariable', title(IV) bdec(4) ctitle(3) tex append

	
	reg smoke_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 i.decide_how_much_tv_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV6_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}
	


	
	
	
	
	
	
*************************************************************************************************************************************************************	
	
			reg smoke_frds_w1 i.decide_hang_around_with_w1 i.mom_stay_home_out_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994 i.res_mom_at_home_return_school_w1, r 
	
	
		reg drink_frds_w1 i.decide_hang_around_with_w1 i.mom_stay_home_out_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994 i.res_mom_at_home_go_to_bed_w1, r 
	
	
	
	res_mom_at_home_leave_school_w1
res_mom_at_home_return_school_w1
res_mom_at_home_go_to_bed_w1
	
	
	
	
	reg drink_frds_w1 i.decide_hang_around_with_w1, r
	outreg2 using IV7, title(IV) bdec(4) ctitle(1) tex replace
	
	reg drink_frds_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV7, title(IV) bdec(4) ctitle(2) tex append
	
	reg drink_frds_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV7, title(IV) bdec(4) ctitle(3) tex append

	reg drink_frds_w1 i.decide_hang_around_with_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV7, title(IV) bdec(4) ctitle(4) tex append

	
	

foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	reg drink_frds_w1 i.decide_hang_around_with_w1##c.`xvariable', r
	outreg2 using IV7_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	reg drink_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV7_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	reg drink_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV7_`xvariable', title(IV) bdec(4) ctitle(3) tex append
	
	reg drink_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV7_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}

	
	
	
	reg drink_frds_w1 res_mom_work_hours_v2_w1, r
	outreg2 using IV8, title(IV) bdec(4) ctitle(1) tex replace

	reg drink_frds_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV8, title(IV) bdec(4) ctitle(2) tex append

	reg drink_frds_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV8, title(IV) bdec(4) ctitle(3) tex append


	reg drink_frds_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV8, title(IV) bdec(4) ctitle(4) tex append

	
	

	
	
	
foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	reg drink_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable', r
	outreg2 using IV8_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	reg drink_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV8_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	reg drink_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV8_`xvariable', title(IV) bdec(4) ctitle(3) tex append

	
	reg drink_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 i.decide_how_much_tv_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV8_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}






*************************************************************************************************************************************************************	







	reg marijuana_frds_w1 i.decide_hang_around_with_w1, r
	outreg2 using IV9, title(IV) bdec(4) ctitle(1) tex replace
	
	reg marijuana_frds_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV9, title(IV) bdec(4) ctitle(2) tex append
	
	reg marijuana_frds_w1 i.decide_hang_around_with_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV9, title(IV) bdec(4) ctitle(3) tex append

	reg marijuana_frds_w1 i.decide_hang_around_with_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV9, title(IV) bdec(4) ctitle(4) tex append

	
	

foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	reg marijuana_frds_w1 i.decide_hang_around_with_w1##c.`xvariable', r
	outreg2 using IV9_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	reg marijuana_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV9_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	reg marijuana_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV9_`xvariable', title(IV) bdec(4) ctitle(3) tex append
	
	reg marijuana_frds_w1 i.decide_hang_around_with_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV9_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}

	
	
	
	reg marijuana_frds_w1 res_mom_work_hours_v2_w1, r
	outreg2 using IV10, title(IV) bdec(4) ctitle(1) tex replace

	reg marijuana_frds_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV10, title(IV) bdec(4) ctitle(2) tex append

	reg marijuana_frds_w1 res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV10, title(IV) bdec(4) ctitle(3) tex append


	reg marijuana_frds_w1 res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV10, title(IV) bdec(4) ctitle(4) tex append

	
	

	
	
	
foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	reg marijuana_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable', r
	outreg2 using IV10_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	reg marijuana_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV10_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	reg marijuana_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV10_`xvariable', title(IV) bdec(4) ctitle(3) tex append

	
	reg marijuana_frds_w1 c.res_mom_work_hours_v2_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 i.decide_how_much_tv_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV10_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}



	


	
	
	
*************************************************************************************************************************************************************	







	probit H1GH23J i.decide_what_you_eat_w1, r
	outreg2 using IV9, title(IV) bdec(4) ctitle(1) tex replace
	
	probit H1GH23J i.decide_what_you_eat_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV9, title(IV) bdec(4) ctitle(2) tex append
	
	probit H1GH23J i.decide_what_you_eat_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV9, title(IV) bdec(4) ctitle(3) tex append

	probit H1GH23J i.decide_what_you_eat_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV9, title(IV) bdec(4) ctitle(4) tex append

	
	

foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	probit H1GH23J i.decide_what_you_eat_w1##c.`xvariable', r
	outreg2 using IV9_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	probit H1GH23J i.decide_what_you_eat_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV9_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	probit H1GH23J i.decide_what_you_eat_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV9_`xvariable', title(IV) bdec(4) ctitle(3) tex append
	
	probit H1GH23J i.decide_what_you_eat_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV9_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}

	
	
	
	probit H1GH23J res_mom_work_hours_v2_w1, r
	outreg2 using IV10, title(IV) bdec(4) ctitle(1) tex replace

	probit H1GH23J res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV10, title(IV) bdec(4) ctitle(2) tex append

	probit H1GH23J res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV10, title(IV) bdec(4) ctitle(3) tex append


	probit H1GH23J res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV10, title(IV) bdec(4) ctitle(4) tex append

	
	

	
	
	
foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	probit H1GH23J c.res_mom_work_hours_v2_w1##c.`xvariable', r
	outreg2 using IV10_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	probit H1GH23J c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV10_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	probit H1GH23J c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV10_`xvariable', title(IV) bdec(4) ctitle(3) tex append

	
	probit H1GH23J c.res_mom_work_hours_v2_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 i.decide_how_much_tv_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV10_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}











*************************************************************************************************************************************************************	







	probit error_sex_dummy i.family_pays_attention_w1, r
	outreg2 using IV11, title(IV) bdec(4) ctitle(1) tex replace
	
	probit error_sex_dummy i.family_pays_attention_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV11, title(IV) bdec(4) ctitle(2) tex append
	
	probit error_sex_dummy i.family_pays_attention_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994 , r 
	outreg2 using IV11, title(IV) bdec(4) ctitle(3) tex append

	probit error_sex_dummy i.family_pays_attention_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV11, title(IV) bdec(4) ctitle(4) tex append

	
	

foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	probit error_sex_dummy i.family_pays_attention_w1##c.`xvariable', r
	outreg2 using IV11_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	probit error_sex_dummy i.family_pays_attention_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV11_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	probit error_sex_dummy i.family_pays_attention_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV11_`xvariable', title(IV) bdec(4) ctitle(3) tex append
	
	probit error_sex_dummy i.family_pays_attention_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV11_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}

	
	
	
	probit error_sex_dummy res_mom_work_hours_v2_w1, r
	outreg2 using IV12, title(IV) bdec(4) ctitle(1) tex replace

	probit error_sex_dummy res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV12, title(IV) bdec(4) ctitle(2) tex append

	probit error_sex_dummy res_mom_work_hours_v2_w1 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV12, title(IV) bdec(4) ctitle(3) tex append


	probit error_sex_dummy res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV12, title(IV) bdec(4) ctitle(4) tex append

	
	

	
	
	
foreach xvariable in zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 {
	
	
	probit error_sex_dummy c.res_mom_work_hours_v2_w1##c.`xvariable', r
	outreg2 using IV12_`xvariable', title(IV) bdec(4) ctitle(1) tex replace
	
	probit error_sex_dummy c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 , r 
	outreg2 using IV12_`xvariable', title(IV) bdec(4) ctitle(2) tex append

	probit error_sex_dummy c.res_mom_work_hours_v2_w1##c.`xvariable' $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 $fam_mem_bg $mom_bg $dad_bg family_income_1994, r 
	outreg2 using IV12_`xvariable', title(IV) bdec(4) ctitle(3) tex append

	
	probit error_sex_dummy c.res_mom_work_hours_v2_w1##c.`xvariable' zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 i.decide_how_much_tv_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1   ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	outreg2 using IV12_`xvariable', title(IV) bdec(4) ctitle(4) tex append
	
}


	

		