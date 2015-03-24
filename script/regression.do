*  cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"



cd "C:\Users\Julian.Julian-PC\Dropbox\J file\dissertation\Add_health_data\temp_data"
* cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"

* cd "C:\Users\AYSPS\Desktop\temp_data"


clear all

set maxvar 32767

use constructed_variables, clear

* skip feel_part_of_school_w1 happy_at_school_w1 close_to_people_w1 get_along_teacher_w1 get_hw_done_w1 stud_prejudiced_w1 teachers_treat_fairly_w1 i.grade_ELA_w1 i.grade_math_w1 i.grade_history_w1 i.grade_science_w1 

#delimit ;
global school_related_controls 
i.abs_school_w1 abs_school_no_excuse_w1 i.suspension_w1 
i.pay_attention_w1 i.get_along_stud_w1 i.get_along_teacher_w1  i.feel_safe_w1;
sum $school_related_controls;



* could_not_shake_off_blues_w1 felt_depressed_w1 felt_sad_w1 felt_disliked_w1 enjoyed_life_w1 felt_life_failure_w1 felt_happy_w1;

global psy_health i.bothered_by_things_w1 i.appetite_w1 
i.felt_as_good_as_others_w1 i.trouble_concentrate_w1  i.felt_too_tired_w1 
i.felt_hopeful_w1  i.felt_fearful_w1 i.talked_less_w1 
i.felt_lonely_w1 i.felt_unfriendly_w1  
i.hard_get_started_w1 i.life_not_worth_living_w1;
sum $psy_health;


global health_status i.general_health_w1 i.health_cause_soc_absence_w1;
sum $health_status;


* family_income_1994 i.enuf_pay_bills i.Soc_Sec i.SSI i.AFDC i.food_stamps i.unemp_compensation i.housing_sub;

global family_wealth i.routine_phy_check_w1 i.cigarettes_available_home_w1 i.alcohol_available_home_w1 i.drugs_available_home_w1 i.gun_available_home_w1;
sum $family_wealth;


* skip residence_type_w1 nearby_well_kept_w1 i.environment_nearby_w1 neighborhood_happy_w1 someone_pulled_weapon_w1 saw_shoot_stab_someone_w1 neighbor_look_out_others_w1;

* i.move_here_reason_A i.move_here_reason_B i.move_here_reason_C i.move_here_reason_D i.move_here_reason_E  i.move_here_reason_F i.move_here_reason_G i.move_here_reason_H i.move_here_reason_I i.move_here_reason_J;
   
	
global environment i.know_neighborhood_w1 i.environment_nearby_w1 
i.neighborhood_gym_w1 i.neighborhood_safe_w1  i.move_out_happy_w1 
i.building_type_w1 i.building_well_kept_w1  i.nearby_safe_w1;     
sum $environment;





* skip age_mom_w1 age_dad_w1;

* skip i.full_time_mom_or_dad i.sex_spouse  other_spouse indian_spouse  asian_spouse happy_spouse work_outside_spouse fight_w_spouse retired_spouse full_time_mom_or_dad separating_spouse disabled_spouse 
i.white_spouse i.black_spouse  
i.religion_spouse i.school_spouse i.full_time_spouse i.disabled_spouse 
i.receive_public_assist_spouse  i.happy_w_spouse  
i.health_status_spouse i.drink_alcohol_spouse;                                                  


* i.sex_mom_or_dad age_mom_or_dad i.marital_status_mom_or_dad i.work_outside_mom_or_dad  i.receiving_public_assistance 
i.religion_parent i.parent_org i.military_org i.labor_union i.hobby_org i.civic_org  i.most_important_son_learn i.most_important_daughter_learn i.ever_married;


* skip i.bio_mom_w1 i.bio_dad_w1 num_sibling_survey_w1 num_household_mem_w1;

