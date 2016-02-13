
cd "F:\temp_data"



clear all

set maxvar 32767

use constructed_variables, clear

* skip feel_part_of_school_w1 happy_at_school_w1 close_to_people_w1 get_along_teacher_w1 get_hw_done_w1 stud_prejudiced_w1 teachers_treat_fairly_w1  i.grade_history_w1 i.grade_science_w1 

#delimit ;
global school_related_controls 
i.abs_school_w1 abs_school_no_excuse_w1 i.suspension_w1 
i.pay_attention_w1 i.get_along_stud_w1 i.get_along_teacher_w1  i.feel_safe_w1 i.grade_ELA_w1 i.grade_math_w1;
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


*  i.enuf_pay_bills i.Soc_Sec i.SSI i.AFDC i.food_stamps i.unemp_compensation i.housing_sub;
global family_wealth i.routine_phy_check_w1 i.cigarettes_available_home_w1 i.alcohol_available_home_w1 i.drugs_available_home_w1 i.gun_available_home_w1 family_income_1994;
sum $family_wealth;


* skip residence_type_w1 nearby_well_kept_w1 i.environment_nearby_w1 neighborhood_happy_w1 someone_pulled_weapon_w1 saw_shoot_stab_someone_w1 neighbor_look_out_others_w1;

* i.move_here_reason_A i.move_here_reason_B i.move_here_reason_C i.move_here_reason_D i.move_here_reason_E  i.move_here_reason_F i.move_here_reason_G i.move_here_reason_H i.move_here_reason_I i.move_here_reason_J;
   
global environment i.know_neighborhood_w1 i.environment_nearby_w1 
i.neighborhood_gym_w1 i.neighborhood_safe_w1  i.move_out_happy_w1 
i.building_type_w1 i.building_well_kept_w1  i.nearby_safe_w1;     
sum $environment;







/* skip i.full_time_mom_or_dad i.sex_spouse  other_spouse indian_spouse  asian_spouse happy_spouse work_outside_spouse fight_w_spouse retired_spouse full_time_mom_or_dad separating_spouse disabled_spouse ;
i.white_spouse i.black_spouse  ;
i.religion_spouse i.school_spouse i.full_time_spouse i.disabled_spouse ;
i.receive_public_assist_spouse  i.happy_w_spouse ; 
i.health_status_spouse i.drink_alcohol_spouse;                                                  


* i.sex_mom_or_dad age_mom_or_dad i.marital_status_mom_or_dad i.work_outside_mom_or_dad  i.receiving_public_assistance; 
i.religion_parent i.parent_org i.military_org i.labor_union i.hobby_org i.civic_org  i.most_important_son_learn i.most_important_daughter_learn i.ever_married;


* skip i.bio_mom_w1 i.bio_dad_w1 num_sibling_survey_w1 num_household_mem_w1 i.dummy_mom_lived_in_households_w1 i.dummy_dad_lived_in_households_w1;
*/ 
global fam_mem_bg  i.mom_w1  i.dad_w1  age_mom_w1 age_dad_w1 num_bro_w1 num_sis_w1 num_granddad_w1 num_grandmom_w1; 
sum $fam_mem_bg;


* skip res_mom_public_assistance_w1 mom_stay_home_out_w1;
global mom_bg i.res_mom_educ_w1 i.res_mom_born_US_w1 i.res_mom_occupation_w1 i.res_mom_handicapped_w1 i.res_mom_smoked_w1; 
sum $mom_bg;


* res_dad_public_assistance_w1 dad_stay_home_out_w1;
* this cut a lot of data!!!;
global dad_bg i.res_dad_educ_w1 i.res_dad_born_US_w1 i.res_dad_occupation_w1 i.res_dad_handicapped_w1 i.res_dad_smoked_w1  i.res_dad_at_home_leave_school_w1 i.res_dad_at_home_return_school_w1 i.res_dad_at_home_go_to_bed_w1; 
sum $dad_bg;





* skip birth_control_hazzle_w1 birth_control_expensive_w1 birth_control_plan_trouble_w1;
* these 3 variables screw up my regression!!!;
global relationship i.had_relationship_w1 i.ever_had_sex_w1; 		  
sum $relationship;

***!!!!!!!!!!!!!!!!!!!!!!!!!!!!! change from religion_w1 to i.religion_group_w1; 
* skip religion_importance_w1 god_without_mistakes_w1  i.religion_activities_w1;
global religion i.religion_group_w1 i.attend_religious_service_w1 i.pray_times_w1;
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



