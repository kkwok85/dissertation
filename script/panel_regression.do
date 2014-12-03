cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"



* cd "C:\Users\Julian.Julian-PC\Dropbox\J file\dissertation\Add_health_data\temp_data"


clear


use constructed_variables, clear



keep CASEID-SMP03  tv_hours_per_week_w1 tv_hours_per_week_w2 video_hours_per_week_w1 video_hours_per_week_w2 computer_games_hours_per_week_w1 computer_games_hours_per_week_w2 ///
zExtraversion_w4 zAgreeableness_w4 zConscientiousness_w4 zNeuroticism_w4 zOpenness_w4 zNeuroticism_w1 zConscientiousness_w1 zExtraversion_w1 AH_PVT AH_RAW ///
earnings_summer_w1 earnings_summer_w2 earning_per_week_w1 earning_per_week_w2 ///
res_mom_work_hours_w1 res_mom_work_hours_w2 ///
BIO_SEX race ///
age_w1 age_w2 religion_w1 religion_w2 ///
neighborhood family_income_1994 move_here_reason_A move_here_reason_B move_here_reason_C move_here_reason_D move_here_reason_E move_here_reason_F move_here_reason_G move_here_reason_H move_here_reason_I move_here_reason_J ///		
res_mom_educ_w1 res_mom_educ_w2 ///
res_mom_born_country_w1 res_mom_born_country_w2 ///
res_mom_occupation_w1 res_mom_occupation_w2 ///
res_mom_pay_w1 res_mom_pay_w2  ///
res_mom_has_worked_for_pay_w1 res_mom_has_worked_for_pay_w2  ///
res_mom_work_hours_w1 res_mom_work_hours_w2 ///
res_mom_at_home_or_outside_w1 res_mom_at_home_or_outside_w2 ///
res_mom_public_assistance_w1 res_mom_public_assistance_w2 ///
res_mom_handicapped_w1 res_mom_handicapped_w2 ///
res_mom_at_home_leave_school_w1 res_mom_at_home_leave_school_w2 ///
res_mom_at_home_return_school_w1 res_mom_at_home_return_school_w2 ///
res_mom_at_home_go_to_bed_w1 res_mom_at_home_go_to_bed_w2 ///
res_mom_smoked_w1 res_mom_smoked_w2 ///
res_dad_educ_w1 res_dad_educ_w2 ///
res_dad_born_US_w1 res_dad_born_US_w2 ///
res_dad_born_country_w1 res_dad_born_country_w2 ///
res_dad_occupation_w1 res_dad_occupation_w2 ///
res_dad_pay_w1 res_dad_pay_w2 ///
res_dad_has_worked_for_pay_w1 res_dad_has_worked_for_pay_w2 ///
res_dad_work_hours_w1 res_dad_work_hours_w2 ///
res_dad_at_home_or_outside_w1 res_dad_at_home_or_outside_w2 ///
res_dad_public_assistance_w1 res_dad_public_assistance_w2 ///
res_dad_handicapped_w1 res_dad_handicapped_w2 ///
res_dad_at_home_leave_school_w1 res_dad_at_home_leave_school_w2 ///
res_dad_at_home_return_school_w1 res_dad_at_home_return_school_w2 ///
res_dad_at_home_go_to_bed_w1 res_dad_at_home_go_to_bed_w2 ///
res_dad_smoked_w1 res_dad_smoked_w2 ///
receiving_public_assistance ///
age_mom_or_dad ///
marital_status_mom_or_dad ///
no_household_mem_w1 no_household_mem_w2







gen Extraversion1 = zExtraversion_w1
gen Conscientiousness1 = zConscientiousness_w1
gen Neuroticism1 = zNeuroticism_w1  
gen Openness4 = zOpenness_w4
gen Neuroticism4 = zNeuroticism_w4
gen Conscientiousness4 = zConscientiousness_w4   
gen Agreeableness4 = zAgreeableness_w4 
gen Extraversion4 = zExtraversion_w4



gen religion_group_w1 = 1 if religion_w1 == 1 | religion_w1 == 2 | religion_w1 == 3 | religion_w1 == 4 | religion_w1 == 5 | religion_w1 == 6 |   religion_w1 == 7 | religion_w1 == 8 | religion_w1 == 9 | religion_w1 == 10 | ///
 religion_w1 == 11 | religion_w1 == 12 | religion_w1 == 13 | religion_w1 == 14 |  religion_w1 == 15 | religion_w1 == 16 | religion_w1 == 17 | religion_w1 == 18 | religion_w1 == 19 
