* summary statistics




estpost sum  ///
tv_hours_per_week_w1 hang_out_frds_w1* eat_breakfast_w1* drink_alcohol_w1* tried_cigarette_w1* how_many_times_marijuana_w1 error_alcohol_dummy* ever_had_sex_w1* error_sex_dummy* ///
mom_report_hr_w1_dummy*  res_mom_work_hours_v2_w1  mom_avail_leave_w1_dummy* mom_avail_return_w1_dummy* mom_avail_bed_dummy* mom_work_home_w1_dummy* control_tv_w1_dummy* control_frd_w1_dummy* control_diet_w1_dummy* ///
AH_PVT race* age_w1 BIO_SEX* ///
zConscientiousness_w1 res_mom_work_hours_v2_w1  ///
abs_school_w1* abs_school_no_excuse_w1 suspension_w1* pay_attention_w1* get_along_stud_w1* get_along_teacher_w1* feel_safe_w1* grade_ELA_w1* grade_math_w1* ///
bothered_by_things_w1* appetite_w1* felt_as_good_as_others_w1* trouble_concentrate_w1* felt_too_tired_w1* felt_hopeful_w1* felt_fearful_w1* talked_less_w1* felt_lonely_w1* felt_unfriendly_w1* hard_get_started_w1* life_not_worth_living_w1* ///
general_health_w1* ///
routine_phy_check_w1*  gun_available_home_w1* family_income_1994 ///
know_neighborhood_w1* environment_nearby_w1* neighborhood_gym_w1* neighborhood_safe_w1* move_out_happy_w1* building_type_w1* building_well_kept_w1*  nearby_safe_w1* ///
age_mom_w1 age_dad_w1 mom_w1*  dad_w1*  num_bro_w1 num_sis_w1 num_granddad_w1 num_grandmom_w1 ///
res_mom_educ_w1* res_mom_born_US_w1* res_mom_occupation_w1* res_mom_handicapped_w1* res_mom_smoked_w1* ///
res_dad_educ_w1* res_dad_born_US_w1* res_dad_occupation_w1* res_dad_handicapped_w1* res_dad_smoked_w1* dad_avail_leave_w1_dummy* dad_avail_return_w1_dummy* dad_avail_bed_dummy* ///
no_mom_w1* no_dad_w1*  ///
had_relationship_w1* ever_had_sex_w1*  ///
religion_group_w1*  pray_times_w1* ///
adults_care_w1* teachers_care_w1* frds_care_w1* family_understands_w1* ///
expect_college_w1* work_hours_non_summer_w1 work_hours_summer_w1  earning_per_week_w1 ///
candid_w1* physical_mature_w1* third_person_presence_w1* resp_impatient_w1* resp_embarrassed_w1* ///
school_good_learn*  school_safe*  school_good* ///
know_frds* met_frds* met_frds_parents* talk_to_how_many_parents* talk_about_school_grade* talk_about_school_things*  talk_to_teachers*  make_decision_tgt* time_to_bed* ///
get_along_well* trust_him* son_interferes_u* ///
expect_high_school_stud* expect_hs* ///
health_abs_w1_dummy* cigar_h_w1_dummy* alcohol_j_w1_dummy* drugs_h_w1_dummy* attend_relig_w1_dummy* participate_w1_dummy*  ///
no_mom_w1* no_dad_w1* [aweight = GSWGT1]



estout using summary_stat.xls,  cells("count mean sd min max sum") replace

estpost sum  $demographic_panel [aweight = GSWGT]

estout using summary_stat.xls,  cells("count mean sd min max sum") replace

sum BIO_SEX

sum  $demographic_panel [aweight = GSWGT]

sutex $demographic_panel [aweight = GSWGT] ,nobs minmax
