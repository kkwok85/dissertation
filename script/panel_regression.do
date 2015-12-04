cd "F:\temp_data"



clear



use constructed_variables, clear



* add parent age, edu


* [pw=GSWGT1]


keep AID FAMID BIO_SEX GSWGT1 GSWGT2  race IMONTH PSUSCID W1STATE zConscientiousness_w1 *_w1 *_w2



* BIO_SEX race conscientiousness


reshape long GSWGT BMI_w BMI_zscore_w tv_hours_per_week_w video_hours_per_week_w computer_games_hours_per_week_w tv_video_comp_games_w  ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
ever_drink_alcohol_w  drink_days_v2_w drink_amount_w drink_5_a_row_v2_w drink_very_high_v2_w total_drink_per_year_w ///
no_mom_w no_dad_w age_w num_siblings_w res_mom_occupation_w  res_dad_occupation_w res_mom_work_hours_v2_w res_dad_work_hours_v2_w ///
decide_time_at_home_weekend_w decide_hang_around_with_w decide_what_u_wear_w decide_how_much_tv_w decide_what_tv_programs_w decide_what_time_go_bed_w decide_what_you_eat_w ///
, i(AID) j(wave)










reshape long tv_hours_per_week_w video_hours_per_week_w computer_games_hours_per_week_w ///
earnings_summer_w  earning_per_week_w res_mom_work_hours_w ///
age_w religion_w religion_group_w ///	
res_mom_educ_w ///
res_mom_born_country_w ///
res_mom_occupation_w ///
res_mom_pay_w ///
res_mom_has_worked_for_pay_w  ///
res_mom_at_home_or_outside_w ///
res_mom_public_assistance_w ///
res_mom_handicapped_w ///
res_mom_at_home_leave_school_w ///
res_mom_at_home_return_school_w ///
res_mom_at_home_go_to_bed_w ///
res_mom_smoked_w ///
res_dad_educ_w ///
res_dad_born_US_w ///
res_dad_born_country_w ///
res_dad_occupation_w ///
res_dad_pay_w ///
res_dad_has_worked_for_pay_w ///
res_dad_work_hours_w ///
res_dad_at_home_or_outside_w ///
res_dad_public_assistance_w ///
res_dad_handicapped_w ///
res_dad_at_home_leave_school_w ///
res_dad_at_home_return_school_w ///
res_dad_at_home_go_to_bed_w ///
res_dad_smoked_w ///
res_mom_occupation_group_w ///
res_dad_occupation_group_w ///
res_mom_educ_group_w ///
res_dad_educ_group_w ///
res_mom_h_leave_school_group_w ///
res_mom_h_return_school_group_w ///
res_mom_h_go_to_bed_group_w ///
res_dad_h_leave_school_group_w ///
res_dad_h_return_school_group_w ///
res_dad_h_go_to_bed_group_w ///
num_household_mem_w ///
BMI_w ///
mom_full_time_child_report_w ///
dad_full_time_child_report_w ///
mom_full_time_child_report_v3_w ///
dad_full_time_child_report_v3_w ///
res_dad_work_hours_v2_w ///
res_mom_work_hours_v2_w ///
 decide_how_much_tv_w ///
 decide_what_tv_programs_w ///
, i(AID) j(wave) 



destring AID, replace
xtset AID wave







reg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness1

outreg2 using result, title(Data wave 2 Conscientious wave 1 OLS results) bdec(4) ctitle(Conscientious wave1) word replace

reg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness4  

outreg2 using result, word ctitle(Conscientious wave4)   append


xtreg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness1, fe  

outreg2 using result2, title(Data wave 2 Conscientious wave 1 FE results) bdec(4) ctitle(Conscientious wave1)word replace


xtreg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness4, fe  

outreg2 using result2, word ctitle(Conscientious wave4) append