replace religion_group_w1 = 2 if religion_w1 == 22
replace religion_group_w1 = 3 if religion_w1 == 20 | religion_w1 == 21 | religion_w1 == 23 | religion_w1 == 24 | religion_w1 == 25 | religion_w1 == 26 | religion_w1 == 27 | religion_w1 == 28
replace religion_group_w1 = 0 if religion_w1 == 0


gen religion_group_w2 = 1 if religion_w2 == 1 | religion_w2 == 2 | religion_w2 == 3 | religion_w2 == 4 | religion_w2 == 5 | religion_w2 == 6 |   religion_w2 == 7 | religion_w2 == 8 | religion_w2 == 9 | religion_w2 == 10 | ///
 religion_w2 == 11 | religion_w2 == 12 | religion_w2 == 13 | religion_w2 == 14 |  religion_w2 == 15 | religion_w2 == 16 | religion_w2 == 17 | religion_w2 == 18 | religion_w2 == 19 
replace religion_group_w2 = 2 if religion_w2 == 22
replace religion_group_w2 = 3 if religion_w2 == 20 | religion_w2 == 21 | religion_w2 == 23 | religion_w2 == 24 | religion_w2 == 25 | religion_w2 == 26 | religion_w2 == 27 | religion_w2 == 28
replace religion_group_w2 = 0 if religion_w2 == 29


gen res_mom_occupation_group_w1 = 1 if res_mom_occupation_w1 == 1 | res_mom_occupation_w1 == 2 | res_mom_occupation_w1 == 3 | res_mom_occupation_w1 == 4 | res_mom_occupation_w1 == 5 | res_mom_occupation_w1 == 6 
replace res_mom_occupation_group_w1 = 2 if res_mom_occupation_w1 == 7 | res_mom_occupation_w1 == 8 | res_mom_occupation_w1 == 9 | res_mom_occupation_w1 == 10 | res_mom_occupation_w1 == 11 | ///
res_mom_occupation_w1 == 12 | res_mom_occupation_w1 == 13 | res_mom_occupation_w1 == 14 
replace res_mom_occupation_group_w1 = 3 if res_mom_occupation_w1 == 15
replace res_mom_occupation_group_w1 = 0 if res_mom_occupation_w1 == 16



gen res_mom_occupation_group_w2 = 1 if res_mom_occupation_w2 == 1 | res_mom_occupation_w2 == 2 | res_mom_occupation_w2 == 3 | res_mom_occupation_w2 == 4 | res_mom_occupation_w2 == 5 | res_mom_occupation_w2 == 6 
replace res_mom_occupation_group_w2 = 2 if res_mom_occupation_w2 == 7 | res_mom_occupation_w2 == 8 | res_mom_occupation_w2 == 9 | res_mom_occupation_w2 == 10 | res_mom_occupation_w2 == 11 | ///
res_mom_occupation_w2 == 12 | res_mom_occupation_w2 == 13 | res_mom_occupation_w2 == 14 
replace res_mom_occupation_group_w2 = 3 if res_mom_occupation_w2 == 15
replace res_mom_occupation_group_w2 = 0 if res_mom_occupation_w2 == 16
 

 
 
gen res_dad_occupation_group_w1 = 1 if res_dad_occupation_w1 == 1 | res_dad_occupation_w1 == 2 | res_dad_occupation_w1 == 3 | res_dad_occupation_w1 == 4 | res_dad_occupation_w1 == 5 | res_dad_occupation_w1 == 6 
replace res_dad_occupation_group_w1 = 2 if res_dad_occupation_w1 == 7 | res_dad_occupation_w1 == 8 | res_dad_occupation_w1 == 9 | res_dad_occupation_w1 == 10 | res_dad_occupation_w1 == 11 | ///
res_dad_occupation_w1 == 12 | res_dad_occupation_w1 == 13 | res_dad_occupation_w1 == 14 
replace res_dad_occupation_group_w1 = 3 if res_dad_occupation_w1 == 15
replace res_dad_occupation_group_w1 = 0 if res_dad_occupation_w1 == 16