* variable available:
*  i.school_good_learn  i.school_safe  i.school_good i.relationship i.bio_mom_live_here i.bio_dad_live_here ;
* global mother_report_child  i.know_frds i.met_frds i.met_frds_parents i.opinion_frds i.kids_have_gf_bf i.talk_to_how_many_parents
* i.son_health i.medicare i.medicaid i.individual_coverage i.prepaid_health_plan i.other i.none i.dont_know i.time_to_bed i.in_school i.talk_about_school_grade i.talk_about_school_things  i.talk_to_teachers
* i.participate_school_activities i.expect_high_school_stud i.expect_hs i.bad_temper i.son_life i.get_along_well i.make_decision_tgt  i.do_not_understand_him  i.trust_him i.son_interferes_u i.not_live_with_you_6_months
* i.retarded i.learning_disability i.special_educ i.son_use_tobacco i.son_use_alcohol i.son_ever_gone_date i.son_ever_kissed i.son_ever_had_sex;
* sum $mother_report_child; 

global parents_school_mom_report i.school_good_learn  i.school_safe  i.school_good;
sum $parents_school_mom_report;

global parents_involvement_mom_report i.know_frds i.met_frds i.met_frds_parents i.talk_to_how_many_parents 
i.talk_about_school_grade i.talk_about_school_things  i.talk_to_teachers i.participate_school_activities i.make_decision_tgt i.time_to_bed;
sum $parents_involvement_mom_report; 

	
global parents_relation_mom_report i.get_along_well i.trust_him i.son_interferes_u;
sum $parents_relation_mom_report; 


global parents_expectation_mom_report i.expect_high_school_stud i.expect_hs;
sum $parents_expectation_mom_report;



global parents_know_frds i.opinion_frds i.met_frds_parents i.kids_have_gf_bf;

global respondent_background AH_PVT i.race age_w1 BIO_SEX;




* this is after proposal;
global demographic age_w1 BIO_SEX i.race num_siblings_w1;



#delimit cr















gen error_sex = son_ever_had_sex - ever_had_sex_w1
	
gen error_sex_dummy = 1 if error_sex == -1 | error_sex == 1 
replace error_sex_dummy = 0 if error_sex == 0
	
*??????
gen error_date = son_ever_gone_date - had_relationship_w1
gen error_date_dummy = 1 if error_date == -1 | error_date == 1 
replace error_date_dummy = 0 if error_date == 0

	
	
gen error_kiss = son_ever_kissed - kiss_someone_w1
	
*check!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!! regular_cigarette def is rite?? H1TO10??
gen error_tobacco = son_use_tobacco - regular_cigarette_w1
	
	
gen drink_alcohol_w1 = 1 if drink_days_w1 == 1 | drink_days_w1 == 2 | drink_days_w1 == 3 | drink_days_w1 == 4 | drink_days_w1 == 5
replace drink_alcohol_w1 = 0 if drink_days_w1 == 6 | drink_days_w1 == 7
	
	
gen error_alcohol = son_use_alcohol - drink_alcohol_w1
gen error_alcohol_dummy = 1 if error_alcohol == -1 | error_alcohol == 1 
replace error_alcohol_dummy = 0 if error_alcohol == 0














global control2 $respondent_background zConscientiousness_w1
global control3 $respondent_background zConscientiousness_w1 $fam_mem_bg $mom_bg $dad_bg  i.no_mom_w1 i.no_dad_w1
global control4 $respondent_background zConscientiousness_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status  $environment $fam_mem_bg $mom_bg $dad_bg $relationship $religion $relation_w_ppl  $income_and_expectation $interviewer_comments  i.no_mom_w1 i.no_dad_w1       
global control5 $respondent_background zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg $relationship $religion $relation_w_ppl  $income_and_expectation $interviewer_comments $parents_involvement_mom_report $parents_relation_mom_report $parents_expectation_mom_report $parents_know_frds  $parents_school_mom_report i.s_lie_to_parents_w1 i.lie_to_parents_whereabout_w1 i.no_mom_w1 i.no_dad_w1



