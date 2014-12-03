cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"



* cd "C:\Users\Julian.Julian-PC\Dropbox\J file\dissertation\Add_health_data\temp_data"


clear


use Add_Health_merged_w1_to_w4, clear


gen race = .

replace race = 1 if H1GI4 == 1   // Hispanic, All Races
replace race = 2 if H1GI6B == 1  // Black or African American, Non-Hispanic
replace race = 3 if H1GI6D == 1  // Asian, Non-Hispanic
replace race = 4 if H1GI6C == 1  // Native American, Non-Hispanic
replace race = 5 if H1GI6E == 1  // Other, Non-Hispanic
replace race = 6 if H1GI6A == 1  // White, Non-Hispanic



gen H4PE11_reverse =  6 - H4PE11
gen H4PE27_reverse =  6 - H4PE27
gen H4PE9_reverse =  6 - H4PE9
gen H4PE25_reverse =  6 - H4PE25
gen H4PE10_reverse =  6 - H4PE10
gen H4PE26_reverse =  6 - H4PE26
gen H4PE13_reverse =  6 - H4PE13
gen H4PE21_reverse =  6 - H4PE21
gen H4PE29_reverse =  6 - H4PE29
gen H4PE12_reverse =  6 - H4PE12
gen H4PE28_reverse =  6 - H4PE28




gen Extraversion_w4 = H4PE1 + H4PE9_reverse + H4PE17 + H4PE25_reverse     // beaware that the higher the number the lower the extravert
gen Agreeableness_w4 = H4PE2 + H4PE10_reverse + H4PE18 + H4PE26_reverse  // beaware that the higher the number the lower the agreeable
gen Conscientiousness_w4 = H4PE3 + H4PE11_reverse + H4PE19 + H4PE27_reverse // beaware that the higher the number the lower the conscientious
gen Neuroticism_w4 = H4PE4 + H4PE12_reverse + H4PE20 + H4PE28_reverse // beware the higher the number the lower the neurotic
gen Openness_w4 = H4PE5 + H4PE13_reverse + H4PE21_reverse + H4PE29_reverse  // beware the higher the number the lower openness








foreach personality in Extraversion_w4 Agreeableness_w4 Conscientiousness_w4 Neuroticism_w4 Openness_w4 {
	egen z`personality' = std(`personality')
}



gen H1PF30_reverse =  6 - H1PF30
gen H1PF32_reverse =  6 - H1PF32
gen H1PF33_reverse =  6 - H1PF33
gen H1PF34_reverse =  6 - H1PF34
gen H1PF35_reverse =  6 - H1PF35
gen H1PF36_reverse =  6 - H1PF36




gen Neuroticism_w1 = H1PF30_reverse + H1PF32_reverse + H1PF33_reverse + H1PF34_reverse + H1PF35_reverse + H1PF36_reverse // beware the higher the number the lower the neurotic
gen Conscientiousness_w1 = H1PF18 + H1PF19 + H1PF20 + H1PF21 // beaware that the higher the number the lower the conscientious
gen Extraversion_w1 = S62B + S62E + S62O // beaware that the higher the number the lower the extravert







foreach personality in Neuroticism_w1 Conscientiousness_w1 Extraversion_w1 {
	egen z`personality' = std(`personality')
}




recode H1GI1M (96=.), gen (w1bmonth)
recode H1GI1Y (96=.), gen (w1byear)
gen w1bdate = mdy(w1bmonth, 15,1900+w1byear)
format w1bdate %d
gen w1idate=mdy(IMONTH, IDAY,1900+IYEAR)
format w1idate %d
gen age_w1=int((w1idate-w1bdate)/365.25)


recode H2GI1M (96=.), gen (w2bmonth)
recode H2GI1Y (96=.), gen (w2byear)
gen w2bdate = mdy(w2bmonth, 15,1900+w2byear)
format w2bdate %d
gen w2idate=mdy(IMONTH2, IDAY2,1900+IYEAR2)
format w2idate %d
gen age_w2=int((w2idate-w2bdate)/365.25)






/*

keep AID race-w1age






save construct_variables, replace

*/




 
rename H1RM1 res_mom_educ_w1
rename H1RM2 res_mom_born_US_w1
rename H1RM3 res_mom_born_country_w1
rename H1RM4 res_mom_occupation_w1
rename H1RM5 res_mom_pay_w1
rename H1RM6 res_mom_has_worked_for_pay_w1
rename H1RM7 res_mom_work_hours_w1
rename H1RM8 res_mom_at_home_or_outside_w1
rename H1RM9 res_mom_public_assistance_w1
rename H1RM10 res_mom_handicapped_w1
rename H1RM11 res_mom_at_home_leave_school_w1
rename H1RM12 res_mom_at_home_return_school_w1
rename H1RM13 res_mom_at_home_go_to_bed_w1
rename H1RM14 res_mom_smoked_w1


