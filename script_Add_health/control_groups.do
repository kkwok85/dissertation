*  cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"



* cd "C:\Users\Julian.Julian-PC\Dropbox\J file\dissertation\Add_health_data\temp_data"
cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"


clear

set maxvar 32767

use constructed_variables, clear







* x variables
res_mom_work_hours_w1

res_mom_at_home_leave_school_w1
res_mom_at_home_return_school_w1
res_mom_at_home_go_to_bed_w1


res_mom_work_hours_w2

res_mom_at_home_leave_school_w2
res_mom_at_home_return_school_w2
res_mom_at_home_go_to_bed_w2


i.mom_stay_home_out_w1
i.mom_stay_home_out_w2

mom_full_time_child_report_v3_w1
mom_full_time_child_report_v3_w2 

res_dad_work_hours_v2_w1
res_dad_work_hours_v2_w2

dad_full_time_child_report_v3_w1
dad_full_time_child_report_v3_w2


#delimit ;
sum
decide_time_at_home_weekend_w1                          // be careful, when referring to dad, data is dropped !!!!
decide_hang_around_with_w1
decide_what_u_wear_w1
decide_how_much_tv_w1
decide_what_tv_programs_w1
decide_what_time_go_bed_w1
decide_what_you_eat_w1
parent_present_when_eat_w1
feel_close_to_mom_w1
mom_care_about_u_w1
mom_disappoint_college_w1
mom_disappoint_hs_w1
feel_close_to_dad_w1
dad_care_about_u_w1
dad_disappoint_college_w1
dad_disappoint_hs_w1
shopping_with_mom_w1
play_sport_with_mom_w1
reglious_act_with_mom_w1
talk_about_date_with_mom_w1
movie_with_mom_w1
personal_problem_with_mom_w1
serious_argument_with_mom_w1
school_work_with_mom_w1
school_project_with_mom_w1
school_others_mom_w1
none_mom_w1
shopping_with_dad_w1
play_sport_with_dad_w1
reglious_act_with_dad_w1
talk_about_date_with_dad_w1
movie_with_dad_w1
personal_problem_with_dad_w1
serious_argument_with_dad_w1
school_work_with_dad_w1
school_project_with_dad_w1
school_others_dad_w1
none_dad_w1


decide_time_at_home_weekend_w2
decide_hang_around_with_w2
decide_what_u_wear_w2
decide_how_much_tv_w2
decide_what_tv_programs_w2
decide_what_time_go_bed_w2
decide_what_you_eat_w2
parent_present_when_eat_w2
feel_close_to_mom_w2
mom_care_about_u_w2
mom_disappoint_college_w2
mom_disappoint_hs_w2
feel_close_to_dad_w2
dad_care_about_u_w2
dad_disappoint_college_w2
dad_disappoint_hs_w2
shopping_with_mom_w2
play_sport_with_mom_w2
reglious_act_with_mom_w2
talk_about_date_with_mom_w2
movie_with_mom_w2
personal_problem_with_mom_w2
serious_argument_with_mom_w2
school_work_with_mom_w2
school_project_with_mom_w2
school_others_mom_w2
none_mom_w2
shopping_with_dad_w2
play_sport_with_dad_w2
reglious_act_with_dad_w2
talk_about_date_with_dad_w2
movie_with_dad_w2
personal_problem_with_dad_w2
serious_argument_with_dad_w2
school_work_with_dad_w2
school_project_with_dad_w2
school_others_dad_w2
none_dad_w2



mom_warm_and_loving_w1               
mom_encourage_indep_w1                
mom_talk_wrongdoings_w1               
satisfoed_with_mom_comm_w1           
satisfoed_with_mom_relation_w1        
dad_warm_and_loving_w1                
satisfied_with_dad_comm_w1                
satisfied_with_dad_relation_w1  
      