global control4_for_sex $respondent_background zConscientiousness_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status  $environment $fam_mem_bg $mom_bg $dad_bg $religion $relation_w_ppl  $income_and_expectation $interviewer_comments  i.had_relationship_w1 i.no_mom_w1 i.no_dad_w1       
global control5_for_sex $respondent_background zConscientiousness_w1  zExtraversion_w1  zNeuroticism_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg $religion $relation_w_ppl  $income_and_expectation $interviewer_comments $parents_involvement_mom_report $parents_relation_mom_report $parents_expectation_mom_report $parents_know_frds  $parents_school_mom_report i.had_relationship_w1 i.s_lie_to_parents_w1 i.lie_to_parents_whereabout_w1 i.no_mom_w1 i.no_dad_w1






gen mom_work_home_w1 = 0 if mom_stay_home_out_v2_w1 == 1 | mom_stay_home_out_v2_w1 == 3	
replace mom_work_home_w1 = 1 if mom_stay_home_out_v2_w1 == 2 
replace mom_work_home_w1 = 2 if mom_stay_home_out_v2_w1 == 0 | mom_stay_home_out_v2_w1 == 4 | mom_stay_home_out_v2_w1 == 99






* res_dad_at_home_leave_school_w1 res_dad_at_home_return_school_w1 res_dad_at_home_go_to_bed_w1





foreach var in race BIO_SEX mom_w1 dad_w1 res_mom_educ_w1 res_mom_born_US_w1 res_mom_occupation_w1 res_mom_handicapped_w1 res_mom_smoked_w1  ///
res_dad_educ_w1 res_dad_born_US_w1 res_dad_occupation_w1 res_dad_handicapped_w1 res_dad_smoked_w1  ///
abs_school_w1 suspension_w1 pay_attention_w1 get_along_stud_w1 get_along_teacher_w1  feel_safe_w1 grade_ELA_w1 grade_math_w1  ///
bothered_by_things_w1 appetite_w1 felt_as_good_as_others_w1 trouble_concentrate_w1  felt_too_tired_w1 felt_hopeful_w1 felt_fearful_w1 talked_less_w1 felt_lonely_w1 felt_unfriendly_w1  hard_get_started_w1 life_not_worth_living_w1 ///
general_health_w1 health_cause_soc_absence_w1  ///
routine_phy_check_w1 cigarettes_available_home_w1 alcohol_available_home_w1 drugs_available_home_w1 gun_available_home_w1 ///
know_neighborhood_w1 environment_nearby_w1 neighborhood_gym_w1 neighborhood_safe_w1  move_out_happy_w1 building_type_w1 building_well_kept_w1 nearby_safe_w1 ///
had_relationship_w1 ever_had_sex_w1 ///
religion_group_w1 attend_religious_service_w1 pray_times_w1 ///
adults_care_w1 teachers_care_w1 frds_care_w1 family_understands_w1 ///
expect_college_w1 ///
candid_w1 physical_mature_w1 third_person_presence_w1 resp_impatient_w1 resp_embarrassed_w1 ///
know_frds met_frds met_frds_parents talk_to_how_many_parents talk_about_school_grade talk_about_school_things  talk_to_teachers participate_school_activities make_decision_tgt time_to_bed ///
get_along_well trust_him son_interferes_u ///
expect_high_school_stud expect_hs ///
opinion_frds kids_have_gf_bf ///
school_good_learn  school_safe  school_good ///
s_lie_to_parents_w1 lie_to_parents_whereabout_w1 no_mom_w1 no_dad_w1 {
	tabulate `var', gen(`var'_d)
	

}


tabulate res_dad_at_home_leave_school_w1, gen(res_dad_leave_w1_d)
tabulate res_dad_at_home_return_school_w1, gen(res_dad_return_w1_d)
tabulate res_dad_at_home_go_to_bed_w1, gen(res_dad_bed_w1_d)


tabulate IMONTH, gen(IMONTH_d) 

tabulate SCH_YR, gen(SCH_YR_d)




tabulate(mom_stay_home_out_v2_w1), gen(mom_stay_home_out_v2_w1_d)
tabulate(mom_work_home_w1), gen(mom_work_home_w1_d)
 
 
 
 
 


 
 
  gen WFH_int_v1_1 = mom_stay_home_out_v2_w1_d1*zConscientiousness_w1 
  gen WFH_int_v1_2 = mom_stay_home_out_v2_w1_d2*zConscientiousness_w1 
  gen WFH_int_v1_3 = mom_stay_home_out_v2_w1_d3*zConscientiousness_w1 
  gen WFH_int_v1_4 = mom_stay_home_out_v2_w1_d4*zConscientiousness_w1 
  gen WFH_int_v1_5 = mom_stay_home_out_v2_w1_d5*zConscientiousness_w1 
  gen WFH_int_v1_6 = mom_stay_home_out_v2_w1_d6*zConscientiousness_w1

  
  gen WFH_int_v2_1 = mom_work_home_w1_d1*zConscientiousness_w1 
  gen WFH_int_v2_2 = mom_work_home_w1_d2*zConscientiousness_w1 
  gen WFH_int_v2_3 = mom_work_home_w1_d3*zConscientiousness_w1 

  