xtreg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness1 age_w religion_w ///
res_mom_educ_w res_mom_occupation_w res_mom_pay_w res_mom_at_home_or_outside_w res_mom_public_assistance_w ///
res_mom_handicapped_w res_mom_at_home_leave_school_w res_mom_at_home_return_school_w res_mom_at_home_go_to_bed_w res_mom_smoked_w ///
res_dad_educ_w res_dad_occupation_w res_dad_pay_w res_dad_at_home_or_outside_w res_dad_public_assistance_w ///
res_dad_handicapped_w res_dad_at_home_leave_school_w res_dad_at_home_return_school_w res_dad_at_home_go_to_bed_w res_dad_smoked_w earnings_summer_w  earning_per_week_w, fe  



xi: xtreg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness1 age_w religion_w ///
res_mom_educ_w res_mom_occupation_w res_mom_pay_w res_mom_at_home_or_outside_w res_mom_public_assistance_w ///
res_mom_handicapped_w res_mom_at_home_leave_school_w res_mom_at_home_return_school_w res_mom_at_home_go_to_bed_w res_mom_smoked_w ///
res_dad_educ_w res_dad_occupation_w res_dad_pay_w res_dad_at_home_or_outside_w res_dad_public_assistance_w ///
res_dad_handicapped_w res_dad_at_home_leave_school_w res_dad_at_home_return_school_w res_dad_at_home_go_to_bed_w res_dad_smoked_w earnings_summer_w  earning_per_week_w i.wave, fe  

outreg2 using result3, title(Data wave 2 Conscientious wave 1 FE results) bdec(4) ctitle(Conscientious wave1) word replace




xtreg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness4 age_w religion_w ///
res_mom_educ_w res_mom_occupation_w res_mom_pay_w res_mom_at_home_or_outside_w res_mom_public_assistance_w ///
res_mom_handicapped_w res_mom_at_home_leave_school_w res_mom_at_home_return_school_w res_mom_at_home_go_to_bed_w res_mom_smoked_w ///
res_dad_educ_w res_dad_occupation_w res_dad_pay_w res_dad_at_home_or_outside_w res_dad_public_assistance_w ///
res_dad_handicapped_w res_dad_at_home_leave_school_w res_dad_at_home_return_school_w res_dad_at_home_go_to_bed_w res_dad_smoked_w earnings_summer_w  earning_per_week_w, fe  













** another trial


sum ///
tv_hours_per_week_w ///
res_mom_work_hours_w ///
Conscientiousness1 age_w ///
religion_group_w ///
res_mom_educ_group_w ///
res_mom_occupation_group_w ///
res_mom_pay_w ///
res_mom_at_home_or_outside_w ///
res_mom_public_assistance_w ///
res_mom_handicapped_w ///
res_mom_h_leave_school_group_w ///
res_mom_h_return_school_group_w ///
res_mom_h_go_to_bed_group_w ///
res_mom_smoked_w ///
res_dad_educ_group_w ///
res_dad_occupation_group_w ///
res_dad_pay_w ///
res_dad_at_home_or_outside_w ///
res_dad_public_assistance_w ///
res_dad_handicapped_w ///
res_dad_h_leave_school_group_w ///
res_dad_h_return_school_group_w ///
res_dad_h_go_to_bed_group_w ///
res_dad_smoked_w earnings_summer_w  ///
earning_per_week_w ///
num_household_mem_w 






xtreg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness1 age_w i.religion_group_w ///
i.res_mom_occupation_group_w i.res_mom_pay_w i.res_mom_at_home_or_outside_w i.res_mom_public_assistance_w ///
i.res_mom_handicapped_w i.res_mom_h_leave_school_group_w i.res_mom_h_return_school_group_w i.res_mom_h_go_to_bed_group_w i.res_mom_smoked_w ///
 earnings_summer_w  earning_per_week_w num_household_mem_w, fe  