global fam_mem_bg i.mom_w1  i.dummy_mom_lived_in_households_w1 i.dad_w1  
i.dummy_dad_lived_in_households_w1 num_bro_w1 num_sis_w1 num_granddad_w1 num_grandmom_w1; 
sum $fam_mem_bg;


* skip res_mom_public_assistance_w1 mom_stay_home_out_w1;

global mom_bg i.res_mom_educ_w1 i.res_mom_born_US_w1 i.res_mom_occupation_w1 i.res_mom_handicapped_w1 i.res_mom_smoked_w1; 
sum $mom_bg;


* res_dad_public_assistance_w1 dad_stay_home_out_w1;
* this cut a lot of data!!!;
global dad_bg i.res_dad_educ_w1 i.res_dad_born_US_w1 i.res_dad_occupation_w1 i.res_dad_handicapped_w1 i.res_dad_smoked_w1; 
sum $dad_bg;



* skip birth_control_hazzle_w1 birth_control_expensive_w1 birth_control_plan_trouble_w1;
* these 3 variables screw up my regression!!!;
global relationship i.had_relationship_w1 i.ever_had_sex_w1; 		  
sum $relationship;


* skip religion_importance_w1 god_without_mistakes_w1  i.religion_activities_w1;
global religion i.religion_w1 i.attend_religious_service_w1 i.pray_times_w1;
sum $religion;


* skip family_fun_w1 parents_care_w1 leave_home_w1 family_pays_attention_w1;
global relation_w_ppl i.adults_care_w1 i.teachers_care_w1 i.frds_care_w1 i.family_understands_w1;
sum $relation_w_ppl;

* skip earnings_non_summer_w1 earnings_summer_w1 work_outside_w1 want_college_w1;
global income_and_expectation i.expect_college_w1 work_hours_non_summer_w1 work_hours_summer_w1  earning_per_week_w1;
sum $income_and_expectation;



* skip physical_attractive_w1 resp_family_smoke_w1 resp_family_drink_w1 interview_location_w1 well_groom_w1 personality_attractive_w1 number_interruptions_w1;
global interviewer_comments i.candid_w1 i.physical_mature_w1 i.third_person_presence_w1 i.resp_impatient_w1 i.resp_embarrassed_w1;
sum $interviewer_comments;


* skip i.school_good_learn  i.school_safe  i.school_good;
global mother_report_child i.relationship i.bio_mom_live_here i.bio_dad_live_here i.know_frds i.met_frds i.met_frds_parents i.opinion_frds i.kids_have_gf_bf i.talk_to_how_many_parents
i.son_health i.medicare i.medicaid i.individual_coverage i.prepaid_health_plan i.other i.none i.dont_know i.time_to_bed i.in_school i.talk_about_school_grade i.talk_about_school_things  i.talk_to_teachers
i.participate_school_activities i.expect_high_school_stud i.expect_hs i.bad_temper i.son_life i.get_along_well i.make_decision_tgt  i.do_not_understand_him  i.trust_him i.son_interferes_u i.not_live_with_you_6_months
i.retarded i.learning_disability i.special_educ i.son_use_tobacco i.son_use_alcohol i.son_ever_gone_date i.son_ever_kissed i.son_ever_had_sex;
sum $mother_report_child; 



global respondent_background AH_PVT i.race age_w1 BIO_SEX;

#delimit cr













*********************** mom hrs ************






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





sum BMI_w1 BMI_zscore_w1  overweight_w1  obese_w1 work_in_house_w1 times_tv_videos_w1 play_active_sport_w1 exercise_w1 hang_out_frds_w1 tv_hours_per_week_w1 video_hours_per_week_w1 computer_games_hours_per_week_w1 listen_radio_hours_per_week_w1 sleep_hours_w1 enough_sleep_w1 ever_had_sex_w1  ///
how_many_cigarettes_w1 drink_amount_w1 mom_full_time_child_report_v4_w1 zConscientiousness_w1 ///
dad_full_time_child_report_v4_w1 zConscientiousness_w1 mom_stay_home_out_w1 decide_how_much_tv_w1 decide_what_time_go_bed_w1 decide_what_you_eat_w1 parent_present_when_eat_w1 adults_care_w1  family_income_1994 