mom_warm_and_loving_w2                
mom_encourage_indep_w2                
mom_talk_wrongdoings_w2               
satisfied_with_mom_comm_w2            
satisfied_with_mom_relation_w2        
dad_warm_and_loving_w2                 
satisfied_with_dad_comm_w2            
satisfied_with_dad_relation_w2;

#delimit cr


// can be control can be x variables
adults_care_w1
teachers_care_w1
parents_care_w1
frds_care_w1                           
family_understands_w1                   
leave_home_w1
family_fun_w1                         
family_pays_attention_w1


adults_care_w2
teachers_care_w2
parents_care_w2
frds_care_w2                           
family_understands_w2                   
leave_home_w2
family_fun_w2                         
family_pays_attention_w2





**************************************** controls ***********************************************************





race 
age_w1
age_w2

male????








* psychological health
bothered_by_things_w1
appetite_w1
could_not_shake_off_blues_w1
felt_as_good_as_others_w1
trouble_concentrate_w1
felt_depressed_w1
felt_too_tired_w1
felt_hopeful_w1
felt_life_failure_w1
felt_fearful_w1
felt_happy_w1
talked_less_w1
felt_lonely_w1
felt_unfriendly_w1
enjoyed_life_w1
felt_sad_w1
felt_disliked_w1
hard_get_started_w1
life_not_worth_living_w1






bothered_by_things_w2
appetite_w2
could_not_shake_off_blues_w2
felt_as_good_as_others_w2
trouble_concentrate_w2
felt_depressed_w2
felt_too_tired_w2
felt_hopeful_w2
felt_life_failure_w2
felt_fearful_w2
felt_happy_w2
talked_less_w2
felt_lonely_w2
felt_unfriendly_w2
enjoyed_life_w2
felt_sad_w2
felt_disliked_w2
hard_get_started_w2
life_not_worth_living_w2



* health status
general_health_w1
general_health_w2
health_cause_soc_absence_w1
health_cause_soc_absence_w2

* family wealth

routine_phy_check_w1
cigarettes_available_home_w1  
alcohol_available_home_w1  
drugs_available_home_w1  
gun_available_home_w1  


routine_phy_check_w2
cigarettes_available_home_w2  
alcohol_available_home_w2  
drugs_available_home_w2  
gun_available_home_w2

* from parent questionnaire

family_income_1994
enuf_pay_bills
 Soc_Sec SSI AFDC food_stamps unemp_compensation housing_sub 

* family background


mom_w1
bio_mom_w1
age_mom_w1       // data will be reduced cuz some does not have mom
dummy_mom_lived_in_households_w1
years_mom_living_tgt_w1   // sth wrong..check again

dad_w1
bio_dad_w1
age_dad_w1       // data will be reduced
dummy_dad_lived_in_households_w1
years_dad_living_tgt_w1   // sth wrong..check again

num_bro_w1
age_bro_w1       // find the largest and the smallest age


num_sis_w1
age_sis_w1       // find the largest and the smallest age



num_granddad_w1
age_granddad_w1

num_grandmom_w1
age_grandmom_w1



num_household_mem_w1




num_household_mem_w2





num_sibling_survey_w1
num_sibling_survey_w2


* from Parent questionnaire (will reduce data)

sex_mom_or_dad	
age_mom_or_dad
marital_status_mom_or_dad
work_outside_mom_or_dad
full_time_mom_or_dad
receiving_public_assistance
religion_parent
parent_org military_org labor_union hobby_org civic_org

most_important_son_learn
most_important_daughter_learn
ever_married


sex_spouse
white_spouse black_spouse indian_spouse asian_spouse other_spouse
religion_spouse
school_spouse
work_outside_spouse
full_time_spouse
disabled_spouse
retired_spouse
happy_spouse
receive_public_assist_spouse
happy_w_spouse
separating_spouse
fight_w_spouse
health_status_spouse
drink_alcohol_spouse




* sibling detail not included