xtreg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness1 age_w i.religion_group_w ///
i.res_mom_educ_group_w i.res_mom_occupation_group_w i.res_mom_pay_w i.res_mom_at_home_or_outside_w i.res_mom_public_assistance_w ///
i.res_mom_handicapped_w i.res_mom_h_leave_school_group_w i.res_mom_h_return_school_group_w i.res_mom_h_go_to_bed_group_w i.res_mom_smoked_w ///
i.res_dad_educ_group_w i.res_dad_occupation_group_w i.res_dad_pay_w i.res_dad_at_home_or_outside_w i.res_dad_public_assistance_w ///
i.res_dad_handicapped_w i.res_dad_h_leave_school_group_w i.res_dad_h_return_school_group_w i.res_dad_h_go_to_bed_group_w i.res_dad_smoked_w earnings_summer_w  earning_per_week_w num_household_mem_w, fe  

outreg2 using result3, word ctitle(Conscientious wave4)  append



** nice result!!!! Basically when you take out education data, then the result is good since now every individual has 1.5 data 
xtreg tv_hours_per_week_w c.res_mom_work_hours_w##c.zConscientiousness_w1 age_w i.religion_group_w  i.res_mom_pay_w i.res_mom_at_home_or_outside_w i.res_mom_public_assistance_w i.res_mom_handicapped_w i.res_mom_h_leave_school_group_w i.res_mom_h_return_school_group_w i.res_mom_h_go_to_bed_group_w i.res_mom_smoked_w  i.res_dad_pay_w i.res_dad_at_home_or_outside_w i.res_dad_public_assistance_w i.res_dad_handicapped_w i.res_dad_h_leave_school_group_w i.res_dad_h_return_school_group_w i.res_dad_h_go_to_bed_group_w i.res_dad_smoked_w earnings_summer_w  earning_per_week_w num_household_mem_w, fe



reg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness1 age_w i.religion_w ///
i.res_mom_educ_w i.res_mom_occupation_w i.res_mom_pay_w i.res_mom_at_home_or_outside_w i.res_mom_public_assistance_w ///
i.res_mom_handicapped_w i.res_mom_at_home_leave_school_w i.res_mom_at_home_return_school_w i.res_mom_at_home_go_to_bed_w i.res_mom_smoked_w ///
i.res_dad_educ_w i.res_dad_occupation_w i.res_dad_pay_w i.res_dad_at_home_or_outside_w i.res_dad_public_assistance_w ///
i.res_dad_handicapped_w i.res_dad_at_home_leave_school_w i.res_dad_at_home_return_school_w i.res_dad_at_home_go_to_bed_w i.res_dad_smoked_w res_dad_work_hours_w earnings_summer_w  earning_per_week_w ///
marital_status_mom_or_dad age_mom_or_dad move_here_reason_A move_here_reason_B move_here_reason_C move_here_reason_D move_here_reason_E move_here_reason_F move_here_reason_G move_here_reason_H move_here_reason_I move_here_reason_J ///
family_income_1994 receiving_public_assistance neighborhood, r














********* trial for chuck: imputed version



xtreg BMI_w i.mom_full_time_child_report_v3_w i.dad_full_time_child_report_v3_w  , fe

xtreg BMI_w i.mom_full_time_child_report_v3_w i.dad_full_time_child_report_v3_w age_w i.religion_group_w  , fe


xtreg BMI_w tv_hours_per_week_w i.mom_full_time_child_report_v3_w i.dad_full_time_child_report_v3_w age_w i.religion_group_w  i.res_mom_at_home_or_outside_w ///
i.res_mom_public_assistance_w i.res_mom_handicapped_w i.res_mom_h_leave_school_group_w i.res_mom_h_return_school_group_w i.res_mom_h_go_to_bed_group_w i.res_mom_smoked_w  ///
i.res_dad_at_home_or_outside_w i.res_dad_public_assistance_w i.res_dad_handicapped_w i.res_dad_h_leave_school_group_w i.res_dad_h_return_school_group_w ///
i.res_dad_h_go_to_bed_group_w i.res_dad_smoked_w earnings_summer_w  earning_per_week_w num_household_mem_w , fe
















