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


ever_drink_alcohol_w  drink_days_v2_w drink_amount_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
ever_marijuana_30_w ever_all_but_m_drugs_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w




cd "D:\temp_result_panel"


estpost sum BMI_zscore_w lose_weight_dum_w tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
ever_drink_alcohol_w drink_days_v2_w drink_amount_w total_drink_per_year_w ever_marijuana_30_w  ever_all_but_m_drugs_w [aweight = GSWGT]





estout using summary_stat.tex ,  prehead(\scalebox{0.7}{\begin{tabular}{l*{1}{ccccc}}\hline ) ///
varlabels(BMI_zscore_w "BMI Z-score" ///
lose_weight_dum_w  "Lose weight" tried_cigarette_w  "Ever smoked" ///
 regular_cigarette_w "Regular smoker" how_many_days_smoke_w "Num. of smoke days" ///
 how_many_cigarettes_w "Num. of cigarettes" total_smoke_a_month_w  "Total num. of cigarettes" ///
ever_drink_alcohol_w    "Ever drank alcohol" drink_days_v2_w "Num. of drink days"  /// 
 drink_amount_w "Num. of drink amount"  total_drink_per_year_w "Total num. of drink" ///
 ever_marijuana_30_w  "Smoked marijuana in past 30 days" ever_all_but_m_drugs_w  "Used other drugs in past 30 days")  ///
style(tex)  cells("count mean sd min max") replace postfoot(\hline\end{tabular}})


global demographic_panel age_w BIO_SEX zNeuroticism_w1 zConscientiousness_w1 i.race num_siblings_w AH_PVT i.no_mom_w i.no_dad_w age_mom_w age_dad_w

global mom_occupation_panel i.res_mom_occupation_w

global mom_edu_panel i.res_mom_educ_w i.mom_edu_impute_indicator_w 

global dad_educ_career_panel res_dad_work_hours_v2_w  i.res_dad_occupation_w  i.dwh_impute_indicator_w i.res_dad_educ_w i.dad_edu_impute_indicator_w 

global family_income_panel family_income_1994 i.fam_income_impute_ind

global supervision_panel  i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w

global time_panel  i.month_year_w



BIO_SEX race res_mom_occupation_w res_mom_educ_w res_dad_occupation_w res_dad_educ_w

* c.res_mom_work_hours_v2_w##c.`personality' i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel 



estpost sum res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 age_w BIO_SEX num_siblings_w AH_PVT no_mom_w no_dad_w  age_mom_w age_dad_w ///
res_dad_work_hours_v2_w family_income_1994 decide_time_at_home_weekend_w decide_hang_around_with_w decide_what_u_wear_w decide_how_much_tv_w decide_what_tv_programs_w ///
decide_what_time_go_bed_w decide_what_you_eat_w [aweight = GSWGT]



estout using summary_stat_2.tex ,  prehead(\scalebox{0.7}{\begin{tabular}{l*{1}{ccccc}}\hline ) ///
varlabels(res_mom_work_hours_v2_w "Mom work hours"   ///
zConscientiousness_w1  "Child's conscientiousness" zNeuroticism_w1  "Child's neuroticism" ///
age_w "Age"  ///
num_siblings_w "Num. of siblings" AH_PVT " Add Health Picture Vocabulary Test (AHPVT) score" ///
no_mom_w "No mom" no_dad_w "No dad" ///
age_mom_w "Mom's age" age_dad_w "Dad's age" ///
res_dad_work_hours_v2_w  "Dad work hours" ///
family_income_1994 "family income" ///
decide_time_at_home_weekend_w "Supervision: decide the time at home on weekend nights" ///
decide_hang_around_with_w "Supervision: decide the people that the child hangs around with" ///
decide_what_u_wear_w "Supervision: decide what to wears" ///
decide_how_much_tv_w  "Supervision: decide how much TV to watch" ///
decide_what_tv_programs_w "Supervision: decide TV program" ///
decide_what_time_go_bed_w "Supervision: decide the time to go to bed on week nights" ///
decide_what_you_eat_w "Supervision: decide time at home during weekend" ) ///
style(tex)  cells("count mean sd min max") replace postfoot(\hline\end{tabular}})






