*  cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"



* cd "C:\Users\Julian.Julian-PC\Dropbox\J file\dissertation\Add_health_data\temp_data"
cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"


clear all

set maxvar 32767

use constructed_variables, clear


* http://www.ats.ucla.edu/stat/stata/webbooks/reg/chapter2/statareg2.htm

* findit collin

feel_part_of_school_w1 happy_at_school_w1 close_to_people_w1  get_hw_done_w1 stud_prejudiced_w1 teachers_treat_fairly_w1

collin abs_school_w1 abs_school_no_excuse_w1 suspension_w1 grade_ELA_w1 grade_math_w1 grade_history_w1 grade_science_w1 ///
pay_attention_w1  get_along_stud_w1    ///
get_along_teacher_w1   feel_safe_w1 



could_not_shake_off_blues_w1 felt_depressed_w1 felt_sad_w1 felt_disliked_w1 enjoyed_life_w1 felt_life_failure_w1 felt_happy_w1

collin bothered_by_things_w1  appetite_w1   ///
felt_as_good_as_others_w1  trouble_concentrate_w1  felt_too_tired_w1 ///
felt_hopeful_w1    felt_fearful_w1    talked_less_w1 ///
felt_lonely_w1  felt_unfriendly_w1     ///
hard_get_started_w1  life_not_worth_living_w1






collin general_health_w1 health_cause_soc_absence_w1



collin routine_phy_check_w1 cigarettes_available_home_w1 alcohol_available_home_w1 drugs_available_home_w1 gun_available_home_w1



environment_nearby_w1 move_here_reason_A  move_here_reason_B ///
move_here_reason_C  move_here_reason_D  move_here_reason_E   move_here_reason_F  move_here_reason_G ///
move_here_reason_H  move_here_reason_I  move_here_reason_J
neighborhood_happy_w1 someone_pulled_weapon_w1 saw_shoot_stab_someone_w1 neighbor_look_out_others_w1



collin    know_neighborhood_w1   ///
neighborhood_gym_w1  neighborhood_safe_w1    move_out_happy_w1 /// 
building_type_w1  building_well_kept_w1  environment_nearby_w1  nearby_safe_w1 


 







other_spouse indian_spouse  asian_spouse happy_spouse work_outside_spouse fight_w_spouse retired_spouse full_time_mom_or_dad separating_spouse disabled_spouse 


collin white_spouse  black_spouse    ///
religion_spouse  school_spouse    full_time_spouse  ///
receive_public_assist_spouse   happy_w_spouse   ///
health_status_spouse  drink_alcohol_spouse age_mom_w1 age_dad_w1  sex_spouse 
                                              

											  
num_sibling_survey_w1 num_household_mem_w1 

collin sex_mom_or_dad age_mom_or_dad  marital_status_mom_or_dad  work_outside_mom_or_dad   receiving_public_assistance 
collin religion_parent  parent_org  military_org  labor_union  hobby_org  civic_org   most_important_son_learn  most_important_daughter_learn  ever_married 
collin mom_w1  bio_mom_w1   dummy_mom_lived_in_households_w1  dad_w1  bio_dad_w1  
collin dummy_dad_lived_in_households_w1 num_bro_w1 num_sis_w1 num_granddad_w1 num_grandmom_w1 



res_mom_public_assistance_w1 mom_stay_home_out_w1
collin res_mom_educ_w1 res_mom_born_US_w1 res_mom_occupation_w1    res_mom_handicapped_w1 res_mom_smoked_w1 


res_dad_public_assistance_w1 dad_stay_home_out_w1
collin res_dad_educ_w1 res_dad_born_US_w1  res_dad_occupation_w1   res_dad_handicapped_w1 res_dad_smoked_w1


birth_control_plan_trouble_w1
collin birth_control_hazzle_w1 birth_control_expensive_w1 

collin relationship had_relationship_w1 ever_had_sex_w1 		  


religion_activities_w1
collin religion_importance_w1 god_without_mistakes_w1
collin religion_w1 attend_religious_service_w1 pray_times_w1 



family_fun_w1 parents_care_w1 leave_home_w1 family_pays_attention_w1
collin  adults_care_w1 teachers_care_w1  frds_care_w1 family_understands_w1   


earnings_non_summer_w1 earnings_summer_w1 work_outside_w1 want_college_w1
collin  expect_college_w1  work_hours_non_summer_w1 work_hours_summer_w1  earning_per_week_w1


physical_attractive_w1 resp_family_smoke_w1 resp_family_drink_w1 interview_location_w1 well_groom_w1 personality_attractive_w1 number_interruptions_w1
collin  candid_w1 physical_mature_w1 third_person_presence_w1   ///
 resp_impatient_w1 resp_embarrassed_w1


collin school_good_learn  school_safe  school_good  relationship  bio_mom_live_here  bio_dad_live_here  know_frds  met_frds  met_frds_parents  opinion_frds  kids_have_gf_bf  talk_to_how_many_parents 
collin son_health  medicare  medicaid  individual_coverage  prepaid_health_plan  other  none  dont_know  time_to_bed  in_school  talk_about_school_grade  talk_about_school_things   talk_to_teachers 
collin participate_school_activities  expect_high_school_stud  expect_hs  bad_temper  son_life  get_along_well  make_decision_tgt   do_not_understand_him   trust_him  son_interferes_u  not_live_with_you_6_months 
collin retarded  learning_disability  special_educ  son_use_tobacco  son_use_alcohol  son_ever_gone_date  son_ever_kissed  son_ever_had_sex



