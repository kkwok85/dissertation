cd "F:\temp_data"



clear


*set maxvar 32767

use constructed_variables, clear






* try exercise (done) diet (done) video_hours_per_week_w1 (done) computer_games_hours_per_week_w1 (done) eat_breakfast_w1(skip) breakfast_snack_w1(skip) sleep_hours_w1 sleep_time_w1 enough_sleep

gen fam_income_impute_ind = 1 if family_income_1994 ==.
replace fam_income_impute_ind = 0 if family_income_1994 !=.

* BIO_SEX in wave 1 is wrong, so will be taken out
keep AID FAMID AH_PVT BIO_SEX GSWGT1 GSWGT2 eat_breakfast_w1  num_eat_breakfast_w2 family_income_1994 fam_income_impute_ind race IMONTH  W1STATE W2STATE zConscientiousness_w1 zConscientiousness_v2_w1 *_w1 *_w2

rename W1STATE STATE_w1
rename W2STATE STATE_w2



gen parent_present_w1_no_reshape =  parent_present_when_eat_w1
gen parent_present_w2_no_reshape = parent_present_when_eat_w2


* BIO_SEX race conscientiousness
* sleep_time_w

reshape long age_mom_w age_dad_w  res_mom_educ_w res_dad_educ_w month_year_w ///
smoke_frds_w drink_frds_w ///
GSWGT BMI_w BMI_zscore_w overweight_w obese_w  weight_image_w  ///
religion_w allowance_w  vege_fruits_dum_w  cookies_dum_w ///
general_health_w headache_w feeling_hot_w stomach_ache_w cold_sweats_w physical_weak_w sore_throat_w tired_w pain_urination_w sick_w wake_up_tired_w ///
skin_problem_w dizziness_w chest_pain_w muscle_pain_w poor_appetite_w  trouble_sleep_w  trouble_relax_w moodiness_w freq_crying_w  fearful_w ///
before_school_supervision_w after_school_supervision_w bedtime_supervision_w  parent_present_when_eat_w decision_w ///
dwh_impute_indicator_w mwh_impute_indicator_w dad_edu_impute_indicator_w mom_edu_impute_indicator_w ///
tv_hours_per_week_w video_hours_per_week_w computer_games_hours_per_week_w tv_video_comp_games_w ///
grade_ELA_w grade_math_w grade_history_w grade_science_w ///
sleep_hours_w  enough_sleep_w ///
lose_weight_w exercise_for_weight_w diet_for_weight_w ///
ever_had_sex_w  how_many_times_marijuana_w how_many_times_marijuana_30_w   ///
ever_marijuana_30_w ever_cocaine_30_w ever_inhalants_30_w ever_other_drug_30_w ///
res_mom_at_home_or_outside_w mom_stay_home_out_v2_w ///
res_mom_smoked_w res_dad_smoked_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
lie_to_parents_whereabout_w run_away_from_home_w steal_car_w steal_things_w go_into_house_w  steal_things_less_fifty_w fight_with_group_w paint_graffiti_w damage_property_w ///
ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
no_mom_w no_dad_w age_w num_siblings_w res_mom_occupation_w  res_dad_occupation_w res_mom_work_hours_v2_w res_dad_work_hours_v2_w mom_full_time_child_report_v2_w ///
mom_full_time_mom_report_v2_w mom_full_time_child_report_v3_w ///
decide_time_at_home_weekend_w decide_hang_around_with_w decide_what_u_wear_w decide_how_much_tv_w decide_what_tv_programs_w decide_what_time_go_bed_w decide_what_you_eat_w   ///
res_mom_at_home_leave_school_w res_mom_at_home_return_school_w res_mom_at_home_go_to_bed_w res_dad_at_home_leave_school_w res_dad_at_home_return_school_w res_dad_at_home_go_to_bed_w youngest_sib_age_w   PSUSCID_w STATE_w ///
, i(AID) j(wave)



gen lose_weight_dum_w = 1 if (lose_weight_w == 1 | lose_weight_w == 2 | lose_weight_w == 3)
replace lose_weight_dum_w = 0 if lose_weight_w == 4



gen ever_all_drugs_w = 1 if (ever_marijuana_30_w == 1 | ever_cocaine_30_w == 1 | ever_inhalants_30_w == 1 | ever_other_drug_30_w == 1)
replace ever_all_drugs_w = 0 if (ever_marijuana_30_w == 0 & ever_cocaine_30_w == 0 & ever_inhalants_30_w == 0 & ever_other_drug_30_w == 0)
 
 
 
gen ever_all_but_m_drugs_w = 1 if ( ever_cocaine_30_w == 1 | ever_inhalants_30_w == 1 | ever_other_drug_30_w == 1)
replace ever_all_but_m_drugs_w = 0 if ( ever_cocaine_30_w == 0 & ever_inhalants_30_w == 0 & ever_other_drug_30_w == 0)
  

destring AID, gen(AID2)


replace AID2 = FAMID if FAMID !=.


duplicates report AID2 //check




sum family_income_1994 [aweight = GSWGT] if wave == 1

replace family_income_1994 = r(mean) if AID != "." & family_income_1994 == . & fam_income_impute_ind == 1



 


save panel_data, replace

	   	   		