$school_related_controls $psy_health ///
$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
$relationship $religion $relation_w_ppl  $income_and_expectation ///
$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well



	reg H1GH23J i.`xvariable'##c.zConscientiousness_w1 i.dad_full_time_child_report_v4_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background want_college_w1 mom_disappoint_college_w1 mom_disappoint_hs_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1




	
foreach xvariable in decide_how_much_tv_w1  {


	ologit get_hw_done_w1  i.`xvariable'##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1

}



H1GH23J

i.grade_ELA_w1 i.grade_math_w1 i.grade_history_w1 i.grade_science_w1 

rename H1WP1 decide_time_at_home_weekend_w1
rename H1WP2 decide_hang_around_with_w1
rename H1WP3 decide_what_u_wear_w1
rename H1WP4 decide_how_much_tv_w1
rename H1WP5 decide_what_tv_programs_w1
rename H1WP6 decide_what_time_go_bed_w1
rename H1WP7 decide_what_you_eat_w1
rename H1WP8 parent_present_when_eat_w1
rename H1WP9 feel_close_to_mom_w1
rename H1WP10 mom_care_about_u_w1
rename H1WP11 mom_disappoint_college_w1
rename H1WP12 mom_disappoint_hs_w1
rename H1WP13 feel_close_to_dad_w1
rename H1WP14 dad_care_about_u_w1
rename H1WP15 dad_disappoint_college_w1
rename H1WP16 dad_disappoint_hs_w1
rename H1WP17A shopping_with_mom_w1
rename H1WP17B play_sport_with_mom_w1
rename H1WP17C reglious_act_with_mom_w1
rename H1WP17D talk_about_date_with_mom_w1
rename H1WP17E movie_with_mom_w1
rename H1WP17F personal_problem_with_mom_w1
rename H1WP17G serious_argument_with_mom_w1
rename H1WP17H school_work_with_mom_w1
rename H1WP17I school_project_with_mom_w1
rename H1WP17J school_others_mom_w1
rename H1WP17K none_mom_w1
rename H1WP18A shopping_with_dad_w1
rename H1WP18B play_sport_with_dad_w1
rename H1WP18C reglious_act_with_dad_w1
rename H1WP18D talk_about_date_with_dad_w1
rename H1WP18E movie_with_dad_w1
rename H1WP18F personal_problem_with_dad_w1
rename H1WP18G serious_argument_with_dad_w1
rename H1WP18H school_work_with_dad_w1
rename H1WP18I school_project_with_dad_w1
rename H1WP18J school_others_dad_w1
rename H1WP18K none_dad_w1



	reg tv_hours_per_week_w1  zConscientiousness_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1



* trial

	reg BMI_w1 i.decide_what_you_eat_w1 res_mom_work_hours_v2_w1 zConscientiousness_w1 res_dad_work_hours_v2_w1  i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1
* trial

* maybe useful
	probit decide_how_much_tv_w1  res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1  i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1


* have good results:

* should i take out mom_stay_home_out_w1 ???? it takes away 40 percent of effect of res_mom_hours!!!!be careful of mom stay home def...i imputed the value
* use this



    reg tv_hours_per_week_w1 i.decide_how_much_tv_w1, r
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1 zConscientiousness_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r



	
	
	
	
	
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1##c.zConscientiousness_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r

	
	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 i.decide_how_much_tv_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	
	
	

	
	
twoway (histogram tv_hours_per_week_w1 if decide_how_much_tv_w1==1,  color(green)) ///
       (histogram tv_hours_per_week_w1 if decide_how_much_tv_w1==0,  ///
	   fcolor(none) lcolor(black)), legend(order(1 "free" 2 "mom decide" ))	

	

	
	