sum /// 
res_mom_educ_w1   ///                     // only wave 1 has data
res_mom_born_US_w1 ///
res_mom_occupation_w1 ///
res_mom_at_home_or_outside_w1 ///
res_mom_public_assistance_w1 ///
res_mom_handicapped_w1 ///
res_mom_smoked_w1 ///
 
res_mom_educ_w2   ///                     // only wave 1 has data
res_mom_born_US_w2 ///                    // only wave 1 has data
 
res_mom_occupation_w2 ///
res_mom_at_home_or_outside_w2 ///
res_mom_public_assistance_w2 ///
res_mom_handicapped_w2 ///
res_mom_smoked_w2







sum ///
res_dad_educ_w1 ///   
res_dad_born_US_w1 ///                    // only wave 1 has data        
                    
res_dad_occupation_w1 /// 
res_dad_at_home_or_outside_w1 /// 
res_dad_public_assistance_w1 /// 
res_dad_handicapped_w1 /// 
res_dad_smoked_w1 /// 

res_dad_educ_w2   ///                     // only wave 1 has data
res_dad_born_US_w2 ///                    // only wave 1 has data        

res_dad_occupation_w2 /// 
res_dad_at_home_or_outside_w2 /// 
res_dad_public_assistance_w2 /// 
res_dad_handicapped_w2 /// 
res_dad_smoked_w2 






* romantic relationship 

#delimit ;
sum
had_relationship_w1
ever_had_sex_w1 
birth_control_hazzle_w1		          // might reduce data, can consider not use it   
birth_control_expensive_w1		      // might reduce data, can consider not use it 
birth_control_plan_trouble_w1		   // might reduce data, can consider not use it 
		   
		   
		   

		   
had_relationship_w2
ever_had_sex_w2
birth_control_hazzle_w2		       // might reduce data, can consider not use it 
birth_control_expensive_w2	       // might reduce data, can consider not use it 
birth_control_plan_trouble_w2;	   // might reduce data, can consider not use it 




* school behaviors
// can be control can be y variables
abs_school_w1
abs_school_no_excuse_w1
suspension_w1
grade_ELA_w1
grade_math_w1
grade_history_w1
grade_science_w1
get_along_teacher_w1
pay_attention_w1
get_hw_done_w1
get_along_stud_w1 
close_to_people_w1
feel_part_of_school_w1
stud_prejudiced_w1
happy_at_school_w1
teachers_treat_fairly_w1
feel_safe_w1



abs_school_w2
abs_school_no_excuse_w2
suspension_w2
grade_ELA_w2
grade_math_w2
grade_history_w2
grade_science_w2
get_along_teacher_w2
pay_attention_w2
get_hw_done_w2
get_along_stud_w2 
close_to_people_w2
feel_part_of_school_w2
stud_prejudiced_w2
happy_at_school_w2
teachers_treat_fairly_w2
feel_safe_w2









* environment

saw_shoot_stab_someone_w1 
someone_pulled_weapon_w1

know_neighborhood_w1
talk_to_neighbor_w1
neighbor_look_out_others_w1   
neighborhood_gym_w1   
neighborhood_safe_w1  
neighborhood_happy_w1  
move_out_happy_w1



 

saw_shoot_stab_someone_w2 
someone_pulled_weapon_w2

know_neighborhood_w2
talk_to_neighbor_w2
neighbor_look_out_others_w2   
neighborhood_gym_w2   
neighborhood_safe_w2  
neighborhood_happy_w2  
move_out_happy_w2



building_type_w1             // control for property
building_well_kept_w1             // control for property
environment_nearby_w1             // control for property
residence_type_w1             // control for property        will reduce a lot of data
nearby_well_kept_w1             // control for property      will reduce a lot of data
nearby_safe_w1             // control for property

building_type_w2             // control for property
building_well_kept_w2             // control for property
environment_nearby_w2             // control for property
residence_type_w2             // control for property        will reduce a lot of data
nearby_well_kept_w2             // control for property      will reduce a lot of data
nearby_safe_w2             // control for property