* contruct dummy


#delimit ;
global school_related_controls_d 
abs_school_w1_d* abs_school_no_excuse_w1 suspension_w1_d* 
pay_attention_w1_d* get_along_stud_w1_d* get_along_teacher_w1_d*  feel_safe_w1_d* grade_ELA_w1_d* grade_math_w1_d*;
sum $school_related_controls;



* could_not_shake_off_blues_w1 felt_depressed_w1 felt_sad_w1 felt_disliked_w1 enjoyed_life_w1 felt_life_failure_w1 felt_happy_w1;
global psy_health_d bothered_by_things_w1_d* appetite_w1_d* 
felt_as_good_as_others_w1_d* trouble_concentrate_w1_d*  felt_too_tired_w1_d* 
felt_hopeful_w1_d*  felt_fearful_w1_d* talked_less_w1_d* 
felt_lonely_w1_d* felt_unfriendly_w1_d*  
hard_get_started_w1_d* life_not_worth_living_w1_d*;
sum $psy_health;

global health_status_d general_health_w1_d* health_cause_soc_absence_w1_d*;
sum $health_status;


*  i.enuf_pay_bills i.Soc_Sec i.SSI i.AFDC i.food_stamps i.unemp_compensation i.housing_sub;
global family_wealth_d routine_phy_check_w1_d* cigarettes_available_home_w1_d* alcohol_available_home_w1_d* drugs_available_home_w1_d* gun_available_home_w1_d* family_income_1994;
sum $family_wealth;


* skip residence_type_w1 nearby_well_kept_w1 i.environment_nearby_w1 neighborhood_happy_w1 someone_pulled_weapon_w1 saw_shoot_stab_someone_w1 neighbor_look_out_others_w1;

* i.move_here_reason_A i.move_here_reason_B i.move_here_reason_C i.move_here_reason_D i.move_here_reason_E  i.move_here_reason_F i.move_here_reason_G i.move_here_reason_H i.move_here_reason_I i.move_here_reason_J;
   
global environment_d know_neighborhood_w1_d* environment_nearby_w1_d* 
neighborhood_gym_w1_d* neighborhood_safe_w1_d*  move_out_happy_w1_d* 
building_type_w1_d* building_well_kept_w1_d*  nearby_safe_w1_d*;     
sum $environment;







/* skip i.full_time_mom_or_dad i.sex_spouse  other_spouse indian_spouse  asian_spouse happy_spouse work_outside_spouse fight_w_spouse retired_spouse full_time_mom_or_dad separating_spouse disabled_spouse ;
i.white_spouse i.black_spouse  ;
i.religion_spouse i.school_spouse i.full_time_spouse i.disabled_spouse ;
i.receive_public_assist_spouse  i.happy_w_spouse ; 
i.health_status_spouse i.drink_alcohol_spouse;                                                  


* i.sex_mom_or_dad age_mom_or_dad i.marital_status_mom_or_dad i.work_outside_mom_or_dad  i.receiving_public_assistance; 
i.religion_parent i.parent_org i.military_org i.labor_union i.hobby_org i.civic_org  i.most_important_son_learn i.most_important_daughter_learn i.ever_married;


* skip i.bio_mom_w1 i.bio_dad_w1 num_sibling_survey_w1 num_household_mem_w1 i.dummy_mom_lived_in_households_w1 i.dummy_dad_lived_in_households_w1;
*/ 
global fam_mem_bg_d  mom_w1_d*  dad_w1_d*  age_mom_w1 age_dad_w1 num_bro_w1 num_sis_w1 num_granddad_w1 num_grandmom_w1; 
sum $fam_mem_bg;


* skip res_mom_public_assistance_w1 mom_stay_home_out_w1;
global mom_bg_d res_mom_educ_w1_d* res_mom_born_US_w1_d* res_mom_occupation_w1_d* res_mom_handicapped_w1_d* res_mom_smoked_w1_d*; 
sum $mom_bg;