* control friends
* use this

	ologit hang_out_frds_w1 i.decide_hang_around_with_w1##c.zExtraversion_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r 

* use this
	reg smoke_frds_w1 i.decide_hang_around_with_w1##c.zExtraversion_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r

* use this
	reg drink_frds_w1 i.decide_hang_around_with_w1##c.zExtraversion_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
	
* use this	
	reg marijuana_frds_w1 i.decide_hang_around_with_w1##c.zExtraversion_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
		

	
twoway (histogram hang_out_frds_w1 if decide_hang_around_with_w1==1,  color(green)) ///
       (histogram hang_out_frds_w1 if decide_hang_around_with_w1==0,  ///
	   fcolor(none) lcolor(black)), legend(order(1 "free" 2 "mom decide" ))	
			
			
			
			
twoway (histogram drink_frds_w1  if decide_hang_around_with_w1==1,  color(green)) ///
       (histogram drink_frds_w1  if decide_hang_around_with_w1==0,  ///
	   fcolor(none) lcolor(black)), legend(order(1 "free" 2 "mom decide" ))				
		
		
		
		
* sleep hour		
	reg sleep_hours_w1 i.decide_what_time_go_bed_w1##c.zConscientiousness_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
  	
	
	probit enough_sleep_w1 i.decide_what_time_go_bed_w1##c.zConscientiousness_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1, r
  	
	
	
	* does not work, but need to try
	reg sleep_time_w1 i.decide_what_time_go_bed_w1##c.zConscientiousness_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1
  	
	
	
	
* control what you wear	
	logit H1GH55 i.decide_what_u_wear_w1##c.zConscientiousness_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1
  	
	
	
* control what you eat	(sign is correct)

* use this
	probit H1GH23J i.decide_what_you_eat_w1##c.zConscientiousness_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1
  		
	
	
	
	