rename H1RF1 res_dad_educ_w1
rename H1RF2 res_dad_born_US_w1
rename H1RF3 res_dad_born_country_w1
rename H1RF4 res_dad_occupation_w1
rename H1RF5 res_dad_pay_w1
rename H1RF6 res_dad_has_worked_for_pay_w1
rename H1RF7 res_dad_work_hours_w1
rename H1RF8 res_dad_at_home_or_outside_w1
rename H1RF9 res_dad_public_assistance_w1
rename H1RF10 res_dad_handicapped_w1
rename H1RF11 res_dad_at_home_leave_school_w1
rename H1RF12 res_dad_at_home_return_school_w1
rename H1RF13 res_dad_at_home_go_to_bed_w1
rename H1RF14 res_dad_smoked_w1



rename H2RM1 res_mom_educ_w2
rename H2RM2 res_mom_born_US_w2
rename H2RM3 res_mom_born_country_w2
rename H2RM4 res_mom_occupation_w2
rename H2RM5 res_mom_pay_w2
rename H2RM6 res_mom_has_worked_for_pay_w2
rename H2RM7 res_mom_work_hours_w2
rename H2RM8 res_mom_at_home_or_outside_w2
rename H2RM9 res_mom_public_assistance_w2
rename H2RM10 res_mom_handicapped_w2
rename H2RM11 res_mom_at_home_leave_school_w2
rename H2RM12 res_mom_at_home_return_school_w2
rename H2RM13 res_mom_at_home_go_to_bed_w2
rename H2RM14 res_mom_smoked_w2


rename H2RF1 res_dad_educ_w2
rename H2RF2 res_dad_born_US_w2
rename H2RF3 res_dad_born_country_w2
rename H2RF4 res_dad_occupation_w2
rename H2RF5 res_dad_pay_w2
rename H2RF6 res_dad_has_worked_for_pay_w2
rename H2RF7 res_dad_work_hours_w2
rename H2RF8 res_dad_at_home_or_outside_w2
rename H2RF9 res_dad_public_assistance_w2
rename H2RF10 res_dad_handicapped_w2
rename H2RF11 res_dad_at_home_leave_school_w2
rename H2RF12 res_dad_at_home_return_school_w2
rename H2RF13 res_dad_at_home_go_to_bed_w2
rename H2RF14 res_dad_smoked_w2
	   	   

		   
		   

gen earnings_non_summer_w2 = 0
replace earnings_non_summer_w2 = H2EE5 if H2EE5 != .
gen earnings_summer_w2 = 0
replace earnings_summer_w2 = H2EE7 if H2EE7 != .


rename H2EE8 allowance_w2
gen earning_per_week_w2 = earnings_non_summer_w2 + allowance_w2


gen earnings_non_summer_w1 = 0
replace earnings_non_summer_w1 = H1EE5 if H1EE5 != .
gen earnings_summer_w1 = 0
replace earnings_summer_w1 = H1EE7 if H1EE7 != .


rename H1EE8 allowance_w1
gen earning_per_week_w1 = earnings_non_summer_w1 + allowance_w1


	   

rename H1RE1 religion_w1  // questions w1 and w2 are the same 
rename H2RE1 religion_w2
 
 
 

* checked 1 time
rename PA1 sex_mom_or_dad	    
rename PA2 age_mom_or_dad
rename PA10 marital_status_mom_or_dad
rename PA17 full_time_mom_or_dad
rename PA21 receiving_public_assistance
rename PA30 neighborhood
rename PA55 family_income_1994
rename (PA28A PA28B PA28C PA28D PA28E PA28F PA28G PA28H PA28I PA28J) ///
(move_here_reason_A move_here_reason_B move_here_reason_C move_here_reason_D move_here_reason_E move_here_reason_F move_here_reason_G move_here_reason_H move_here_reason_I move_here_reason_J)
rename PB2 sex_spouse
rename PB13 full_time_spouse


* checked 1 time
rename H1DA1 work_in_house_w1
rename H1DA2 hobbies_w1
rename H1DA3 times_tv_videos_w1
rename H1DA4 roller_blading_cycling_w1
rename H1DA5 play_active_sport_w1
rename H1DA6 exercise_w1
rename H1DA7 hang_out_frds_w1
rename H1DA8 tv_hours_per_week_w1
rename H1DA9 video_hours_per_week_w1	   
rename H1DA10 computer_games_hours_per_week_w1
rename H1DA11 listen_radio_hours_per_week_w1