* from parent questionnaire
move_here_reason_A move_here_reason_B move_here_reason_C move_here_reason_D move_here_reason_E move_here_reason_F move_here_reason_G move_here_reason_H move_here_reason_I move_here_reason_J
neighborhood
parent_tell_neighbor_child
neighborhood_trash
neighborhood_drug
neighborhood_bad



* religion
religion_w1  
god_without_mistakes_w1
attend_religious_service_w1
religion_importance_w1
pray_times_w1
religion_activities_w1


religion_w2  
god_without_mistakes_w2
attend_religious_service_w2
religion_importance_w2
pray_times_w2
religion_activities_w2



* caring ( can be control can be x variable)
adults_care_w1
teachers_care_w1
parents_care_w1
frds_care_w1                           
family_understands_w1                   
leave_home_w1
family_fun_w1                         
family_pays_attention_w1


adults_care_w2
teachers_care_w2
parents_care_w2
frds_care_w2                           
family_understands_w2                   
leave_home_w2
family_fun_w2                         
family_pays_attention_w2



* Part time work, expectation, allowance


want_college_w1
expect_college_w1
work_outside_w1
work_hours_non_summer_w1
work_hours_summer_w1
earnings_non_summer_w1
earnings_summer_w1
earning_per_week_w1


ever_drive_a_car_w2                    
had_driving_license_w2                
drive_miles_w2                        
expect_age_35_w2
expect_married_25_w2
expect_killed_21_w2
expect_HIV_AId_w2
earnings_non_summer_w2
earnings_summer_w2
earning_per_week_w2


* comment from interviewer


physical_attractive_w1 
personality_attractive_w1   // very important!!!!!! can be x!!!
well_groom_w1   
candid_w1   
physical_mature_w1   
third_person_presence_w1   
interview_location_w1   
number_interruptions_w1             
resp_impatient_w1             
resp_embarrassed_w1             
resp_family_smoke_w1             
resp_family_drink_w1


physical_attractive_w2 
personality_attractive_w2   // very important!!!!!! can be x!!!
well_groom_w2   
candid_w2   
physical_mature_w2   
third_person_presence_w2   
interview_location_w2   
number_interruptions_w2             
resp_impatient_w2             
resp_embarrassed_w2             
resp_family_smoke_w2             
resp_family_drink_w2




* mother report child
relationship
bio_mom_live_here
bio_dad_live_here
know_frds
met_frds
met_frds_parents
opinion_frds
kids_have_gf_bf


talk_to_how_many_parents
son_health

medicare medicaid individual_coverage prepaid_health_plan other none dont_know
time_to_bed
in_school
talk_about_school_grade   
talk_about_school_things 
talk_to_teachers
participate_school_activities
school_good_learn school_safe school_good
expect_high_school_stud
expect_hs
bad_temper
son_life
get_along_well make_decision_tgt do_not_understand_him trust_him son_interferes_u
not_live_with_you_6_months
retarded
learning_disability
special_educ
son_use_tobacco  
son_use_alcohol
son_ever_gone_date   
son_ever_kissed 
son_ever_had_sex




****************************************************** y variables:

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




work_in_house_w2
hobbies_w2
times_tv_videos_w2
roller_blading_cycling_w2
play_active_sport_w2
exercise_w2
hang_out_frds_w2
tv_hours_per_week_w2
video_hours_per_week_w2	   
computer_games_hours_per_week_w2
listen_radio_hours_per_week_w2


BMI_w1
BMI_w2

sleep_time_w1   // drop those after 999996 and turn it into numeric
sleep_time_w2   // drop those after 999996 and turn it into numeric

sleep_hours_w1
sleep_hours_w2

enough_sleep_w1     // dont expect too much
enough_sleep_w2

night_outside_no_perm_w1   // dont expect too much
night_outside_no_perm_w2