* hurt someone (try to find mom's control)	

gen H1DS6 = 1 and = 0

	reg  H1DS6 i.mom_care_about_u_w1 c.zConscientiousness_w1##c.res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1
  		
	
	
	
	
	
	
	
	
	
	
	
* sex error	* possible x: mom_att_sex_w1 mom_att_sex_gf_bf_w1 dad_att_sex_w1 dad_att_sex_gf_bf_w1
	gen error_sex = son_ever_had_sex - ever_had_sex_w1
	
	gen error_sex_dummy = 1 if error_sex == -1 | error_sex == 1 
	replace error_sex_dummy = error_sex == 0
	
	
	gen error_date = son_ever_gone_date - had_relationship_w1
	
	gen error_kiss = son_ever_kissed - kiss_someone_w1
	
	*check!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! regular_cigarette def is rite?? H1TO10??
	gen error_tobacco = son_use_tobacco - regular_cigarette_w1
	
	
	gen drink_alcohol_w1 = 1 if drink_days_w1 == 1 | drink_days_w1 == 2 | drink_days_w1 == 3 | drink_days_w1 == 4 | drink_days_w1 == 5
	replace drink_alcohol_w1 = 0 if drink_days_w1 == 6 | drink_alcohol_w1 == 7
	
	
	gen error_alcohol = son_use_alcohol - drink_alcohol_w1
	
	
	* work
	mlogit error_sex i.H1MO4##c.zConscientiousness_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1
  		
	* not work
	mlogit error_kiss i.H1MO4##c.zConscientiousness_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1
  		
	* not work
	mlogit error_date i.H1MO4##c.zConscientiousness_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1
  		
	* work, but fill in the control
	
	mlogit error_alcohol  i.mom_care_about_u_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1
  		
	
	* work, but fill in the control
	gen error_tobacco_v2 = 1 if error_tobacco == -1 | error_tobacco == 1
	replace error_tobacco_v2  = 0 if error_tobacco == 0
	probit error_tobacco_v2  i.mom_care_about_u_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1
  		
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
* all 4 are good!!!

foreach xvariable in  mom_stay_home_out_w1 decide_how_much_tv_w1 decide_what_tv_programs_w1 family_pays_attention_w1 {




	ologit grade_math_w1   i.`xvariable'##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1

}




	ologit grade_math_w1   tv_hours_per_week_w1 i.decide_how_much_tv_w1 zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1



* decide how much tv is better

foreach xvariable in  decide_what_time_go_bed_w1 decide_how_much_tv_w1{




	reg sleep_hours_w1   i.`xvariable'##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1

}



* decide hand around with is better	
	
foreach xvariable in  decide_hang_around_with_w1 parent_present_when_eat_w1 {


	reg smoke_frds_w1   i.`xvariable'##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1

}



* very bad	
	
foreach xvariable in  decide_hang_around_with_w1 parent_present_when_eat_w1 {


	reg drink_frds_w1   i.`xvariable'##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1

}



	
* so so 
	foreach xvariable in decide_what_time_go_bed_w1   {


	reg sleep_hours_w1  i.`xvariable'##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1

}


* bad

foreach xvariable in decide_what_time_go_bed_w1   {


	reg enough_sleep_w1  i.`xvariable'##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1

}
	

* pretty good	
	
foreach xvariable in decide_how_much_tv_w1   {


	reg sleep_hours_w1  i.`xvariable'##c.zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well  expect_college_w1 mom_disappoint_college_w1 dad_disappoint_college_w1 dad_disappoint_hs_w1

}	
	
	
	
	
	
* x 

zConscientiousness_w1


res_mom_work_hours_v2_w1
res_dad_work_hours_v2_w1

mom_full_time_child_report_v3_w1
dad_full_time_child_report_v3_w1

mom_stay_home_out_w1


decide_how_much_tv_w1
decide_what_time_go_bed_w1
decide_what_you_eat_w1
parent_present_when_eat_w1


adults_care_w1

mom_care_about_u_w1




res_mom_at_home_leave_school_w1
res_mom_at_home_return_school_w1
res_mom_at_home_go_to_bed_w1




decide_what_tv_programs_w1
decide_what_time_go_bed_w1
decide_what_you_eat_w1
parent_present_when_eat_w1

school_work_with_mom_w1
school_project_with_mom_w1

family_pays_attention_w1











* y

BMI_w1
BMI_zscore_w1
overweight_w1 
obese_w1

work_in_house_w1
hobbies_w1
times_tv_videos_w1
roller_blading_cycling_w1
play_active_sport_w1
exercise_w1
hang_out_frds_w1
tv_hours_per_week_w1
video_hours_per_week_w1	   
computer_games_hours_per_week_w1
listen_radio_hours_per_week_w1



sleep_hours_w1
enough_sleep_w1



ever_had_sex_w1

how_many_days_smoke_w1
how_many_cigarettes_w1

drink_when_parents_not_home_w1
drink_days_w1
drink_amount_w1



* another paper!!!!
reg res_mom_work_hours_v2_w1 i.grade_math_w1 zConscientiousness_w1 res_dad_work_hours_v2_w1 zConscientiousness_w1 i.mom_stay_home_out_w1 i.decide_how_much_tv_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 $school_related_controls $psy_health ///
$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
$relationship $religion $relation_w_ppl  $income_and_expectation ///
$interviewer_comments $respondent_background   family_income_1994 i.enuf_pay_bills i.know_frds i.participate_school_activities i.get_along_well 




take sampling weight


write a loop to find out what is sign for behavior vs free time



	reg enough_sleep_w1 i.mom_full_time_child_report_v4_w1 i.dad_full_time_child_report_v4_w1 c.zConscientiousness_w1##i.res_mom_at_home_go_to_bed_w1   i.decide_what_time_go_bed_w1  i.decide_how_much_tv_w1  i.decide_what_you_eat_w1 i.parent_present_when_eat_w1 i.adults_care_w1 /// 
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background , r