gen res_dad_occupation_group_w2 = 1 if res_dad_occupation_w2 == 1 | res_dad_occupation_w2 == 2 | res_dad_occupation_w2 == 3 | res_dad_occupation_w2 == 4 | res_dad_occupation_w2 == 5 | res_dad_occupation_w2 == 6 
replace res_dad_occupation_group_w2 = 2 if res_dad_occupation_w2 == 7 | res_dad_occupation_w2 == 8 | res_dad_occupation_w2 == 9 | res_dad_occupation_w2 == 10 | res_dad_occupation_w2 == 11 | ///
res_dad_occupation_w2 == 12 | res_dad_occupation_w2 == 13 | res_dad_occupation_w2 == 14 
replace res_dad_occupation_group_w2 = 3 if res_dad_occupation_w2 == 15
replace res_dad_occupation_group_w2 = 0 if res_dad_occupation_w2 == 16

 
 
 
gen res_mom_educ_group_w1 = 1 if res_mom_educ_w1 == 1 | res_mom_educ_w1 == 2 | res_mom_educ_w1 == 3 | res_mom_educ_w1 == 4 | res_mom_educ_w1 == 5
replace res_mom_educ_group_w1 = 2 if res_mom_educ_w1 == 6 | res_mom_educ_w1 == 7 | res_mom_educ_w1 == 8 
replace res_mom_educ_group_w1 = 3 if res_mom_educ_w1 == 9
replace res_mom_educ_group_w1 = 4 if res_mom_educ_w1 == 11
replace res_mom_educ_group_w1 = 5 if res_mom_educ_w1 == 10 | res_mom_educ_w1 == 12



gen res_mom_educ_group_w2 = 1 if res_mom_educ_w2 == 1 | res_mom_educ_w2 == 2 | res_mom_educ_w2 == 3 | res_mom_educ_w2 == 4 | res_mom_educ_w2 == 5
replace res_mom_educ_group_w2 = 2 if res_mom_educ_w2 == 6 | res_mom_educ_w2 == 7 | res_mom_educ_w2 == 8 
replace res_mom_educ_group_w2 = 3 if res_mom_educ_w2 == 9
replace res_mom_educ_group_w2 = 4 if res_mom_educ_w2 == 11
replace res_mom_educ_group_w2 = 5 if res_mom_educ_w2 == 10 | res_mom_educ_w2 == 12


gen res_dad_educ_group_w1 = 1 if res_dad_educ_w1 == 1 | res_dad_educ_w1 == 2 | res_dad_educ_w1 == 3 | res_dad_educ_w1 == 4 | res_dad_educ_w1 == 5
replace res_dad_educ_group_w1 = 2 if res_dad_educ_w1 == 6 | res_dad_educ_w1 == 7 | res_dad_educ_w1 == 8 
replace res_dad_educ_group_w1 = 3 if res_dad_educ_w1 == 9
replace res_dad_educ_group_w1 = 4 if res_dad_educ_w1 == 11
replace res_dad_educ_group_w1 = 5 if res_dad_educ_w1 == 10 | res_mom_educ_w1 == 12



gen res_dad_educ_group_w2 = 1 if res_dad_educ_w2 == 1 | res_dad_educ_w2 == 2 | res_dad_educ_w2 == 3 | res_dad_educ_w2 == 4 | res_dad_educ_w2 == 5
replace res_dad_educ_group_w2 = 2 if res_dad_educ_w2 == 6 | res_dad_educ_w2 == 7 | res_dad_educ_w2 == 8 
replace res_dad_educ_group_w2 = 3 if res_dad_educ_w2 == 9
replace res_dad_educ_group_w2 = 4 if res_dad_educ_w2 == 11
replace res_dad_educ_group_w2 = 5 if res_dad_educ_w2 == 10 | res_dad_educ_w2 == 12










gen res_mom_h_leave_school_group_w1 = 1 if res_mom_at_home_leave_school_w1 == 1 
replace res_mom_h_leave_school_group_w1 = 2 if res_mom_at_home_leave_school_w1 == 2 | res_mom_at_home_leave_school_w1 == 3 | res_mom_at_home_leave_school_w1 == 4
replace res_mom_h_leave_school_group_w1 = 3 if res_mom_at_home_leave_school_w1 == 5
replace res_mom_h_leave_school_group_w1 = 0 if res_mom_at_home_leave_school_w1 == 6

gen res_mom_h_leave_school_group_w2 = 1 if res_mom_at_home_leave_school_w2 == 1 
replace res_mom_h_leave_school_group_w2 = 2 if res_mom_at_home_leave_school_w2 == 2 | res_mom_at_home_leave_school_w2 == 3 | res_mom_at_home_leave_school_w2 == 4
replace res_mom_h_leave_school_group_w2 = 3 if res_mom_at_home_leave_school_w2 == 5
replace res_mom_h_leave_school_group_w2 = 0 if res_mom_at_home_leave_school_w2 == 6








gen res_mom_h_return_school_group_w1 = 1 if res_mom_at_home_return_school_w1 == 1 
replace res_mom_h_return_school_group_w1 = 2 if res_mom_at_home_return_school_w1 == 2 | res_mom_at_home_return_school_w1 == 3 | res_mom_at_home_return_school_w1 == 4
replace res_mom_h_return_school_group_w1 = 3 if res_mom_at_home_return_school_w1 == 5
replace res_mom_h_return_school_group_w1 = 0 if res_mom_at_home_return_school_w1 == 6