xtreg BMI_w res_mom_work_hours_v2_w res_dad_work_hours_v2_w  , fe

xtreg BMI_w res_mom_work_hours_v2_w res_dad_work_hours_v2_w age_w i.religion_group_w  , fe


xtreg BMI_w tv_hours_per_week_w res_mom_work_hours_v2_w res_dad_work_hours_v2_w age_w i.religion_group_w  i.res_mom_at_home_or_outside_w ///
i.res_mom_public_assistance_w i.res_mom_handicapped_w i.res_mom_h_leave_school_group_w i.res_mom_h_return_school_group_w i.res_mom_h_go_to_bed_group_w i.res_mom_smoked_w  ///
i.res_dad_at_home_or_outside_w i.res_dad_public_assistance_w i.res_dad_handicapped_w i.res_dad_h_leave_school_group_w i.res_dad_h_return_school_group_w ///
i.res_dad_h_go_to_bed_group_w i.res_dad_smoked_w earnings_summer_w  earning_per_week_w num_household_mem_w , fe











************* not new version: not imputed version




**** cant do mom and dad together!!!
xtreg BMI_w i.mom_full_time_child_report_w  , fe

xtreg BMI_w i.mom_full_time_child_report_w age_w i.religion_group_w  , fe


xtreg BMI_w tv_hours_per_week_w i.mom_full_time_child_report_w  age_w i.religion_group_w  i.res_mom_at_home_or_outside_w ///
i.res_mom_public_assistance_w i.res_mom_handicapped_w i.res_mom_h_leave_school_group_w i.res_mom_h_return_school_group_w i.res_mom_h_go_to_bed_group_w i.res_mom_smoked_w  ///
i.res_dad_at_home_or_outside_w i.res_dad_public_assistance_w i.res_dad_handicapped_w i.res_dad_h_leave_school_group_w i.res_dad_h_return_school_group_w ///
i.res_dad_h_go_to_bed_group_w i.res_dad_smoked_w earnings_summer_w  earning_per_week_w num_household_mem_w , fe
















xtreg BMI_w res_mom_work_hours_w res_dad_work_hours_w  , fe

xtreg BMI_w res_mom_work_hours_w res_dad_work_hours_w age_w i.religion_group_w  , fe


xtreg BMI_w tv_hours_per_week_w res_mom_work_hours_w res_dad_work_hours_w age_w i.religion_group_w  i.res_mom_at_home_or_outside_w ///
i.res_mom_public_assistance_w i.res_mom_handicapped_w i.res_mom_h_leave_school_group_w i.res_mom_h_return_school_group_w i.res_mom_h_go_to_bed_group_w i.res_mom_smoked_w  ///
i.res_dad_at_home_or_outside_w i.res_dad_public_assistance_w i.res_dad_handicapped_w i.res_dad_h_leave_school_group_w i.res_dad_h_return_school_group_w ///
i.res_dad_h_go_to_bed_group_w i.res_dad_smoked_w earnings_summer_w  earning_per_week_w num_household_mem_w , fe










sum BMI_w ///
tv_hours_per_week_w ///
mom_full_time_child_report_v3_w dad_full_time_child_report_v3_w age_w religion_group_w  res_mom_pay_w res_mom_at_home_or_outside_w ///
res_mom_public_assistance_w res_mom_handicapped_w res_mom_h_leave_school_group_w res_mom_h_return_school_group_w res_mom_h_go_to_bed_group_w res_mom_smoked_w  ///
res_dad_pay_w res_dad_at_home_or_outside_w res_dad_public_assistance_w res_dad_handicapped_w res_dad_h_leave_school_group_w res_dad_h_return_school_group_w ///
res_dad_h_go_to_bed_group_w res_dad_smoked_w earnings_summer_w  earning_per_week_w num_household_mem_w














	   	   		