rename H2DA8 tv_hours_per_week_w2
rename H2DA9 video_hours_per_week_w2	   
rename H2DA10 computer_games_hours_per_week_w2	   
	   	   
	   


rename H1GH59A  height_feet_w1
rename H1GH59B  height_inch_w1
gen height_w1 = (height_feet_w1*12) + height_inch_w1
rename H1GH60  weight_w1
gen BMI_w1 = (weight_w1*0.454)/((height_w1*0.0254)^2)
	   
	   
	   
	   


egen no_household_mem_w1 = rownonmiss(H1HR2A H1HR2B H1HR2C H1HR2D H1HR2E H1HR2F H1HR2G H1HR2H H1HR2I H1HR2J H1HR2K H1HR2L H1HR2M H1HR2N H1HR2O H1HR2P H1HR2Q H1HR2R H1HR2S H1HR2T) if IMONTH !=. | IDAY !=. | IYEAR !=.
egen no_household_mem_w2 = rownonmiss(H2HR2A H2HR2B H2HR2C H2HR2D H2HR2E H2HR2F H2HR2G H2HR2H H2HR2I H2HR2J H2HR2K H2HR2L H2HR2M H2HR2N H2HR2O H2HR2P H2HR2Q) if IMONTH2 !=. | IDAY2 !=. | IYEAR2 !=. 


save constructed_variables, replace










/*
 ** throw these away 
global resident_mom_w1 "res_mom_educ_w1 res_mom_born_US_w1  res_mom_occupation_w1 res_mom_pay_w1   res_mom_at_home_or_outside_w1 res_mom_public_assistance_w1 res_mom_handicapped_w1 res_mom_at_home_leave_school_w1 res_mom_at_home_return_school_w1 res_mom_at_home_go_to_bed_w1 res_mom_smoked_w1"
global resident_dad_w1 "res_dad_educ_w1 res_dad_born_US_w1  res_dad_occupation_w1 res_dad_pay_w1   res_dad_at_home_or_outside_w1 res_dad_public_assistance_w1 res_dad_handicapped_w1 res_dad_at_home_leave_school_w1 res_dad_at_home_return_school_w1 res_dad_at_home_go_to_bed_w1 res_dad_smoked_w1"


global resident_mom_w2 "res_mom_educ_w2 res_mom_born_US_w2  res_mom_occupation_w2 res_mom_pay_w2   res_mom_at_home_or_outside_w2 res_mom_public_assistance_w2 res_mom_handicapped_w2 res_mom_at_home_leave_school_w2 res_mom_at_home_return_school_w2 res_mom_at_home_go_to_bed_w2 res_mom_smoked_w2"
global resident_dad_w2 "res_dad_educ_w2 res_dad_born_US_w2  res_dad_occupation_w2 res_dad_pay_w2   res_dad_at_home_or_outside_w2 res_dad_public_assistance_w2 res_dad_handicapped_w2 res_dad_at_home_leave_school_w2 res_dad_at_home_return_school_w2 res_dad_at_home_go_to_bed_w2 res_dad_smoked_w2"





gen mom_full_time_w1 = 1 if res_mom_work_hours_w1 >= 35 & res_mom_at_home_or_outside_w1 == 2
replace mom_full_time_w1 = 0 if res_mom_work_hours_w1 < 35 & res_mom_at_home_or_outside_w1 == 2


gen mom_full_time_w1_v2 = 1 if res_mom_work_hours_w1 >= 30 & res_mom_at_home_or_outside_w1 == 2
replace mom_full_time_w1_v2 = 0 if res_mom_work_hours_w1 < 30 & res_mom_at_home_or_outside_w1 == 2


gen mom_full_time_w1_v3 = 1 if res_mom_work_hours_w1 >= 40 & res_mom_at_home_or_outside_w1 == 2
replace mom_full_time_w1_v3 = 0 if res_mom_work_hours_w1 < 40 & res_mom_at_home_or_outside_w1 == 2

correlate mom_full_time_w1 full_time_mom_or_dad if sex_mom_or_dad == 2
correlate mom_full_time_w1_v2 full_time_mom_or_dad if sex_mom_or_dad == 2
correlate mom_full_time_w1_v3 full_time_mom_or_dad if sex_mom_or_dad == 2

*/