* res_dad_public_assistance_w1 dad_stay_home_out_w1;
* this cut a lot of data!!!;
global dad_bg_d res_dad_educ_w1_d* res_dad_born_US_w1_d* res_dad_occupation_w1_d* res_dad_handicapped_w1_d* res_dad_smoked_w1_d*  res_dad_leave_w1_d* res_dad_return_w1_d* res_dad_bed_w1_d*; 
sum $dad_bg;





* skip birth_control_hazzle_w1 birth_control_expensive_w1 birth_control_plan_trouble_w1;
* these 3 variables screw up my regression!!!;
global relationship_d had_relationship_w1_d* ever_had_sex_w1_d*; 		  
sum $relationship;

***!!!!!!!!!!!!!!!!!!!!!!!!!!!!! change from religion_w1 to i.religion_group_w1; 
* skip religion_importance_w1 god_without_mistakes_w1  i.religion_activities_w1;
global religion_d religion_group_w1_d* attend_religious_service_w1_d* pray_times_w1_d*;
sum $religion;


* skip family_fun_w1 parents_care_w1 leave_home_w1 family_pays_attention_w1;
global relation_w_ppl_d adults_care_w1_d* teachers_care_w1_d* frds_care_w1_d* family_understands_w1_d*;
sum $relation_w_ppl;

* skip earnings_non_summer_w1 earnings_summer_w1 work_outside_w1 want_college_w1;
global income_and_expectation_d expect_college_w1_d* work_hours_non_summer_w1 work_hours_summer_w1  earning_per_week_w1;
sum $income_and_expectation;



* skip physical_attractive_w1 resp_family_smoke_w1 resp_family_drink_w1 interview_location_w1 well_groom_w1 personality_attractive_w1 number_interruptions_w1;
global interviewer_comments_d candid_w1_d* physical_mature_w1_d* third_person_presence_w1_d* resp_impatient_w1_d* resp_embarrassed_w1_d*;
sum $interviewer_comments;



* variable available:
*  i.school_good_learn  i.school_safe  i.school_good i.relationship i.bio_mom_live_here i.bio_dad_live_here ;
* global mother_report_child  i.know_frds i.met_frds i.met_frds_parents i.opinion_frds i.kids_have_gf_bf i.talk_to_how_many_parents
* i.son_health i.medicare i.medicaid i.individual_coverage i.prepaid_health_plan i.other i.none i.dont_know i.time_to_bed i.in_school i.talk_about_school_grade i.talk_about_school_things  i.talk_to_teachers
* i.participate_school_activities i.expect_high_school_stud i.expect_hs i.bad_temper i.son_life i.get_along_well i.make_decision_tgt  i.do_not_understand_him  i.trust_him i.son_interferes_u i.not_live_with_you_6_months
* i.retarded i.learning_disability i.special_educ i.son_use_tobacco i.son_use_alcohol i.son_ever_gone_date i.son_ever_kissed i.son_ever_had_sex;
* sum $mother_report_child; 

global parents_school_mom_report_d school_good_learn_d*  school_safe_d*  school_good_d*;
sum $parents_school_mom_report;

global parents_involvement_mom_report_d know_frds_d* met_frds_d* met_frds_parents_d* talk_to_how_many_parents_d* 
talk_about_school_grade_d* talk_about_school_things_d*  talk_to_teachers_d* participate_school_activities_d* make_decision_tgt_d* time_to_bed_d*;
sum $parents_involvement_mom_report; 

	
global parents_relation_mom_report_d get_along_well_d* trust_him_d* son_interferes_u_d*;
sum $parents_relation_mom_report; 


global parents_expectation_mom_report_d expect_high_school_stud_d* expect_hs_d*;
sum $parents_expectation_mom_report;



global parents_know_frds_d opinion_frds_d* met_frds_parents_d* kids_have_gf_bf_d*;

global respondent_background_d AH_PVT race_d* age_w1 BIO_SEX_d*;





#delimit cr












global control2_d $respondent_background_d zConscientiousness_w1
global control3_d $respondent_background_d zConscientiousness_w1 $fam_mem_bg_d $mom_bg_d $dad_bg_d  no_mom_w1_d* no_dad_w1_d*
global control4_d $respondent_background_d zConscientiousness_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls_d $psy_health_d $health_status_d  $environment_d $fam_mem_bg_d $mom_bg_d $dad_bg_d $relationship_d $religion_d $relation_w_ppl_d  $income_and_expectation_d $interviewer_comments_d  no_mom_w1_d* no_dad_w1_d*       
global control5_d $respondent_background_d zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls_d $psy_health_d $health_status_d $family_wealth_d $environment_d $fam_mem_bg_d $mom_bg_d $dad_bg_d $relationship_d $religion_d $relation_w_ppl_d  $income_and_expectation_d $interviewer_comments_d $parents_involvement_mom_report_d $parents_relation_mom_report_d $parents_expectation_mom_report_d $parents_know_frds_d  $parents_school_mom_report_d s_lie_to_parents_w1_d* lie_to_parents_whereabout_w1_d* no_mom_w1_d* no_dad_w1_d*