// can be control can be y variables
abs_school_w1
abs_school_no_excuse_w1
suspension_w1
grade_ELA_w1
grade_math_w1
grade_history_w1
grade_science_w1
get_along_teacher_w1
pay_attention_w1
get_hw_done_w1
get_along_stud_w1 
close_to_people_w1
feel_part_of_school_w1
stud_prejudiced_w1
happy_at_school_w1
teachers_treat_fairly_w1
feel_safe_w1



abs_school_w2
abs_school_no_excuse_w2
suspension_w2
grade_ELA_w2
grade_math_w2
grade_history_w2
grade_science_w2
get_along_teacher_w2
pay_attention_w2
get_hw_done_w2
get_along_stud_w2 
close_to_people_w2
feel_part_of_school_w2
stud_prejudiced_w2
happy_at_school_w2
teachers_treat_fairly_w2
feel_safe_w2



ever_had_sex_w1
ever_had_sex_w2





#delimit ;
sum
tried_cigarette_w1     
regular_cigarette_w1   // be careful when using this
how_many_days_smoke_w1
how_many_cigarettes_w1
smoke_frds_w1


ever_drink_alcohol_w1
drink_when_parents_not_home_w1            //!!!!!!!!!!!!!!!!!!!!!! super important!!!
drink_age_w1
drink_days_w1
drink_amount_w1
drink_5_a_row_w1
drink_very_high_w1
type_of_drink_w1
drink_trouble_with_parents_w1
drink_trouble_with_schools_w1
drink_trouble_with_frds_w1
drink_trouble_with_date_w1
drink_regret_w1
drink_hung_over_w1
drink_threw_up_w1
drink_regret_sex_w1
drink_fight_w1
drink_frds_w1


  
  
  
tried_cigarette_w2
regular_cigarette_w2
how_many_days_smoke_w2
how_many_cigarettes_w2
smoke_frds_w2
   
ever_drink_alcohol_w2
drink_when_parents_not_home_w2            //!!!!!!!!!!!!!!!!!!!!!! super important!!!
drink_days_w2
drink_amount_w2
drink_5_a_row_w2
drink_very_high_w2
type_of_drink_w2
drink_trouble_with_parents_w2
drink_trouble_with_schools_w2
drink_trouble_with_frds_w2
drink_trouble_with_date_w2
drink_regret_w2
drink_hung_over_w2
drink_threw_up_w2
drink_regret_sex_w2
drink_fight_w2
drink_frds_w2





paint_graffiti_w1
damage_property_w1
lie_to_parents_w1
steal_things_more_fifty_w1
run_away_from_home_w1
steal_car_w1
steal_things_w1
go_into_house_w1
steal_things_less_fifty_w1
fight_with_group_w1






paint_graffiti_w2
damage_property_w2
lie_to_parents_w2
steal_things_more_fifty_w2
run_away_from_home_w2
steal_car_w2
steal_things_w2
go_into_house_w2
steal_things_less_fifty_w2
fight_with_group_w2;




















 
 
 
reg  tv_hours_per_week_w1 drink_when_parents_not_home_w1  parents_care_w1 i.decide_how_much_tv_w1 c.zConscientiousness_w1##c.res_mom_work_hours_w1 school_work_with_mom_w1 ///
age_w1 i.religion_group_w1  i.res_mom_pay_w1 i.res_mom_at_home_or_outside_w1 ///
i.res_mom_public_assistance_w1 i.res_mom_handicapped_w1 i.res_mom_h_leave_school_group_w1 ///
i.res_mom_h_return_school_group_w1 i.res_mom_h_go_to_bed_group_w1 i.res_mom_smoked_w1 ///
i.res_dad_pay_w1 i.res_dad_at_home_or_outside_w1 i.res_dad_public_assistance_w1 ///
i.res_dad_handicapped_w1 i.res_dad_h_leave_school_group_w1 i.res_dad_h_return_school_group_w1 ///
i.res_dad_h_go_to_bed_group_w1 i.res_dad_smoked_w1 earnings_summer_w1 ///
earning_per_week_w1 num_household_mem_w1 num_bro_w1 num_sis_w1 