/*
reg tv_hours_per_week_w1  c.zConscientiousness_w1##c.res_mom_work_hours_w1 BIO_SEX race w1age religion $resident_mom_w1 $resident_dad_w1 neighborhood family_income_1994 AH_PVT AH_RAW earnings_summer_w1 earning_per_week_w1 [pweight = GSWGT1], r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w1=(-1 (0.1) 1)) vsquish





reg video_hours_per_week_w1  c.zConscientiousness_w1##c.res_mom_work_hours_w1 BIO_SEX race w1age religion $resident_mom_w1 $resident_dad_w1 neighborhood family_income_1994 AH_PVT AH_RAW  earnings_summer_w1 earning_per_week_w1[pweight = GSWGT1], r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w1=(-1 (0.1) 1)) vsquish




reg computer_games_hours_per_week_w1  c.zConscientiousness_w1##c.res_mom_work_hours_w1 BIO_SEX race w1age religion $resident_mom_w1 $resident_dad_w1 neighborhood family_income_1994 AH_PVT AH_RAW earnings_summer_w1 earning_per_week_w1 [pweight = GSWGT1], r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w1=(-1 (0.1) 1)) vsquish















reg tv_hours_per_week_w1  c.zConscientiousness_w4##c.res_mom_work_hours_w1 BIO_SEX race w1age religion $resident_mom_w1 $resident_dad_w1 neighborhood family_income_1994 AH_PVT AH_RAW earnings_summer_w1 earning_per_week_w1 [pweight = GSWGT1], r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w4=(-1 (0.1) 1)) vsquish





reg video_hours_per_week_w1  c.zConscientiousness_w4##c.res_mom_work_hours_w1 BIO_SEX race w1age religion $resident_mom_w1 $resident_dad_w1 neighborhood family_income_1994 AH_PVT AH_RAW  earnings_summer_w1 earning_per_week_w1[pweight = GSWGT1], r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w4=(-1 (0.1) 1)) vsquish




reg computer_games_hours_per_week_w1  c.zConscientiousness_w4##c.res_mom_work_hours_w1 BIO_SEX race w1age religion $resident_mom_w1 $resident_dad_w1 neighborhood family_income_1994 AH_PVT AH_RAW earnings_summer_w1 earning_per_week_w1 [pweight = GSWGT1], r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w4=(-1 (0.1) 1)) vsquish
















****** this regression used parents background in wave 1!!!!!!!!!:  
reg tv_hours_per_week_w2  c.zConscientiousness_w1##c.res_mom_work_hours_w2 BIO_SEX race w1age religion $resident_mom_w1 $resident_dad_w1 neighborhood family_income_1994 AH_PVT AH_RAW earnings_summer_w2 earning_per_week_w2 [pweight = GSWGT2] , r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w1=(-1 (0.1) 1)) vsquish





reg video_hours_per_week_w2  c.zConscientiousness_w1##c.res_mom_work_hours_w2 BIO_SEX race w1age religion $resident_mom_w2 $resident_dad_w2 neighborhood family_income_1994 AH_PVT AH_RAW earnings_summer_w2 earning_per_week_w2[pweight = GSWGT2], r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w1=(-1 (0.1) 1)) vsquish




reg computer_games_hours_per_week_w2  c.zConscientiousness_w1##c.res_mom_work_hours_w2 BIO_SEX race w1age religion $resident_mom_w2 $resident_dad_w2 neighborhood family_income_1994 AH_PVT AH_RAW earnings_summer_w2 earning_per_week_w2[pweight = GSWGT2], r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w1=(-1 (0.1) 1)) vsquish







****** this regression used parents background in wave 1!!!!!!!!!:  

reg tv_hours_per_week_w2  c.zConscientiousness_w4##c.res_mom_work_hours_w2 BIO_SEX race w1age religion $resident_mom_w1 $resident_dad_w1 neighborhood family_income_1994 AH_PVT AH_RAW earnings_summer_w2 earning_per_week_w2 [pweight = GSWGT2] , r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w4=(-1 (0.1) 1)) vsquish





reg video_hours_per_week_w2  c.zConscientiousness_w4##c.res_mom_work_hours_w2 BIO_SEX race w1age religion $resident_mom_w1 $resident_dad_w1 neighborhood family_income_1994 AH_PVT AH_RAW earnings_summer_w2 earning_per_week_w2[pweight = GSWGT2], r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w4=(-1 (0.1) 1)) vsquish




reg computer_games_hours_per_week_w2  c.zConscientiousness_w4##c.res_mom_work_hours_w2 BIO_SEX race w1age religion $resident_mom_w1 $resident_dad_w1 neighborhood family_income_1994 AH_PVT AH_RAW earnings_summer_w2 earning_per_week_w2[pweight = GSWGT2], r

margins, dydx(res_mom_work_hours) at(zConscientiousness_w4=(-1 (0.1) 1)) vsquish






*/ 