global control4_for_sex_d $respondent_background_d zConscientiousness_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls_d $psy_health_d $health_status_d  $environment_d $fam_mem_bg_d $mom_bg_d $dad_bg_d $religion_d $relation_w_ppl_d  $income_and_expectation_d $interviewer_comments_d  had_relationship_w1_d* no_mom_w1_d* no_dad_w1_d*       
global control5_for_sex_d $respondent_background_d zConscientiousness_w1  zExtraversion_w1  zNeuroticism_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls_d $psy_health_d $health_status_d $family_wealth_d $environment_d $fam_mem_bg_d $mom_bg_d $dad_bg_d $religion_d $relation_w_ppl_d  $income_and_expectation_d $interviewer_comments_d $parents_involvement_mom_report_d $parents_relation_mom_report_d $parents_expectation_mom_report_d $parents_know_frds_d  $parents_school_mom_report_d had_relationship_w1_d* s_lie_to_parents_w1_d* lie_to_parents_whereabout_w1_d* no_mom_w1_d* no_dad_w1_d*









/* trial


global control2 $respondent_background zConscientiousness_w1


  tabulate race, gen(race_d)
  tabulate age_w1, gen(age_w1_d)
  tabulate BIO_SEX, gen(BIO_SEX_d)
  tabulate mom_stay_home_out_v2_w1, gen(mom_stay_home_out_v2_w1_d)
  
  gen interaction1 = mom_stay_home_out_v2_w1_d1*zConscientiousness_w1
  
  gen interaction2 = mom_stay_home_out_v2_w1_d2*zConscientiousness_w1 
  gen interaction3 = mom_stay_home_out_v2_w1_d3*zConscientiousness_w1 
  gen interaction4 = mom_stay_home_out_v2_w1_d4*zConscientiousness_w1 
  gen interaction5 = mom_stay_home_out_v2_w1_d5*zConscientiousness_w1 
  gen interaction6 = mom_stay_home_out_v2_w1_d6*zConscientiousness_w1

  
probit exercise_for_weight_w1 c.zConscientiousness_w1##ib2.mom_stay_home_out_v2_w1 $control2 [pweight = GSWGT1],r
  
  
probit exercise_for_weight_w1 zConscientiousness_w1 mom_stay_home_out_v2_w1_d2 interaction2 interaction1 interaction4 interaction5 interaction6 mom_stay_home_out_v2_w1_d1 mom_stay_home_out_v2_w1_d4  mom_stay_home_out_v2_w1_d5 mom_stay_home_out_v2_w1_d6 race_d* age_w1 BIO_SEX_d*  AH_PVT   [pweight = GSWGT1],r
inteff exercise_for_weight_w1 zConscientiousness_w1 mom_stay_home_out_v2_w1_d2 interaction2 interaction1 interaction4 interaction5 interaction6 mom_stay_home_out_v2_w1_d1 mom_stay_home_out_v2_w1_d4  mom_stay_home_out_v2_w1_d5 mom_stay_home_out_v2_w1_d6 race_d* age_w1 BIO_SEX_d*  AH_PVT, savedata(C:\Users\AYSPS\Desktop\logit_inteff,replace) savegraph1(C:\Users\AYSPS\Desktop\figure1, replace) savegraph2(C:\Users\AYSPS\Desktop\figure2, replace)

*/