gen res_mom_h_return_school_group_w2 = 1 if res_mom_at_home_return_school_w2 == 1 
replace res_mom_h_return_school_group_w2 = 2 if res_mom_at_home_return_school_w2 == 2 | res_mom_at_home_return_school_w2 == 3 | res_mom_at_home_return_school_w2 == 4
replace res_mom_h_return_school_group_w2 = 3 if res_mom_at_home_return_school_w2 == 5
replace res_mom_h_return_school_group_w2 = 0 if res_mom_at_home_return_school_w2 == 6










gen res_mom_h_go_to_bed_group_w1  = 1 if res_mom_at_home_go_to_bed_w1  == 1 
replace res_mom_h_go_to_bed_group_w1 = 2 if res_mom_at_home_go_to_bed_w1 == 2 | res_mom_at_home_go_to_bed_w1  == 3 | res_mom_at_home_go_to_bed_w1  == 4
replace res_mom_h_go_to_bed_group_w1 = 3 if res_mom_at_home_go_to_bed_w1 == 5
replace res_mom_h_go_to_bed_group_w1 = 0 if res_mom_at_home_go_to_bed_w1 == 6

gen res_mom_h_go_to_bed_group_w2  = 1 if res_mom_at_home_go_to_bed_w2  == 1 
replace res_mom_h_go_to_bed_group_w2 = 2 if res_mom_at_home_go_to_bed_w2  == 2 | res_mom_at_home_go_to_bed_w2  == 3 | res_mom_at_home_go_to_bed_w2  == 4
replace res_mom_h_go_to_bed_group_w2 = 3 if res_mom_at_home_go_to_bed_w2  == 5
replace res_mom_h_go_to_bed_group_w2 = 0 if res_mom_at_home_go_to_bed_w2  == 6

























gen res_dad_h_leave_school_group_w1 = 1 if res_dad_at_home_leave_school_w1 == 1 
replace res_dad_h_leave_school_group_w1 = 2 if res_dad_at_home_leave_school_w1 == 2 | res_dad_at_home_leave_school_w1 == 3 | res_dad_at_home_leave_school_w1 == 4
replace res_dad_h_leave_school_group_w1 = 3 if res_dad_at_home_leave_school_w1 == 5
replace res_dad_h_leave_school_group_w1 = 0 if res_dad_at_home_leave_school_w1 == 6

gen res_dad_h_leave_school_group_w2 = 1 if res_dad_at_home_leave_school_w2 == 1 
replace res_dad_h_leave_school_group_w2 = 2 if res_dad_at_home_leave_school_w2 == 2 | res_dad_at_home_leave_school_w2 == 3 | res_dad_at_home_leave_school_w2 == 4
replace res_dad_h_leave_school_group_w2 = 3 if res_dad_at_home_leave_school_w2 == 5
replace res_dad_h_leave_school_group_w2 = 0 if res_dad_at_home_leave_school_w2 == 6








gen res_dad_h_return_school_group_w1 = 1 if res_dad_at_home_return_school_w1 == 1 
replace res_dad_h_return_school_group_w1 = 2 if res_dad_at_home_return_school_w1 == 2 | res_dad_at_home_return_school_w1 == 3 | res_dad_at_home_return_school_w1 == 4
replace res_dad_h_return_school_group_w1 = 3 if res_dad_at_home_return_school_w1 == 5
replace res_dad_h_return_school_group_w1 = 0 if res_dad_at_home_return_school_w1 == 6

gen res_dad_h_return_school_group_w2 = 1 if res_dad_at_home_return_school_w2 == 1 
replace res_dad_h_return_school_group_w2 = 2 if res_dad_at_home_return_school_w2 == 2 | res_dad_at_home_return_school_w2 == 3 | res_dad_at_home_return_school_w2 == 4
replace res_dad_h_return_school_group_w2 = 3 if res_dad_at_home_return_school_w2 == 5
replace res_dad_h_return_school_group_w2 = 0 if res_dad_at_home_return_school_w2 == 6










gen res_dad_h_go_to_bed_group_w1  = 1 if res_dad_at_home_go_to_bed_w1  == 1 
replace res_dad_h_go_to_bed_group_w1 = 2 if res_dad_at_home_go_to_bed_w1 == 2 | res_dad_at_home_go_to_bed_w1  == 3 | res_dad_at_home_go_to_bed_w1  == 4
replace res_dad_h_go_to_bed_group_w1 = 3 if res_dad_at_home_go_to_bed_w1 == 5
replace res_dad_h_go_to_bed_group_w1 = 0 if res_dad_at_home_go_to_bed_w1 == 6

