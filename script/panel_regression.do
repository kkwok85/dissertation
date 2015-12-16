cd "F:\temp_data"



clear



use constructed_variables, clear



* add parent age, edu





gen fam_income_impute_ind = 1 if family_income_1994 ==.
replace fam_income_impute_ind = 0 if family_income_1994 !=.


keep AID FAMID AH_PVT BIO_SEX BIO_SEX2 GSWGT1 GSWGT2  family_income_1994 fam_income_impute_ind race IMONTH  W1STATE W2STATE zConscientiousness_w1 *_w1 *_w2

rename W1STATE STATE_w1
rename W2STATE STATE_w2

rename BIO_SEX BIO_SEX1



* BIO_SEX race conscientiousness
* tv_hours_per_week_w video_hours_per_week_w computer_games_hours_per_week_w tv_video_comp_games_w

reshape long BIO_SEX age_mom_w age_dad_w  res_mom_educ_w res_dad_educ_w month_year_w ///
GSWGT BMI_w BMI_zscore_w overweight_w obese_w    ///
tv_hours_per_week_w ever_had_sex_w eat_breakfast_w how_many_times_marijuana_w how_many_times_marijuana_30_w ///
res_mom_at_home_or_outside_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
no_mom_w no_dad_w age_w num_siblings_w res_mom_occupation_w  res_dad_occupation_w res_mom_work_hours_v2_w res_dad_work_hours_v2_w ///
decide_time_at_home_weekend_w decide_hang_around_with_w decide_what_u_wear_w decide_how_much_tv_w decide_what_tv_programs_w decide_what_time_go_bed_w decide_what_you_eat_w   ///
res_mom_at_home_leave_school_w res_mom_at_home_return_school_w res_dad_at_home_leave_school_w res_dad_at_home_return_school_w youngest_sib_age_w   PSUSCID_w STATE_w ///
, i(AID) j(wave)










destring AID, replace





sum family_income_1994

replace family_income_1994 = r(mean) if AID != . & family_income_1994 == . & fam_income_impute_ind == 1








	   	   		