/*


gen family_income_missing = 0 if family_income_1994 != .
replace family_income_missing = 1 if  CASEID != . & family_income_1994 == .

replace family_income_1994 = 0 if  CASEID !=. & family_income_1994 == .









gen S62B_missing = 0 if S62B != .
replace S62B_missing = 1 if CASEID != . & S62B == .


replace S62B = 99 if CASEID != . & S62B == .




 
gen S62E_missing = 0 if S62E != .
replace S62E_missing = 1 if CASEID != . & S62E == .

replace S62E = 99 if CASEID != . & S62E == .






gen S62O_missing = 0 if S62O != .
replace S62O_missing = 1 if  CASEID != . & S62O == .

replace S62O = 99 if CASEID != . & S62O == .




gen s_lie_to_parents_w1_missing = 0 if s_lie_to_parents_w1  != .
replace s_lie_to_parents_w1_missing = 1 if  CASEID != . & s_lie_to_parents_w1  == .

replace s_lie_to_parents_w1 = 99 if CASEID != . & s_lie_to_parents_w1 == .




foreach variable in know_frds met_frds met_frds_parents talk_to_how_many_parents talk_about_school_grade talk_about_school_things talk_to_teachers  make_decision_tgt time_to_bed get_along_well trust_him  ///
son_interferes_u expect_high_school_stud  expect_hs opinion_frds  kids_have_gf_bf school_good_learn school_safe school_good in_school error_sex_dummy {
	gen `variable'_missing = 0 if `variable' != .
	replace `variable'_missing = 1 if  CASEID != . & `variable' == .

	replace `variable' = 99 if CASEID != . & `variable' == .
	

}




gen participate_school_w1_missing = 0 if participate_school_activities  != .
replace participate_school_w1_missing = 1 if  CASEID != . & participate_school_activities == .

replace participate_school_activities = 99 if CASEID != . & participate_school_activities == .




*/


/*
tab know_frds


tab met_frds

tab met_frds_parents

tab talk_to_how_many_parents

tab talk_about_school_grade

tab talk_about_school_things 

tab talk_to_teachers

tab participate_school_activities

tab make_decision_tgt

tab time_to_bed


tab get_along_well 
tab trust_him 
tab son_interferes_u


tab expect_high_school_stud 
tab expect_hs

tab opinion_frds 
tab met_frds_parents 
tab kids_have_gf_bf

tab school_good_learn  
tab school_safe  
tab school_good




$parents_involvement_mom_report


sum $parents_relation_mom_report

sum $parents_expectation_mom_report



sum $parents_know_frds  
sum $parents_school_mom_report
*/

  
  
  


/*

* extraversion is discarded

global control2 $respondent_background zConscientiousness_w1
global control3 $respondent_background zConscientiousness_w1 $fam_mem_bg $mom_bg $dad_bg  i.no_mom_w1 i.no_dad_w1
global control4 $respondent_background zConscientiousness_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status $family_wealth i.family_income_missing $environment $fam_mem_bg $mom_bg $dad_bg $relationship $religion $relation_w_ppl  $income_and_expectation $interviewer_comments $parents_involvement_mom_report $parents_relation_mom_report $parents_expectation_mom_report i.no_mom_w1 i.no_dad_w1       
global control5 $respondent_background zConscientiousness_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status $family_wealth i.family_income_missing $environment $fam_mem_bg $mom_bg $dad_bg $relationship $religion $relation_w_ppl  $income_and_expectation $interviewer_comments $parents_involvement_mom_report $parents_relation_mom_report $parents_expectation_mom_report i.no_mom_w1 i.no_dad_w1 i.lie_to_parents_whereabout_w1     
global control6 $respondent_background zConscientiousness_w1 i.S62B i.S62E i.S62O zNeuroticism_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status $family_wealth i.family_income_missing $environment $fam_mem_bg $mom_bg $dad_bg $relationship $religion $relation_w_ppl  $income_and_expectation $interviewer_comments $parents_involvement_mom_report $parents_relation_mom_report $parents_expectation_mom_report $parents_know_frds  $parents_school_mom_report i.s_lie_to_parents_w1 i.lie_to_parents_whereabout_w1 i.no_mom_w1 i.no_dad_w1



global control4_for_sex $respondent_background zConscientiousness_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status $family_wealth i.family_income_missing $environment $fam_mem_bg $mom_bg $dad_bg $religion $relation_w_ppl  $income_and_expectation $interviewer_comments $parents_involvement_mom_report $parents_relation_mom_report $parents_expectation_mom_report  i.had_relationship_w1 i.no_mom_w1 i.no_dad_w1       
global control5_for_sex $respondent_background zConscientiousness_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status $family_wealth i.family_income_missing $environment $fam_mem_bg $mom_bg $dad_bg  $religion $relation_w_ppl  $income_and_expectation $interviewer_comments $parents_involvement_mom_report $parents_relation_mom_report $parents_expectation_mom_report i.had_relationship_w1 i.no_mom_w1 i.no_dad_w1 i.lie_to_parents_whereabout_w1       
global control6_for_sex $respondent_background zConscientiousness_w1  i.S62B i.S62E i.S62O zNeuroticism_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status $family_wealth i.family_income_missing $environment $fam_mem_bg $mom_bg $dad_bg $religion $relation_w_ppl  $income_and_expectation $interviewer_comments $parents_involvement_mom_report $parents_relation_mom_report $parents_expectation_mom_report $parents_know_frds  $parents_school_mom_report i.had_relationship_w1 i.s_lie_to_parents_w1 i.lie_to_parents_whereabout_w1 i.no_mom_w1 i.no_dad_w1

*/




	
	
	
	
