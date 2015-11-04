

* first time regression


foreach yvariable in BMI_w1 BMI_zscore_w1  overweight_w1  obese_w1  {

	reg `yvariable'  res_mom_work_hours_v2_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty1", word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)

	reg `yvariable'  zConscientiousness_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty1", word ctitle(`yvariable')  excel append  keep(zConscientiousness_w1)


	reg `yvariable' res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty1", word ctitle(`yvariable'_control_part) excel append  keep(res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)
	
	
	reg `yvariable' i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty1", word ctitle(`yvariable'_control_part) excel append  keep(i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

	reg `yvariable' res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty1", word ctitle(`yvariable'_control_part) excel append  keep(res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)

	reg `yvariable' i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty1", word ctitle(`yvariable'_control_all) excel append  keep(i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

}
	
	
	
	
	






foreach yvariable in work_in_house_w1 times_tv_videos_w1 play_active_sport_w1 exercise_w1 {

	reg `yvariable'  res_mom_work_hours_v2_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty2", word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)

	reg `yvariable'  zConscientiousness_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty2", word ctitle(`yvariable')  excel append  keep(zConscientiousness_w1)


	reg `yvariable' res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty2", word ctitle(`yvariable'_control_part) excel append  keep(res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)
	
	
	reg `yvariable' i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty2", word ctitle(`yvariable'_control_part) excel append  keep(i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

	reg `yvariable' res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty2", word ctitle(`yvariable'_control_part) excel append  keep(res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)

	reg `yvariable' i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty2", word ctitle(`yvariable'_control_all) excel append  keep(i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

}






foreach yvariable in  hang_out_frds_w1 tv_hours_per_week_w1 video_hours_per_week_w1 computer_games_hours_per_week_w1 listen_radio_hours_per_week_w1 {

	reg `yvariable'  res_mom_work_hours_v2_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty3", word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)

	reg `yvariable'  zConscientiousness_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty3", word ctitle(`yvariable')  excel append  keep(zConscientiousness_w1)


	reg `yvariable' res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty3", word ctitle(`yvariable'_control_part) excel append  keep(res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)
	
	
	reg `yvariable' i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty3", word ctitle(`yvariable'_control_part) excel append  keep(i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

	reg `yvariable' res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty3", word ctitle(`yvariable'_control_part) excel append  keep(res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)

	reg `yvariable' i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty3", word ctitle(`yvariable'_control_all) excel append  keep(i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    


}




foreach yvariable in  sleep_hours_w1 enough_sleep_w1  {

	reg `yvariable'  res_mom_work_hours_v2_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty4", word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)

	reg `yvariable'  zConscientiousness_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty4", word ctitle(`yvariable')  excel append  keep(zConscientiousness_w1)


	reg `yvariable' res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty4", word ctitle(`yvariable'_control_part) excel append  keep(res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)
	
	
	reg `yvariable' i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty4", word ctitle(`yvariable'_control_part) excel append  keep(i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

	reg `yvariable' res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty4", word ctitle(`yvariable'_control_part) excel append  keep(res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)

	reg `yvariable' i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty4", word ctitle(`yvariable'_control_all) excel append  keep(i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

}



foreach yvariable in ever_had_sex_w1  how_many_cigarettes_w1 drink_amount_w1 {

	reg `yvariable'  res_mom_work_hours_v2_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty5", word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)

	reg `yvariable'  zConscientiousness_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty5", word ctitle(`yvariable')  excel append  keep(zConscientiousness_w1)


	reg `yvariable' res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty5", word ctitle(`yvariable'_control_part) excel append  keep(res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)
	
	
	reg `yvariable' i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty5", word ctitle(`yvariable'_control_part) excel append  keep(i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

	reg `yvariable' res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty5", word ctitle(`yvariable'_control_part) excel append  keep(res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)

	reg `yvariable' i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty5", word ctitle(`yvariable'_control_all) excel append  keep(i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

}




















































* these set of regressions are for interaction



foreach yvariable in BMI_w1 BMI_zscore_w1  overweight_w1  obese_w1  {

	reg `yvariable'  c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty1_interact", word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 )




	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty1_interact", word ctitle(`yvariable'_control_part) excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1  res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)
	
	
	reg `yvariable' i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty1_interact", word ctitle(`yvariable'_control_part) excel append  keep(i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty1_interact", word ctitle(`yvariable'_control_part) excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)

	reg `yvariable' i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty1_interact", word ctitle(`yvariable'_control_all) excel append  keep(i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

}
	
	
	
	
	






foreach yvariable in work_in_house_w1 times_tv_videos_w1 play_active_sport_w1 exercise_w1 {

	reg `yvariable'  c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty2_interact", word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 )




	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty2_interact", word ctitle(`yvariable'_control_part) excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1  res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)
	
	
	reg `yvariable' i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty2_interact", word ctitle(`yvariable'_control_part) excel append  keep(i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty2_interact", word ctitle(`yvariable'_control_part) excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)

	reg `yvariable' i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty2_interact", word ctitle(`yvariable'_control_all) excel append  keep(i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

}






foreach yvariable in  hang_out_frds_w1 tv_hours_per_week_w1 video_hours_per_week_w1 computer_games_hours_per_week_w1 listen_radio_hours_per_week_w1 {

	reg `yvariable'  c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty3_interact", word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 )




	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty3_interact", word ctitle(`yvariable'_control_part) excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1  res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)
	
	
	reg `yvariable' i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty3_interact", word ctitle(`yvariable'_control_part) excel append  keep(i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty3_interact", word ctitle(`yvariable'_control_part) excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)

	reg `yvariable' i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty3_interact", word ctitle(`yvariable'_control_all) excel append  keep(i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

}




foreach yvariable in  sleep_hours_w1 enough_sleep_w1  {

	reg `yvariable'  c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty4_interact", word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 )




	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty4_interact", word ctitle(`yvariable'_control_part) excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1  res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)
	
	
	reg `yvariable' i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty4_interact", word ctitle(`yvariable'_control_part) excel append  keep(i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty4_interact", word ctitle(`yvariable'_control_part) excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)

	reg `yvariable' i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty4_interact", word ctitle(`yvariable'_control_all) excel append  keep(i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

}



foreach yvariable in ever_had_sex_w1  how_many_cigarettes_w1 drink_amount_w1 {

	reg `yvariable'  c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty5_interact", word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 )




	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty5_interact", word ctitle(`yvariable'_control_part) excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1  res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)
	
	
	reg `yvariable' i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty5_interact", word ctitle(`yvariable'_control_part) excel append  keep(i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well 
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty5_interact", word ctitle(`yvariable'_control_part) excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)

	reg `yvariable' i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well
	outreg2 using "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_result\resulty5_interact", word ctitle(`yvariable'_control_all) excel append  keep(i.mom_full_time_child_report_v4_w1##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1)    

}





twoway (histogram tv_hours_per_week_w1 if decide_how_much_tv_w1==1,  color(green)) ///
       (histogram tv_hours_per_week_w1 if decide_how_much_tv_w1==0,  ///
	   fcolor(none) lcolor(black)), legend(order(1 "free" 2 "mom decide" ))	