gen res_dad_h_go_to_bed_group_w2  = 1 if res_dad_at_home_go_to_bed_w2  == 1 
replace res_dad_h_go_to_bed_group_w2 = 2 if res_dad_at_home_go_to_bed_w2  == 2 | res_dad_at_home_go_to_bed_w2  == 3 | res_dad_at_home_go_to_bed_w2  == 4
replace res_dad_h_go_to_bed_group_w2 = 3 if res_dad_at_home_go_to_bed_w2  == 5
replace res_dad_h_go_to_bed_group_w2 = 0 if res_dad_at_home_go_to_bed_w2  == 6












reshape long tv_hours_per_week_w video_hours_per_week_w computer_games_hours_per_week_w ///
zNeuroticism_w zConscientiousness_w zExtraversion_w  ///
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
no_household_mem_w ///
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
no_household_mem_w 






xtreg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness1 age_w i.religion_group_w ///
i.res_mom_occupation_group_w i.res_mom_pay_w i.res_mom_at_home_or_outside_w i.res_mom_public_assistance_w ///
i.res_mom_handicapped_w i.res_mom_h_leave_school_group_w i.res_mom_h_return_school_group_w i.res_mom_h_go_to_bed_group_w i.res_mom_smoked_w ///
 earnings_summer_w  earning_per_week_w no_household_mem_w, fe  





xtreg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness1 age_w i.religion_group_w ///
i.res_mom_educ_group_w i.res_mom_occupation_group_w i.res_mom_pay_w i.res_mom_at_home_or_outside_w i.res_mom_public_assistance_w ///
i.res_mom_handicapped_w i.res_mom_h_leave_school_group_w i.res_mom_h_return_school_group_w i.res_mom_h_go_to_bed_group_w i.res_mom_smoked_w ///
i.res_dad_educ_group_w i.res_dad_occupation_group_w i.res_dad_pay_w i.res_dad_at_home_or_outside_w i.res_dad_public_assistance_w ///
i.res_dad_handicapped_w i.res_dad_h_leave_school_group_w i.res_dad_h_return_school_group_w i.res_dad_h_go_to_bed_group_w i.res_dad_smoked_w earnings_summer_w  earning_per_week_w no_household_mem_w, fe  

outreg2 using result3, word ctitle(Conscientious wave4)  append



** nice result!!!! Basically when you take out education data, then the result is good since now every individual has 1.5 data 
xtreg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness1 age_w i.religion_group_w  i.res_mom_pay_w i.res_mom_at_home_or_outside_w i.res_mom_public_assistance_w i.res_mom_handicapped_w i.res_mom_h_leave_school_group_w i.res_mom_h_return_school_group_w i.res_mom_h_go_to_bed_group_w i.res_mom_smoked_w  i.res_dad_pay_w i.res_dad_at_home_or_outside_w i.res_dad_public_assistance_w i.res_dad_handicapped_w i.res_dad_h_leave_school_group_w i.res_dad_h_return_school_group_w i.res_dad_h_go_to_bed_group_w i.res_dad_smoked_w earnings_summer_w  earning_per_week_w no_household_mem_w, fe



reg tv_hours_per_week_w c.res_mom_work_hours_w##c.Conscientiousness1 age_w i.religion_w ///
i.res_mom_educ_w i.res_mom_occupation_w i.res_mom_pay_w i.res_mom_at_home_or_outside_w i.res_mom_public_assistance_w ///
i.res_mom_handicapped_w i.res_mom_at_home_leave_school_w i.res_mom_at_home_return_school_w i.res_mom_at_home_go_to_bed_w i.res_mom_smoked_w ///
i.res_dad_educ_w i.res_dad_occupation_w i.res_dad_pay_w i.res_dad_at_home_or_outside_w i.res_dad_public_assistance_w ///
i.res_dad_handicapped_w i.res_dad_at_home_leave_school_w i.res_dad_at_home_return_school_w i.res_dad_at_home_go_to_bed_w i.res_dad_smoked_w res_dad_work_hours_w earnings_summer_w  earning_per_week_w ///
marital_status_mom_or_dad age_mom_or_dad move_here_reason_A move_here_reason_B move_here_reason_C move_here_reason_D move_here_reason_E move_here_reason_F move_here_reason_G move_here_reason_H move_here_reason_I move_here_reason_J ///
family_income_1994 receiving_public_assistance neighborhood, r




























	   	   		