gen error_tobacco_v2 = 1 if error_tobacco == -1 | error_tobacco == 1
replace error_tobacco_v2  = 0 if error_tobacco == 0
	
replace res_mom_at_home_leave_school_w1 = 0 if res_mom_at_home_leave_school_w1 == 6
replace res_mom_at_home_return_school_w1 = 0 if res_mom_at_home_return_school_w1 == 6
	


	
gen mom_at_home_index = res_mom_at_home_leave_school_w1 + res_mom_at_home_return_school_w1 + res_mom_at_home_go_to_bed_w1
	
gen mom_at_home_index_dummy = 0 if  mom_at_home_index <= 3	
replace mom_at_home_index_dummy = 1 if mom_at_home_index > 3 & mom_at_home_index <= 9
replace mom_at_home_index_dummy = 2 if mom_at_home_index > 9

	
gen res_mom_at_home_go_to_bed_d_w1 = 0 if res_mom_at_home_go_to_bed_w1 == 1 | res_mom_at_home_go_to_bed_w1 == 2
replace res_mom_at_home_go_to_bed_d_w1 = 1 if res_mom_at_home_go_to_bed_w1 == 3 | res_mom_at_home_go_to_bed_w1 == 4 | res_mom_at_home_go_to_bed_w1 == 5
	
	
	
	



gen marijunan_dum = 0 if how_many_times_marijuana_w1 == 0 
replace marijunan_dum = 1 if how_many_times_marijuana_w1 > 0 & how_many_times_marijuana_w1 !=.











gen num_weight_lose = H1GH30A + H1GH30B + H1GH30C + H1GH30D + H1GH30E + H1GH30F 
replace num_weight_lose = 0 if lose_weight_w1 == 4 | lose_weight_w1 == 2


gen num_weight_gain = H1GH31A + H1GH31B + H1GH31C + H1GH31D + H1GH31F 

replace num_weight_gain = 0 if lose_weight_w1 == 4 | lose_weight_w1 == 1 | lose_weight_w1 == 3


gen num_weight_control = num_weight_lose + num_weight_gain
 


replace exercise_for_weight_w1 = 0 if lose_weight_w1 == 4
replace diet_for_weight_w1 = 0 if lose_weight_w1 == 4









* mom_full_time_mom_report_v2_w1 
label define mom_report 0 "no job" 1 "Part Time" 2 "Full Time" 
label values mom_full_time_mom_report_v2_w1 mom_report
sum bn.mom_full_time_mom_report_v2_w1	 



	 
* i.mom_stay_home_out_v2_w1 
label variable mom_stay_home_out_v2_w1  "work from home"

label define mom_home 0 "no occupation" 1 "work from home" 2 "work outside" 3 "work at home and outside" 4 "not work for pay" 99 "no mom" 
label values mom_stay_home_out_v2_w1  mom_home
sum bn.mom_stay_home_out_v2_w1	 

* i.decide_how_much_tv_w1 
label define control_tv 0 "control" 1 "no control"  
label values decide_how_much_tv_w1  control_tv
sum bn.decide_how_much_tv_w1 

* i.decide_hang_around_with_w1 
label define control_frd 0 "control" 1 "no control"
label values decide_hang_around_with_w1 control_frd
sum bn.decide_hang_around_with_w1	 

* i.decide_what_you_eat_w1 
label define control_eat 0 "control" 1 "no control"  
label values decide_what_you_eat_w1 control_eat
sum bn.decide_what_you_eat_w1	 

	

* i.mom_work_home_w1 
label variable mom_work_home_w1 "work from home"

label define mom_home2 0 "work at least partly from home" 1 "work outside" 2 "no work or no mom"  
label values mom_work_home_w1  mom_home2
sum bn.mom_work_home_w1	




* zConscientiousness_w1 
label variable zConscientiousness_w1 "Conscientiousness"

