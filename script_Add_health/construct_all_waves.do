*  cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"



* cd "C:\Users\Julian.Julian-PC\Dropbox\J file\dissertation\Add_health_data\temp_data"
* cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"

* cd "C:\Users\AYSPS\Desktop\temp_data"

* set maxvar 32767

* cd "D:\temp_data"
cd "F:\temp_data"



clear

* use Add_Health_merged_w1_to_w2, clear


use temp_missing_data, clear

* use Add_Health_merged_w1_to_w4, clear






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



gen H4PE1_reverse = 6 - H4PE1
gen H4PE17_reverse = 6 - H4PE17
gen H4PE2_reverse = 6 - H4PE2
gen H4PE18_reverse = 6 - H4PE18
gen H4PE3_reverse = 6 - H4PE3
gen H4PE19_reverse = 6 - H4PE19
gen H4PE4_reverse = 6 - H4PE4
gen H4PE20_reverse = 6 - H4PE20
gen H4PE5_reverse = 6 - H4PE5





gen Extraversion_v2_w4 = H4PE1_reverse + H4PE9 + H4PE17_reverse + H4PE25    
gen Agreeableness_v2_w4 = H4PE2_reverse + H4PE10 + H4PE18_reverse + H4PE26  
gen Conscientiousness_v2_w4 = H4PE3_reverse + H4PE11 + H4PE19_reverse + H4PE27 
gen Neuroticism_v2_w4 = H4PE4_reverse + H4PE12 + H4PE20_reverse + H4PE28
gen Openness_v2_w4 = H4PE5_reverse + H4PE13 + H4PE21 + H4PE29


foreach personality in Extraversion_v2_w4 Agreeableness_v2_w4 Conscientiousness_v2_w4 Neuroticism_v2_w4 Openness_v2_w4 {
	egen z`personality' = std(`personality')
}





foreach personality in Extraversion_w4 Agreeableness_w4 Conscientiousness_w4 Neuroticism_w4 Openness_w4 {
	egen z`personality' = std(`personality')
}






* Item Reversal of personality test
gen H1PF30_reverse =  6 - H1PF30
gen H1PF32_reverse =  6 - H1PF32
gen H1PF33_reverse =  6 - H1PF33
gen H1PF34_reverse =  6 - H1PF34
gen H1PF35_reverse =  6 - H1PF35
gen H1PF36_reverse =  6 - H1PF36






gen Neuroticism_w1 = H1PF30_reverse + H1PF32_reverse + H1PF33_reverse + H1PF34_reverse + H1PF35_reverse + H1PF36_reverse // beware the higher the number the lower the neurotic
gen Conscientiousness_w1 = H1PF18 + H1PF19 + H1PF20 + H1PF21 // beaware that the higher the number the lower the conscientious
gen Extraversion_w1 = S62B + S62E + S62O // beaware that the higher the number the lower the extravert



gen H1PF18_reverse = 6 - H1PF18
gen H1PF19_reverse = 6 - H1PF19
gen H1PF20_reverse = 6 - H1PF20
gen H1PF21_reverse = 6 - H1PF21


gen S62B_reverse = 6 - S62B
gen S62E_reverse = 6 - S62E
gen S62O_reverse = 6 - S62O


gen Neuroticism_v2_w1 = H1PF30 + H1PF32 + H1PF33+ H1PF34 + H1PF35 + H1PF36 
gen Conscientiousness_v2_w1 = H1PF18_reverse + H1PF19_reverse + H1PF20_reverse + H1PF21_reverse 
gen Extraversion_v2_w1 = S62B_reverse + S62E_reverse + S62O_reverse





foreach personality in Neuroticism_w1 Conscientiousness_w1 Extraversion_w1 {
	egen z`personality' = std(`personality')
}




****************** this reverse the interpretation of conscientiousness!!!!
replace zConscientiousness_w1 = zConscientiousness_w1*(-1)


replace zNeuroticism_w1 = zNeuroticism_w1*(-1)




foreach personality in Neuroticism_v2_w1 Conscientiousness_v2_w1 Extraversion_v2_w1 {
	egen z`personality' = std(`personality')
}



/*

keep AID race-w1age






save construct_variables, replace

*/




gen month_year_w1 = IMONTH*IYEAR

gen month_year_w2 = IMONTH2*IYEAR2

* section 1

gen race = .
replace race = 1 if H1GI4==1  /* Hispanic, All Races */ 
replace race = 2 if (H1GI6B==1 & H1GI4 == 0) /* Black or African American, Non-Hispanic */
replace race = 3 if (H1GI6D==1 & H1GI4 == 0 & H1GI6B == 0 ) /* Asian, Non-Hispanic */ 
replace race = 4 if (H1GI6C==1 & H1GI4 == 0 & H1GI6B == 0 & H1GI6D == 0) /* Native American, Non-Hispanic */ 
replace race = 5 if (H1GI6E==1 & H1GI4 == 0 & H1GI6B == 0 & H1GI6D == 0 & H1GI6C == 0 ) /* Other, Non-Hispanic */ 
replace race = 6 if (H1GI6A==1 & H1GI4 == 0 & H1GI6B == 0 & H1GI6D == 0 & H1GI6C == 0 & H1GI6E == 0) /* White, Non-Hispanic */ 






/*

* replace race = 1 if H1GI4 == 1   // Hispanic, All Races
replace race = 1 if H1GI6A == 1  // White
replace race = 2 if H1GI6B == 1  // Black or African American
replace race = 3 if H1GI6C == 1  // Native American
replace race = 4 if H1GI6D == 1  // Asian
replace race = 5 if H1GI6E == 1  // Other
gen race_2 =  H1GI6A + H1GI6B + H1GI6C + H1GI6D + H1GI6E
replace race = 6 if race_2 == 2 | race_2 == 3 | race_2 == 4 // 2 races
*/

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











* checked 1 time  
* section 2  w1, w2   (key variables for y variables)
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

gen tv_video_comp_games_w1 = tv_hours_per_week_w1 + video_hours_per_week_w1 + computer_games_hours_per_week_w1




rename H2DA1 work_in_house_w2
rename H2DA2 hobbies_w2
rename H2DA3 times_tv_videos_w2
rename H2DA4 roller_blading_cycling_w2
rename H2DA5 play_active_sport_w2
rename H2DA6 exercise_w2
rename H2DA7 hang_out_frds_w2
rename H2DA8 tv_hours_per_week_w2
rename H2DA9 video_hours_per_week_w2	   
rename H2DA10 computer_games_hours_per_week_w2
rename H2DA11 listen_radio_hours_per_week_w2

gen tv_video_comp_games_w2 = tv_hours_per_week_w2 + video_hours_per_week_w2 + computer_games_hours_per_week_w2




* section 3  w1, w2
rename H1GH1 general_health_w1
rename H1GH2 headache_w1
rename H1GH3 feeling_hot_w1
rename H1GH4 stomach_ache_w1
rename H1GH5 cold_sweats_w1
rename H1GH6 physical_weak_w1
rename H1GH7 sore_throat_w1
rename H1GH8 tired_w1
rename H1GH9 pain_urination_w1
rename H1GH10 sick_w1
rename H1GH11 wake_up_tired_w1
rename H1GH12 skin_problem_w1
rename H1GH13 dizziness_w1
rename H1GH14 chest_pain_w1
rename H1GH15 muscle_pain_w1

rename H1GH17 poor_appetite_w1
rename H1GH18 trouble_sleep_w1
rename H1GH19 trouble_relax_w1
rename H1GH20 moodiness_w1
rename H1GH21 freq_crying_w1
rename H1GH22 fearful_w1













rename H1GH26 no_medical_care_but_should_w1
rename H1GH28 weight_image_w1
rename H1GH29 lose_weight_w1

gen diet_for_weight_w1 = 1 if H1GH30A == 1
replace diet_for_weight_w1 = 1 if H1GH31A == 1
replace diet_for_weight_w1 = 0 if H1GH30A == 0
replace diet_for_weight_w1 = 0 if H1GH31A == 0
replace diet_for_weight_w1 = 0 if lose_weight_w1 == 4


gen exercise_for_weight_w1 = 1 if H1GH30B == 1
replace exercise_for_weight_w1 = 1 if H1GH31B == 1
replace exercise_for_weight_w1 = 0 if H1GH30B == 0
replace exercise_for_weight_w1 = 0 if H1GH31B == 0
replace exercise_for_weight_w1 = 0 if lose_weight_w1 == 4


rename H1GH23A breakfast_milk_w1
rename H1GH23G breakfast_snack_w1

rename H1GH33 fruit_juice_w1
rename H1GH34 vege_w1
rename H1GH36 cookies_w1
gen cookies_dum_w1 = 0 if cookies_w1 == 0 
replace cookies_dum_w1 = 1 if (cookies_w1 == 1 | cookies_w1 == 2)





rename H1GH37 school_PE_days_w1
rename H1GH38 school_PE_min_w1
rename H1GH48 health_cause_sch_absence_w1
rename H1GH49 health_cause_soc_absence_w1
rename H1GH50 sleep_time_w1

gen sleep_b4_midnight_w1 = 1 if regexm(sleep_time_w1, "P$") == 1
replace sleep_b4_midnight_w1 = 0 if regexm(sleep_time_w1, "A$") == 1



rename H1GH51 sleep_hours_w1
rename H1GH52 enough_sleep_w1
rename H1GH53 night_outside_no_perm_w1
rename H1GH59A  height_feet_w1
rename H1GH59B  height_inch_w1
gen height_w1 = (height_feet_w1*12) + height_inch_w1
rename H1GH60  weight_w1
gen BMI_w1 = (weight_w1*0.454)/((height_w1*0.0254)^2)
egen BMI_zscore_w1 = zanthro(BMI_w1,ba,US), xvar(age_w1) gender(BIO_SEX) gencode(male=1,female=2)	   
gen BMIZ_percentile_w1 = normal(BMI_zscore_w1)
gen overweight_w1 = .
replace overweight_w1 = 1 if BMIZ_percentile_w1 > 0.85
replace overweight_w1 = 0 if BMIZ_percentile_w1 <= 0.85

gen obese_w1 = . 	   
replace obese_w1 = 1 if BMIZ_percentile_w1 > 0.95
replace obese_w1 = 0 if BMIZ_percentile_w1 <= 0.95

rename H1GH23J eat_breakfast_w1



rename H2GH1 general_health_w2


rename H2GH8 headache_w2
rename H2GH9 feeling_hot_w2
rename H2GH10 stomach_ache_w2
rename H2GH11 cold_sweats_w2
rename H2GH12 physical_weak_w2
rename H2GH13 sore_throat_w2
rename H2GH14 tired_w2
rename H2GH15 pain_urination_w2
rename H2GH16 sick_w2
rename H2GH17 wake_up_tired_w2
rename H2GH18 skin_problem_w2
rename H2GH19 dizziness_w2
rename H2GH20 chest_pain_w2
rename H2GH21 muscle_pain_w2
rename H2GH22 poor_appetite_w2
rename H2GH23 trouble_sleep_w2
rename H2GH24 trouble_relax_w2
rename H2GH25 moodiness_w2
rename H2GH26 freq_crying_w2
rename H2GH27 fearful_w2




rename H2GH28 no_medical_care_but_should_w2
rename H2GH30 weight_image_w2
rename H2GH31 lose_weight_w2


gen diet_for_weight_w2 = 1 if H2GH32A == 1
replace diet_for_weight_w2 = 1 if H2GH33A == 1
replace diet_for_weight_w2 = 0 if H2GH32A == 0
replace diet_for_weight_w2 = 0 if H2GH33A == 0
replace diet_for_weight_w2 = 0 if lose_weight_w2 == 4


gen exercise_for_weight_w2 = 1 if H2GH32B == 1
replace exercise_for_weight_w2 = 1 if H2GH33B == 1
replace exercise_for_weight_w2 = 0 if H2GH32B == 0
replace exercise_for_weight_w2 = 0 if H2GH33B == 0
replace exercise_for_weight_w2 = 0 if lose_weight_w2 == 4


rename H2GH34 school_PE_days_w2
rename H2GH35 school_PE_min_w2
rename H2GH40 health_cause_sch_absence_w2     // dont use this...lots of skipped
rename H2GH41 health_cause_soc_absence_w2

rename H2GH42 sleep_time_school_w2   // check this again!!!

gen sleep_b4_midnight_school_w2 = 1 if regexm(sleep_time_school_w2, "P$") == 1
replace sleep_b4_midnight_school_w2 = 0 if regexm(sleep_time_school_w2, "A$") == 1

rename H2GH43 sleep_time_summer_w2   // check this again!!!


gen sleep_b4_midnight_summer_w2 = 1 if regexm(sleep_time_summer_w2, "P$") == 1
replace sleep_b4_midnight_summer_w2 = 0 if regexm(sleep_time_summer_w2, "A$") == 1



rename H2GH44 sleep_hours_w2
rename H2GH45 enough_sleep_w2
rename H2GH46 night_outside_no_perm_w2	   
rename H2GH52F height_feet_w2
rename H2GH52I height_inch_w2
gen height_w2 = (height_feet_w2*12) + height_inch_w2
rename H2GH53 weight_w2
*gen BMI_w2 = (weight_w2*0.454)/((height_w2*0.0254)^2)

gen height_meas_w2 = (H2WS16HF*12) + H2WS16HI

gen BMI_w2 = (H2WS16W*0.454)/((height_meas_w2*0.0254)^2)


egen BMI_zscore_w2 = zanthro(BMI_w2,ba,US), xvar(age_w2) gender(BIO_SEX) gencode(male=1,female=2)
gen BMIZ_percentile_w2 = normal(BMI_zscore_w2)
gen overweight_w2 = .
replace overweight_w2 = 1 if BMIZ_percentile_w2 > 0.85
replace overweight_w2 = 0 if BMIZ_percentile_w2 <= 0.85
	   

gen obese_w2 = . 	   
replace obese_w2 = 1 if BMIZ_percentile_w2 > 0.95
replace obese_w2 = 0 if BMIZ_percentile_w2 <= 0.95


* section 4

* may add later


* section 5 w1, section 6 w2
rename H1ED1 abs_school_w1
rename H1ED2 abs_school_no_excuse_w1
rename H1ED7 suspension_w1
rename H1ED11 grade_ELA_w1
rename H1ED12 grade_math_w1
rename H1ED13 grade_history_w1
rename H1ED14 grade_science_w1
rename H1ED15 get_along_teacher_w1
rename H1ED16 pay_attention_w1
rename H1ED17 get_hw_done_w1
rename H1ED18 get_along_stud_w1 
rename H1ED19 close_to_people_w1
rename H1ED20 feel_part_of_school_w1
rename H1ED21 stud_prejudiced_w1
rename H1ED22 happy_at_school_w1
rename H1ED23 teachers_treat_fairly_w1
rename H1ED24 feel_safe_w1





rename H2ED1 abs_school_w2
rename H2ED2 abs_school_no_excuse_w2
rename H2ED3 suspension_w2
rename H2ED7 grade_ELA_w2
rename H2ED8 grade_math_w2
rename H2ED9 grade_history_w2
rename H2ED10 grade_science_w2
rename H2ED11 get_along_teacher_w2
rename H2ED12 pay_attention_w2
rename H2ED13 get_hw_done_w2
rename H2ED14 get_along_stud_w2
rename H2ED15 close_to_people_w2
rename H2ED16 feel_part_of_school_w2
rename H2ED17 stud_prejudiced_w2
rename H2ED18 happy_at_school_w2
rename H2ED19 teachers_treat_fairly_w2
rename H2ED20 feel_safe_w2



* section 6 skipped cuz sample size is too small



* section 7
rename H1HS1 routine_phy_check_w1
rename H1HS2A phy_exam_private_doctor_w1   // maybe for family wealth
rename H1HS2B phy_exam_community_clinic_w1
rename H1HS2C phy_exam_school_w1
rename H1HS2D phy_exam_hospital_w1
rename H1HS2E phy_exam_other_w1


rename H2HS1 routine_phy_check_w2
rename H2HS2A phy_exam_private_doctor_w2   // maybe for family wealth
rename H2HS2B phy_exam_community_clinic_w2
rename H2HS2C phy_exam_school_w2
rename H2HS2D phy_exam_hospital_w2
rename H2HS2E phy_exam_other_w2



* section 8 w1, w2is skipped since it is not related to my topic yet (sex topic might be relevant)


* section 9 w1, w2 is skipped since it is not related to my topic yet (sex topic might be relevant)


* section 10 w1, w2
forvalues i = 1(1)2 {
	rename H`i'FS1 bothered_by_things_w`i'
	rename H`i'FS2 appetite_w`i'
	rename H`i'FS3 could_not_shake_off_blues_w`i'
	rename H`i'FS4 felt_as_good_as_others_w`i'
	rename H`i'FS5 trouble_concentrate_w`i'
	rename H`i'FS6 felt_depressed_w`i'
	rename H`i'FS7 felt_too_tired_w`i'
	rename H`i'FS8 felt_hopeful_w`i'
	rename H`i'FS9 felt_life_failure_w`i'
	rename H`i'FS10 felt_fearful_w`i'
	rename H`i'FS11 felt_happy_w`i'
	rename H`i'FS12 talked_less_w`i'
	rename H`i'FS13 felt_lonely_w`i'
	rename H`i'FS14 felt_unfriendly_w`i'
	rename H`i'FS15 enjoyed_life_w`i'
	rename H`i'FS16 felt_sad_w`i'
	rename H`i'FS17 felt_disliked_w`i'
	rename H`i'FS18 hard_get_started_w`i'
	rename H`i'FS19 life_not_worth_living_w`i'
}









* section 11 w1, section 11 w2


* show which one should be dropped

egen num_96_w1 = anycount(H1HR3A H1HR3B H1HR3C H1HR3D H1HR3E H1HR3F H1HR3G H1HR3H H1HR3I H1HR3J H1HR3K H1HR3L H1HR3M H1HR3N H1HR3O H1HR3P H1HR3Q H1HR3R H1HR3S H1HR3T), values(96)
egen num_98_w1 = anycount(H1HR3A H1HR3B H1HR3C H1HR3D H1HR3E H1HR3F H1HR3G H1HR3H H1HR3I H1HR3J H1HR3K H1HR3L H1HR3M H1HR3N H1HR3O H1HR3P H1HR3Q H1HR3R H1HR3S H1HR3T), values(98)
egen num_99_w1 = anycount(H1HR3A H1HR3B H1HR3C H1HR3D H1HR3E H1HR3F H1HR3G H1HR3H H1HR3I H1HR3J H1HR3K H1HR3L H1HR3M H1HR3N H1HR3O H1HR3P H1HR3Q H1HR3R H1HR3S H1HR3T), values(99)





gen mom_w1 = 0

replace mom_w1 = 1 if H1HR3A == 14 | H1HR3B == 14 | H1HR3C == 14 | H1HR3D == 14 | H1HR3E == 14 | H1HR3F == 14 | H1HR3G == 14 | H1HR3H == 14 | H1HR3I == 14 | H1HR3J == 14 | ///
H1HR3K == 14 | H1HR3L == 14 | H1HR3M == 14 | H1HR3N == 14 | H1HR3O == 14 | H1HR3P == 14 | H1HR3Q == 14 | H1HR3R == 14 | H1HR3S == 14 | H1HR3T == 14 


gen bio_mom_w1 = 0
replace bio_mom_w1 = 1 if H1HR6A == 7 | H1HR6B == 7 | H1HR6C == 7 | H1HR6D == 7 | H1HR6E == 7 | H1HR6F == 7 | H1HR6G == 7 | H1HR6H == 7 | H1HR6I == 7 | H1HR6J == 7 | ///
H1HR6K == 7 | H1HR6L == 7 | H1HR6M == 7 | H1HR6N == 7 | H1HR6O == 7 | H1HR6P == 7 | H1HR6Q == 7 | H1HR6R == 7 | H1HR6S == 7 | H1HR6T == 7





********* gen mom's age w1 *********

foreach alpha in A B C D E F G H I J K L M N O P Q R S T {
	gen age_mom_`alpha'_w1 = .
	gen age_mom_`alpha'_est_w1 = .

	replace age_mom_`alpha'_w1 = H1HR7`alpha' if H1HR3`alpha' == 14  & H1HR7`alpha' < 990

	replace age_mom_`alpha'_est_w1 = H1HR8`alpha' if H1HR3`alpha' == 14  & H1HR8`alpha' <= 990
}

egen age_mom_w1 = rowmean( age_mom_A_w1 age_mom_B_w1 age_mom_C_w1 age_mom_D_w1 age_mom_E_w1 age_mom_F_w1 age_mom_G_w1 age_mom_H_w1 age_mom_I_w1 age_mom_J_w1 age_mom_K_w1 age_mom_L_w1 age_mom_M_w1 age_mom_N_w1 ///
age_mom_O_w1 age_mom_P_w1 age_mom_Q_w1 age_mom_R_w1 age_mom_S_w1 age_mom_T_w1 ///
age_mom_A_est_w1 age_mom_B_est_w1 age_mom_C_est_w1 age_mom_D_est_w1 age_mom_E_est_w1 age_mom_F_est_w1 age_mom_G_est_w1 age_mom_H_est_w1 age_mom_I_est_w1 age_mom_J_est_w1 age_mom_K_est_w1 age_mom_L_est_w1 age_mom_M_est_w1 age_mom_N_est_w1 ///
age_mom_O_est_w1 age_mom_P_est_w1 age_mom_Q_est_w1 age_mom_R_est_w1 age_mom_S_est_w1 age_mom_T_est_w1)



replace age_mom_w1 = . if age_mom_w1 > 990
replace age_mom_w1 = 0 if no_mom_w1 == 1


********* gen mom's age w1 *********






* can be used to check data: egen num_bio_dad = anycount(H1HR6A H1HR6B H1HR6C H1HR6D H1HR6E H1HR6F H1HR6G H1HR6H H1HR6I H1HR6J H1HR6K H1HR6L H1HR6M H1HR6N H1HR6O H1HR6P H1HR6Q H1HR6R H1HR6S H1HR6T), values(1)
*****!!!!! one person has 2 dad!!!


gen dad_w1 = 0

replace dad_w1 = 1 if H1HR3A == 11 | H1HR3B == 11 | H1HR3C == 11 | H1HR3D == 11 | H1HR3E == 11 | H1HR3F == 11 | H1HR3G == 11 | H1HR3H == 11 | H1HR3I == 11 | H1HR3J == 11 | ///
H1HR3K == 11 | H1HR3L == 11 | H1HR3M == 11 | H1HR3N == 11 | H1HR3O == 11 | H1HR3P == 11 | H1HR3Q == 11 | H1HR3R == 11 | H1HR3S == 11 | H1HR3T == 11 


gen bio_dad_w1 = 0
replace bio_dad_w1 = 1 if H1HR6A == 1 | H1HR6B == 1 | H1HR6C == 1 | H1HR6D == 1 | H1HR6E == 1 | H1HR6F == 1 | H1HR6G == 1 | H1HR6H == 1 | H1HR6I == 1 | H1HR6J == 1 | ///
H1HR6K == 1 | H1HR6L == 1 | H1HR6M == 1 | H1HR6N == 1 | H1HR6O == 1 | H1HR6P == 1 | H1HR6Q == 1 | H1HR6R == 1 | H1HR6S == 1 | H1HR6T == 1








********* gen dad's age w1 *********

	
foreach alpha in A B C D E F G H I J K L M N O P Q R S T {	
	gen age_dad_`alpha'_w1 = .
	gen age_dad_`alpha'_est_w1 = .
	
	replace age_dad_`alpha'_w1 = H1HR7`alpha' if H1HR3`alpha' == 11  & H1HR7`alpha' < 200
	replace age_dad_`alpha'_est_w1 = H1HR7`alpha' if H1HR3`alpha' == 11  & H1HR8`alpha' <= 990

}	
	
egen age_dad_w1 = rowmean( age_dad_A_w1 age_dad_B_w1 age_dad_C_w1 age_dad_D_w1 age_dad_E_w1 age_dad_F_w1 age_dad_G_w1 age_dad_H_w1 age_dad_I_w1 age_dad_J_w1 age_dad_K_w1 age_dad_L_w1 age_dad_M_w1 age_dad_N_w1 ///	
age_dad_O_w1 age_dad_P_w1 age_dad_Q_w1 age_dad_R_w1 age_dad_S_w1 age_dad_T_w1 ///
age_dad_A_est_w1 age_dad_B_est_w1 age_dad_C_est_w1 age_dad_D_est_w1 age_dad_E_est_w1 age_dad_F_est_w1 age_dad_G_est_w1 age_dad_H_est_w1 age_dad_I_est_w1 age_dad_J_est_w1 age_dad_K_est_w1 age_dad_L_est_w1 age_dad_M_est_w1 age_dad_N_est_w1 ///
age_dad_O_est_w1 age_dad_P_est_w1 age_dad_Q_est_w1 age_dad_R_est_w1 age_dad_S_est_w1 age_dad_T_est_w1)	
	
	
	
replace age_dad_w1 = . if age_dad_w1 > 500	
replace age_dad_w1 = 0 if no_dad_w1 == 1


********* gen dad's age w1 *********







egen num_bro_w1 = anycount(H1HR3A H1HR3B H1HR3C H1HR3D H1HR3E H1HR3F H1HR3G H1HR3H H1HR3I H1HR3J H1HR3K H1HR3L H1HR3M H1HR3N H1HR3O H1HR3P H1HR3Q H1HR3R H1HR3S H1HR3T)  , values(5)


replace num_bro_w1 = . if (num_96_w1 != 0 | num_98_w1 !=0 | num_99_w1 !=0)

* lazy to distinguish different type of brothers
* since there are more than 1 brother at home, so the format is a little bit different from mom/dad


/*

foreach alpha in A B C D E F G H I J K L M N O P Q R S T {
	gen age_bro`alpha'_w1 = .
	gen dummy_bro`alpha'_lived_tgt_w1 = .
	gen years_bro`alpha'_living_tgt_w1 = .
    gen months_bro`alpha'_living_tgt_w1 = .

	replace age_bro`alpha'_w1 = H1HR7`alpha' if H1HR3`alpha' == 5 
	replace dummy_bro`alpha'_lived_tgt_w1 = H1HR9`alpha' if H1HR3`alpha' == 5
	replace years_bro`alpha'_living_tgt_w1 = H1HR10`alpha' if H1HR3`alpha' == 5 & H1HR10`alpha' != 0
	replace months_bro`alpha'_living_tgt_w1 = years_bro`alpha'_living_tgt_w1*12 + H1HR11`alpha' if H1HR3`alpha' == 5 
	
	replace age_bro`alpha'_w1 = H1HR8`alpha' if H1HR3`alpha' == 5 & H1HR8`alpha' !=.
}

*/

* gen brother age



****************
foreach alpha in A B C D E F G H I J K L M N O P Q R S T {
	gen age_bro_`alpha'_w1 = .

	replace age_bro_`alpha'_w1 = H1HR7`alpha' if H1HR3`alpha' == 5  

}



egen youngest_bro_age_w1 = rowmin(age_bro_A_w1 age_bro_B_w1 age_bro_C_w1 age_bro_D_w1 age_bro_E_w1 age_bro_F_w1 age_bro_G_w1 age_bro_H_w1 age_bro_I_w1 age_bro_J_w1 age_bro_K_w1 age_bro_L_w1 age_bro_M_w1 age_bro_N_w1 age_bro_O_w1 age_bro_P_w1 age_bro_Q_w1 age_bro_R_w1 age_bro_S_w1 age_bro_T_w1)  
 
 * drop those 998

replace youngest_bro_age_w1 = . if youngest_bro_age_w1 > 990

****************





egen num_sis_w1 = anycount(H1HR3A H1HR3B H1HR3C H1HR3D H1HR3E H1HR3F H1HR3G H1HR3H H1HR3I H1HR3J H1HR3K H1HR3L H1HR3M H1HR3N H1HR3O H1HR3P H1HR3Q H1HR3R H1HR3S H1HR3T), values(8)


replace num_sis_w1 = . if (num_96_w1 != 0 | num_98_w1 !=0 | num_99_w1 !=0)


* lazy to distinguish different type of sisters
* since there are more than 1 sister at home, so the format is a little bit different from mom/dad



/* 
foreach alpha in A B C D E F G H I J K L M N O P Q R S T {
	gen age_sis`alpha'_w1 = .
	gen dummy_sis`alpha'_lived_tgt_w1 = .
	gen years_sis`alpha'_living_tgt_w1 = .
    gen months_sis`alpha'_living_tgt_w1 = .

	replace age_sis`alpha'_w1 = H1HR7`alpha' if H1HR3`alpha' == 8 
	replace dummy_sis`alpha'_lived_tgt_w1 = H1HR9`alpha' if H1HR3`alpha' == 8
	replace years_sis`alpha'_living_tgt_w1 = H1HR10`alpha' if H1HR3`alpha' == 8 & H1HR10`alpha' != 0
	replace months_sis`alpha'_living_tgt_w1 = years_sis`alpha'_living_tgt_w1*12 + H1HR11`alpha' if H1HR3`alpha' == 8

	replace age_sis`alpha'_w1 = H1HR8`alpha' if H1HR3`alpha' == 8 & H1HR8`alpha' !=.
}




*/

* gem sister age 
****************
foreach alpha in A B C D E F G H I J K L M N O P Q R S T {
	gen age_sis_`alpha'_w1 = .

	replace age_sis_`alpha'_w1 = H1HR7`alpha' if H1HR3`alpha' == 8  

}


egen youngest_sis_age_w1 = rowmin(age_sis_A_w1 age_sis_B_w1 age_sis_C_w1 age_sis_D_w1 age_sis_E_w1 age_sis_F_w1 age_sis_G_w1 age_sis_H_w1 age_sis_I_w1 age_sis_J_w1 age_sis_K_w1 age_sis_L_w1 age_sis_M_w1 age_sis_N_w1 age_sis_O_w1 age_sis_P_w1 age_sis_Q_w1 age_sis_R_w1 age_sis_S_w1 age_sis_T_w1)  
 
 * drop those 998

replace youngest_sis_age_w1 = . if youngest_sis_age_w1 > 990

****************




egen youngest_sib_age_w1  = rowmin(youngest_sis_age_w1 youngest_bro_age_w1)

gen age_diff_sib_w1 = age_w1 - youngest_sib_age_w1


replace youngest_sib_age_w1 = . if age_diff_sib_w1 <= 0 





















egen num_household_mem_w1 = rownonmiss(H1HR2A H1HR2B H1HR2C H1HR2D H1HR2E H1HR2F H1HR2G H1HR2H H1HR2I H1HR2J H1HR2K H1HR2L H1HR2M H1HR2N H1HR2O H1HR2P H1HR2Q H1HR2R H1HR2S H1HR2T) if IMONTH !=. | IDAY !=. | IYEAR !=.
egen num_household_mem_w2 = rownonmiss(H2HR2A H2HR2B H2HR2C H2HR2D H2HR2E H2HR2F H2HR2G H2HR2H H2HR2I H2HR2J H2HR2K H2HR2L H2HR2M H2HR2N H2HR2O H2HR2P H2HR2Q) if IMONTH2 !=. | IDAY2 !=. | IYEAR2 !=. 



gen num_siblings_w1 = num_bro_w1 + num_sis_w1











*********** wave 2!!********


* gen number of siblings wave 2


egen num_96_w2 = anycount(H2HR4A H2HR4B H2HR4C H2HR4D H2HR4E H2HR4F H2HR4G H2HR4H H2HR4I H2HR4J H2HR4K H2HR4L H2HR4M H2HR4N H2HR4O H2HR4P H2HR4Q), values(96)
egen num_98_w2 = anycount(H2HR4A H2HR4B H2HR4C H2HR4D H2HR4E H2HR4F H2HR4G H2HR4H H2HR4I H2HR4J H2HR4K H2HR4L H2HR4M H2HR4N H2HR4O H2HR4P H2HR4Q), values(98)
egen num_99_w2 = anycount(H2HR4A H2HR4B H2HR4C H2HR4D H2HR4E H2HR4F H2HR4G H2HR4H H2HR4I H2HR4J H2HR4K H2HR4L H2HR4M H2HR4N H2HR4O H2HR4P H2HR4Q), values(99)










********* gen mom's age w2 *********

foreach alpha in A B C D E F G H I J K L M N O P Q {
	gen age_mom_`alpha'_w2 = .
	gen age_mom_`alpha'_est_w2 = .

	replace age_mom_`alpha'_w2 = H2HR8`alpha' if H2HR4`alpha' == 14  & H2HR8`alpha' < 990
	replace age_mom_`alpha'_est_w2 = H2HR9`alpha' if H2HR4`alpha' == 14  & H2HR9`alpha' <= 990

}

egen age_mom_w2 = rowmean( age_mom_A_w2 age_mom_B_w2 age_mom_C_w2 age_mom_D_w2 age_mom_E_w2 age_mom_F_w2 age_mom_G_w2 age_mom_H_w2 age_mom_I_w2 age_mom_J_w2 age_mom_K_w2 age_mom_L_w2 age_mom_M_w2 age_mom_N_w2 ///
age_mom_O_w2 age_mom_P_w2 age_mom_Q_w2  ///
age_mom_A_est_w2 age_mom_B_est_w2 age_mom_C_est_w2 age_mom_D_est_w2 age_mom_E_est_w2 age_mom_F_est_w2 age_mom_G_est_w2 age_mom_H_est_w2 age_mom_I_est_w2 age_mom_J_est_w2 age_mom_K_est_w2 age_mom_L_est_w2 age_mom_M_est_w2 age_mom_N_est_w2 ///
age_mom_O_est_w2 age_mom_P_est_w2 age_mom_Q_est_w2)



replace age_mom_w2 = . if age_mom_w2 > 990
replace age_mom_w2 = 0 if no_mom_w2 == 1


********* gen mom's age w2 *********








********* gen dad's age w2 *********

foreach alpha in A B C D E F G H I J K L M N O P Q {	
	gen age_dad_`alpha'_w2 = .
	gen age_dad_`alpha'_est_w2 = .

	replace age_dad_`alpha'_w2 = H2HR8`alpha' if H2HR4`alpha' == 11  & H2HR8`alpha' < 990
	replace age_dad_`alpha'_est_w2 = H2HR9`alpha' if H2HR4`alpha' == 11  & H2HR9`alpha' <= 990
	
}	
	
egen age_dad_w2 = rowmean( age_dad_A_w2 age_dad_B_w2 age_dad_C_w2 age_dad_D_w2 age_dad_E_w2 age_dad_F_w2 age_dad_G_w2 age_dad_H_w2 age_dad_I_w2 age_dad_J_w2 age_dad_K_w2 age_dad_L_w2 age_dad_M_w2 age_dad_N_w2 ///	
age_dad_O_w2 age_dad_P_w2 age_dad_Q_w2  ///
age_dad_A_est_w2 age_dad_B_est_w2 age_dad_C_est_w2 age_dad_D_est_w2 age_dad_E_est_w2 age_dad_F_est_w2 age_dad_G_est_w2 age_dad_H_est_w2 age_dad_I_est_w2 age_dad_J_est_w2 age_dad_K_est_w2 age_dad_L_est_w2 age_dad_M_est_w2 age_dad_N_est_w2 ///
age_dad_O_est_w2 age_dad_P_est_w2 age_dad_Q_est_w2)	
	
	
	
replace age_dad_w2 = . if age_dad_w2 > 990	
replace age_dad_w2 = 0 if no_dad_w2 == 1



********* gen dad's age w2 *********







egen num_bro_w2 = anycount(H2HR4A H2HR4B H2HR4C H2HR4D H2HR4E H2HR4F H2HR4G H2HR4H H2HR4I H2HR4J H2HR4K H2HR4L H2HR4M H2HR4N H2HR4O H2HR4P H2HR4Q)  , values(5)
egen num_sis_w2 = anycount(H2HR4A H2HR4B H2HR4C H2HR4D H2HR4E H2HR4F H2HR4G H2HR4H H2HR4I H2HR4J H2HR4K H2HR4L H2HR4M H2HR4N H2HR4O H2HR4P H2HR4Q)  , values(8)


replace num_bro_w2 = . if (num_96_w2 != 0 | num_98_w2 !=0 | num_99_w2 !=0)
replace num_sis_w2 = . if (num_96_w2 != 0 | num_98_w2 !=0 | num_99_w2 !=0)





gen num_siblings_w2 = num_bro_w2 + num_sis_w2









* gen age of siblings wave 2
	
foreach alpha in A B C D E F G H I J K L M N O P Q {	
	gen age_bro_`alpha'_w2 = .
	
	replace age_bro_`alpha'_w2 = H2HR8`alpha' if H2HR4`alpha' == 5  
	
}	
	
	
	
egen youngest_bro_age_w2 = rowmin(age_bro_A_w2 age_bro_B_w2 age_bro_C_w2 age_bro_D_w2 age_bro_E_w2 age_bro_F_w2 age_bro_G_w2 age_bro_H_w2 age_bro_I_w2 age_bro_J_w2 age_bro_K_w2 age_bro_L_w2 age_bro_M_w2 age_bro_N_w2 age_bro_O_w2 age_bro_P_w2 age_bro_Q_w2)  	
 	
 * drop those 998	
	
replace youngest_bro_age_w2 = . if youngest_bro_age_w2 > 990	
	
	
	
	
	
	
foreach alpha in A B C D E F G H I J K L M N O P Q {	
	gen age_sis_`alpha'_w2 = .
	
	replace age_sis_`alpha'_w2 = H2HR8`alpha' if H2HR4`alpha' == 8  
	
}	
	
	
egen youngest_sis_age_w2 = rowmin(age_sis_A_w2 age_sis_B_w2 age_sis_C_w2 age_sis_D_w2 age_sis_E_w2 age_sis_F_w2 age_sis_G_w2 age_sis_H_w2 age_sis_I_w2 age_sis_J_w2 age_sis_K_w2 age_sis_L_w2 age_sis_M_w2 age_sis_N_w2 age_sis_O_w2 age_sis_P_w2 age_sis_Q_w2)  	
 	
 * drop those 998	
	
replace youngest_sis_age_w2 = . if youngest_sis_age_w2 > 990	
	
	
	
	
	
	
egen youngest_sib_age_w2  = rowmin(youngest_sis_age_w2 youngest_bro_age_w2)	
	
gen age_diff_sib_w2 = age_w2 - youngest_sib_age_w2	
	

replace youngest_sib_age_w2 = . if age_diff_sib_w2 <= 0 


































* section 12 w1, w2
rename H1NM7 ever_live_with_bio_mom_w1
rename H1NM10 bio_mom_stayed_overnight_w1
rename H1NM11 bio_mom_contact_freq_w1
rename H1NM12A shopping_with_bio_mom_w1
rename H1NM12B play_sport_with_bio_mom_w1
rename H1NM12C reglious_act_with_bio_mom_w1
rename H1NM12D talk_about_date_with_bio_mom_w1
rename H1NM12E movie_with_bio_mom_w1
rename H1NM12F personal_problem_with_bio_mom_w1
rename H1NM12G serious_argument_with_bio_mom_w1
rename H1NM12H school_work_with_bio_mom_w1
rename H1NM12I school_project_with_bio_mom_w1
rename H1NM12J school_others_bio_mom_w1
rename H1NM13 bio_mom_smoked_w1
rename H1NM14 relationship_with_bio_mom_w1



rename H2NM2 ever_live_with_bio_mom_w2
rename H2NM9 bio_mom_stayed_overnight_w2
rename H2NM10 bio_mom_contact_freq_w2
rename H2NM11A shopping_with_bio_mom_w2
rename H2NM11B play_sport_with_bio_mom_w2
rename H2NM11C reglious_act_with_bio_mom_w2
rename H2NM11D talk_about_date_with_bio_mom_w2
rename H2NM11E movie_with_bio_mom_w2
rename H2NM11F personal_problem_with_bio_mom_w2
rename H2NM11G serious_argument_with_bio_mom_w2
rename H2NM11H school_work_with_bio_mom_w2
rename H2NM11I school_project_with_bio_mom_w2
rename H2NM11J school_others_bio_mom_w2
rename H2NM12 bio_mom_smoked_w2
rename H2NM13 relationship_with_bio_mom_w2





* section 13  w1, w2
rename H1NF7 ever_live_with_bio_dad_w1
rename H1NF10 bio_dad_stayed_overnight_w1
rename H1NF11 bio_dad_contact_freq_w1
rename H1NF12A shopping_with_bio_dad_w1
rename H1NF12B play_sport_with_bio_dad_w1
rename H1NF12C reglious_act_with_bio_dad_w1
rename H1NF12D talk_about_date_with_bio_dad_w1
rename H1NF12E movie_with_bio_dad_w1
rename H1NF12F personal_problem_with_bio_dad_w1
rename H1NF12G serious_argument_with_bio_dad_w1
rename H1NF12H school_work_with_bio_dad_w1
rename H1NF12I school_project_with_bio_dad_w1
rename H1NF12J school_others_bio_dad_w1
rename H1NF13 bio_dad_smoked_w1
rename H1NF14 relationship_with_bio_dad_w1



rename H2NF2 ever_live_with_bio_dad_w2
rename H2NF9 bio_dad_stayed_overnight_w2
rename H2NF10 bio_dad_contact_freq_w2
rename H2NF11A shopping_with_bio_dad_w2
rename H2NF11B play_sport_with_bio_dad_w2
rename H2NF11C reglious_act_with_bio_dad_w2
rename H2NF11D talk_about_date_with_bio_dad_w2
rename H2NF11E movie_with_bio_dad_w2
rename H2NF11F personal_problem_with_bio_dad_w2
rename H2NF11G serious_argument_with_bio_dad_w2
rename H2NF11H school_work_with_bio_dad_w2
rename H2NF11I school_project_with_bio_dad_w2
rename H2NF11J school_others_bio_dad_w2
rename H2NF12 bio_dad_smoked_w2
rename H2NF13 relationship_with_bio_dad_w2






* section 14 w1, w2


* checked the imputation of no mom using tab...should be 370 changes

* check 1
gen mom_edu_impute_indicator_w1 = 1 if no_mom_w1 == 1 
replace mom_edu_impute_indicator_w1 = 0 if H1RM1 != .


rename H1RM1 res_mom_educ_w1
replace res_mom_educ_w1 = 99 if no_mom_w1 == 1
tab res_mom_educ_w1 

rename H1RM2 res_mom_born_US_w1
replace res_mom_born_US_w1 = 99 if no_mom_w1 == 1
tab res_mom_born_US_w1 



rename H1RM3 res_mom_born_country_w1
replace res_mom_born_country_w1 = 99 if no_mom_w1 == 1
tab res_mom_born_country_w1 



rename H1RM4 res_mom_occupation_w1
replace res_mom_occupation_w1 = 99 if no_mom_w1 == 1
tab res_mom_occupation_w1



rename H1RM5 res_mom_pay_w1
replace res_mom_pay_w1 = 99 if no_mom_w1 == 1
tab res_mom_pay_w1


rename H1RM6 res_mom_has_worked_for_pay_w1
replace res_mom_has_worked_for_pay_w1 = 99 if no_mom_w1 == 1
tab res_mom_has_worked_for_pay_w1



gen mwh_impute_indicator_w1 = 1 if no_mom_w1 == 1 | res_mom_pay_w1 == 0  | res_mom_occupation_w1 == 16
replace mwh_impute_indicator_w1 = 0 if H1RM7 != .
* check 1
rename H1RM7 res_mom_work_hours_w1   // continuous variable
replace res_mom_work_hours_w1 = 0 if no_mom_w1 == 1
sum res_mom_work_hours_w1 





rename H1RM8 res_mom_at_home_or_outside_w1

gen mom_stay_home_out_w1 = .
replace mom_stay_home_out_w1 = 1 if res_mom_at_home_or_outside_w1 == 1 | res_mom_pay_w1 == 0 | res_mom_occupation_w1 == 16
replace mom_stay_home_out_w1 = 2 if res_mom_at_home_or_outside_w1 == 2
replace mom_stay_home_out_w1 = 3 if res_mom_at_home_or_outside_w1 == 3


gen mom_stay_home_out_v2_w1 = .
replace mom_stay_home_out_v2_w1 = 99 if no_mom_w1 == 1
replace mom_stay_home_out_v2_w1 = 0 if res_mom_occupation_w1 == 16 
replace mom_stay_home_out_v2_w1 = 1 if res_mom_at_home_or_outside_w1 == 1  
replace mom_stay_home_out_v2_w1 = 2 if res_mom_at_home_or_outside_w1 == 2
replace mom_stay_home_out_v2_w1 = 3 if res_mom_at_home_or_outside_w1 == 3
replace mom_stay_home_out_v2_w1 = 4 if res_mom_pay_w1 == 0


 

rename H1RM9 res_mom_public_assistance_w1
replace res_mom_public_assistance_w1 = 99 if no_mom_w1 == 1
tab res_mom_public_assistance_w1


rename H1RM10 res_mom_handicapped_w1
replace res_mom_handicapped_w1 = 99 if no_mom_w1 == 1
tab res_mom_handicapped_w1

rename H1RM11 res_mom_at_home_leave_school_w1
replace res_mom_at_home_leave_school_w1 = 99 if no_mom_w1 == 1
tab res_mom_at_home_leave_school_w1

rename H1RM12 res_mom_at_home_return_school_w1
replace res_mom_at_home_return_school_w1 = 99 if no_mom_w1 == 1
tab res_mom_at_home_return_school_w1

rename H1RM13 res_mom_at_home_go_to_bed_w1
replace res_mom_at_home_go_to_bed_w1 = 99 if no_mom_w1 == 1
tab res_mom_at_home_go_to_bed_w1

rename H1RM14 res_mom_smoked_w1
replace res_mom_smoked_w1 = 99 if no_mom_w1 == 1
tab res_mom_smoked_w1





* not yet cleaned!!!!!!
* check 1
gen mom_edu_impute_indicator_w2 = 1 if no_mom_w2 == 1 | (res_mom_educ_w1 != .  & no_mom_w2 !=. & res_mom_educ_w1 ! = 99 & H2RM1 == .)
replace mom_edu_impute_indicator_w2 = 0 if H2RM1 != .


rename H2RM1 res_mom_educ_w2
replace res_mom_educ_w2 = 99 if no_mom_w2 == 1
replace res_mom_educ_w2 = res_mom_educ_w1 if (res_mom_educ_w2 == . & no_mom_w2 !=. & res_mom_educ_w1 ! = 99)

rename H2RM2 res_mom_born_US_w2
rename H2RM3 res_mom_born_country_w2


rename H2RM4 res_mom_occupation_w2
replace res_mom_occupation_w2 = 99 if no_mom_w2 == 1



rename H2RM5 res_mom_pay_w2
replace res_mom_pay_w2 = 99 if no_mom_w2 == 1
tab res_mom_pay_w2

rename H2RM6 res_mom_has_worked_for_pay_w2

* check 1
gen mwh_impute_indicator_w2 = 1 if no_mom_w2 == 1 | res_mom_pay_w2 == 0  | res_mom_occupation_w2 == 16
replace mwh_impute_indicator_w2 = 0 if H2RM7 != . 


rename H2RM7 res_mom_work_hours_w2
replace res_mom_work_hours_w2 = 0 if no_mom_w2 == 1
sum res_mom_work_hours_w2 


rename H2RM8 res_mom_at_home_or_outside_w2

gen mom_stay_home_out_w2 = .
replace mom_stay_home_out_w2 = 1 if res_mom_at_home_or_outside_w2 == 1 | res_mom_pay_w2 == 0 | res_mom_occupation_w2 == 16
replace mom_stay_home_out_w2 = 2 if res_mom_at_home_or_outside_w2 == 2
replace mom_stay_home_out_w2 = 3 if res_mom_at_home_or_outside_w2 == 3



gen mom_stay_home_out_v2_w2 = .
replace mom_stay_home_out_v2_w2 = 99 if no_mom_w2 == 1
replace mom_stay_home_out_v2_w2 = 0 if res_mom_occupation_w2 == 16 
replace mom_stay_home_out_v2_w2 = 1 if res_mom_at_home_or_outside_w2 == 1  
replace mom_stay_home_out_v2_w2 = 2 if res_mom_at_home_or_outside_w2 == 2
replace mom_stay_home_out_v2_w2 = 3 if res_mom_at_home_or_outside_w2 == 3
replace mom_stay_home_out_v2_w2 = 4 if res_mom_pay_w2 == 0



 
rename H2RM9 res_mom_public_assistance_w2
rename H2RM10 res_mom_handicapped_w2

rename H2RM11 res_mom_at_home_leave_school_w2
replace res_mom_at_home_leave_school_w2 = 99 if no_mom_w2 == 1
tab res_mom_at_home_leave_school_w2


rename H2RM12 res_mom_at_home_return_school_w2
replace res_mom_at_home_return_school_w2 = 99 if no_mom_w2 == 1
tab res_mom_at_home_return_school_w2

rename H2RM13 res_mom_at_home_go_to_bed_w2
replace res_mom_at_home_go_to_bed_w2 = 99 if no_mom_w2 == 1
tab res_mom_at_home_go_to_bed_w2




rename H2RM14 res_mom_smoked_w2






* section 15 w1, w2
* checked the imputation of no dad using tab...should be 1952 changes
* check 1
gen dad_edu_impute_indicator_w1 = 1 if no_dad_w1 == 1 
replace dad_edu_impute_indicator_w1 = 0 if H1RF1 != .


rename H1RF1 res_dad_educ_w1
replace res_dad_educ_w1 = 99 if no_dad_w1 == 1
tab res_dad_educ_w1 

rename H1RF2 res_dad_born_US_w1
replace res_dad_born_US_w1 = 99 if no_dad_w1 == 1
tab res_dad_born_US_w1 



rename H1RF3 res_dad_born_country_w1
replace res_dad_born_country_w1 = 99 if no_dad_w1 == 1
tab res_dad_born_country_w1 


rename H1RF4 res_dad_occupation_w1
replace res_dad_occupation_w1 = 99 if no_dad_w1 == 1
tab res_dad_occupation_w1 



rename H1RF5 res_dad_pay_w1
replace res_dad_pay_w1 = 99 if no_dad_w1 == 1
tab res_dad_pay_w1 



rename H1RF6 res_dad_has_worked_for_pay_w1
replace res_dad_has_worked_for_pay_w1 = 99 if no_dad_w1 == 1
tab res_dad_has_worked_for_pay_w1


* check 1 
gen dwh_impute_indicator_w1 = 1 if no_dad_w1 == 1 | res_dad_pay_w1 == 0  | res_dad_occupation_w1 == 16
replace dwh_impute_indicator_w1 = 0 if  H1RF7 != .




rename H1RF7 res_dad_work_hours_w1  // continuous variable
replace res_dad_work_hours_w1 = 0 if no_dad_w1 == 1
sum res_dad_work_hours_w1 


rename H1RF8 res_dad_at_home_or_outside_w1

gen dad_stay_home_out_w1 = .
replace dad_stay_home_out_w1 = 1 if res_dad_at_home_or_outside_w1 == 1 | res_dad_pay_w1 == 0 | res_dad_occupation_w1 == 16
replace dad_stay_home_out_w1 = 2 if res_dad_at_home_or_outside_w1 == 2
replace dad_stay_home_out_w1 = 3 if res_dad_at_home_or_outside_w1 == 3



gen dad_stay_home_out_v2_w1 = .
replace dad_stay_home_out_v2_w1 = 99 if no_dad_w1 == 1
replace dad_stay_home_out_v2_w1 = 0 if res_dad_occupation_w1 == 16 
replace dad_stay_home_out_v2_w1 = 1 if res_dad_at_home_or_outside_w1 == 1  
replace dad_stay_home_out_v2_w1 = 2 if res_dad_at_home_or_outside_w1 == 2
replace dad_stay_home_out_v2_w1 = 3 if res_dad_at_home_or_outside_w1 == 3
replace dad_stay_home_out_v2_w1 = 4 if res_dad_pay_w1 == 0



rename H1RF9 res_dad_public_assistance_w1
replace res_dad_has_worked_for_pay_w1 = 99 if no_dad_w1 == 1
tab res_dad_has_worked_for_pay_w1



rename H1RF10 res_dad_handicapped_w1
replace res_dad_handicapped_w1 = 99 if no_dad_w1 == 1
tab res_dad_handicapped_w1

rename H1RF11 res_dad_at_home_leave_school_w1
replace res_dad_at_home_leave_school_w1 = 99 if no_dad_w1 == 1
tab res_dad_at_home_leave_school_w1

rename H1RF12 res_dad_at_home_return_school_w1
replace res_dad_at_home_return_school_w1 = 99 if no_dad_w1 == 1
tab res_dad_at_home_return_school_w1

rename H1RF13 res_dad_at_home_go_to_bed_w1
replace res_dad_at_home_go_to_bed_w1 = 99 if no_dad_w1 == 1
tab res_dad_at_home_go_to_bed_w1

rename H1RF14 res_dad_smoked_w1
replace res_dad_smoked_w1 = 99 if no_dad_w1 == 1
tab res_dad_smoked_w1















* not yet cleaned!!!!!
* check 1
gen dad_edu_impute_indicator_w2 = 1 if no_dad_w2 == 1 | (res_dad_educ_w1 != . & H2RF1 == .)
replace dad_edu_impute_indicator_w2 = 0 if H2RF1 != .


rename H2RF1 res_dad_educ_w2
replace res_dad_educ_w2 = 99 if no_dad_w2 == 1
replace res_dad_educ_w2 = res_dad_educ_w1 if res_dad_educ_w2 == . 


rename H2RF2 res_dad_born_US_w2
rename H2RF3 res_dad_born_country_w2

rename H2RF4 res_dad_occupation_w2
replace res_dad_occupation_w2 = 99 if no_dad_w2 == 1



rename H2RF5 res_dad_pay_w2
replace res_dad_pay_w2 = 99 if no_dad_w2 == 1


rename H2RF6 res_dad_has_worked_for_pay_w2



* check 1
gen dwh_impute_indicator_w2 = 1 if no_dad_w2 == 1 | res_dad_pay_w2 == 0  | res_dad_occupation_w2 == 16
replace dwh_impute_indicator_w2 = 0 if  H2RF7 != .



rename H2RF7 res_dad_work_hours_w2
replace res_dad_work_hours_w2 = 0 if no_dad_w2 == 1
sum res_dad_work_hours_w2 


rename H2RF8 res_dad_at_home_or_outside_w2

gen dad_stay_home_out_w2 = .
replace dad_stay_home_out_w2 = 1 if res_dad_at_home_or_outside_w2 == 1 | res_dad_pay_w2 == 0 | res_dad_occupation_w2 == 16
replace dad_stay_home_out_w2 = 2 if res_dad_at_home_or_outside_w2 == 2
replace dad_stay_home_out_w2 = 3 if res_dad_at_home_or_outside_w2 == 3

rename H2RF9 res_dad_public_assistance_w2
rename H2RF10 res_dad_handicapped_w2

rename H2RF11 res_dad_at_home_leave_school_w2
replace res_dad_at_home_leave_school_w2 = 99 if no_dad_w2 == 1
tab res_dad_at_home_leave_school_w2



rename H2RF12 res_dad_at_home_return_school_w2
replace res_dad_at_home_return_school_w2 = 99 if no_dad_w2 == 1
tab res_dad_at_home_return_school_w2




rename H2RF13 res_dad_at_home_go_to_bed_w2
replace res_dad_at_home_go_to_bed_w2 = 99 if no_dad_w2 == 1
tab res_dad_at_home_go_to_bed_w2

rename H2RF14 res_dad_smoked_w2
	   	   

		   

		   
* section 16 w1, w2 ***** key!!!!!
rename H1WP1 decide_time_at_home_weekend_w1
rename H1WP2 decide_hang_around_with_w1
rename H1WP3 decide_what_u_wear_w1
rename H1WP4 decide_how_much_tv_w1
rename H1WP5 decide_what_tv_programs_w1
rename H1WP6 decide_what_time_go_bed_w1
rename H1WP7 decide_what_you_eat_w1
rename H1WP8 parent_present_when_eat_w1
rename H1WP9 feel_close_to_mom_w1
rename H1WP10 mom_care_about_u_w1
rename H1WP11 mom_disappoint_college_w1
rename H1WP12 mom_disappoint_hs_w1
rename H1WP13 feel_close_to_dad_w1
rename H1WP14 dad_care_about_u_w1
rename H1WP15 dad_disappoint_college_w1
rename H1WP16 dad_disappoint_hs_w1
rename H1WP17A shopping_with_mom_w1
rename H1WP17B play_sport_with_mom_w1
rename H1WP17C reglious_act_with_mom_w1
rename H1WP17D talk_about_date_with_mom_w1
rename H1WP17E movie_with_mom_w1
rename H1WP17F personal_problem_with_mom_w1
rename H1WP17G serious_argument_with_mom_w1
rename H1WP17H school_work_with_mom_w1
rename H1WP17I school_project_with_mom_w1
rename H1WP17J school_others_mom_w1
rename H1WP17K none_mom_w1
rename H1WP18A shopping_with_dad_w1
rename H1WP18B play_sport_with_dad_w1
rename H1WP18C reglious_act_with_dad_w1
rename H1WP18D talk_about_date_with_dad_w1
rename H1WP18E movie_with_dad_w1
rename H1WP18F personal_problem_with_dad_w1
rename H1WP18G serious_argument_with_dad_w1
rename H1WP18H school_work_with_dad_w1
rename H1WP18I school_project_with_dad_w1
rename H1WP18J school_others_dad_w1
rename H1WP18K none_dad_w1



rename H2WP1 decide_time_at_home_weekend_w2
rename H2WP2 decide_hang_around_with_w2
rename H2WP3 decide_what_u_wear_w2
rename H2WP4 decide_how_much_tv_w2
rename H2WP5 decide_what_tv_programs_w2
rename H2WP6 decide_what_time_go_bed_w2
rename H2WP7 decide_what_you_eat_w2
rename H2WP8 parent_present_when_eat_w2
rename H2WP9 feel_close_to_mom_w2
rename H2WP10 mom_care_about_u_w2
rename H2WP11 mom_disappoint_college_w2
rename H2WP12 mom_disappoint_hs_w2
rename H2WP13 feel_close_to_dad_w2
rename H2WP14 dad_care_about_u_w2
rename H2WP15 dad_disappoint_college_w2
rename H2WP16 dad_disappoint_hs_w2
rename H2WP17A shopping_with_mom_w2
rename H2WP17B play_sport_with_mom_w2
rename H2WP17C reglious_act_with_mom_w2
rename H2WP17D talk_about_date_with_mom_w2
rename H2WP17E movie_with_mom_w2
rename H2WP17F personal_problem_with_mom_w2
rename H2WP17G serious_argument_with_mom_w2
rename H2WP17H school_work_with_mom_w2
rename H2WP17I school_project_with_mom_w2
rename H2WP17J school_others_mom_w2
rename H2WP17K none_mom_w2
rename H2WP18A shopping_with_dad_w2
rename H2WP18B play_sport_with_dad_w2
rename H2WP18C reglious_act_with_dad_w2
rename H2WP18D talk_about_date_with_dad_w2
rename H2WP18E movie_with_dad_w2
rename H2WP18F personal_problem_with_dad_w2
rename H2WP18G serious_argument_with_dad_w2
rename H2WP18H school_work_with_dad_w2
rename H2WP18I school_project_with_dad_w2
rename H2WP18J school_others_dad_w2
rename H2WP18K none_dad_w2


/*

forvalues i = 1(1)16 {
	tab H1WP`i'
	tab H2WP`i'		   
}		   

forvalues i = 17(1)18 {
	foreach alpha in A B C D E F G H I J K {
		tab H1WP`i'`alpha'
		tab H2WP`i'`alpha'	
	}
}		   


*/



* section 17 w1 is skipped since it is not useful to know about risky sexual behaviors  

		   
* section 18 w1, w2 
rename H1PF1 mom_warm_and_loving_w1                // might be important 
rename H1PF2 mom_encourage_indep_w1                // might be important
rename H1PF3 mom_talk_wrongdoings_w1               // might be important
rename H1PF4 satisfoed_with_mom_comm_w1            // might be important
rename H1PF5 satisfoed_with_mom_relation_w1        // might be important
rename H1PF23 dad_warm_and_loving_w1                // might be important 
rename H1PF24 satisfied_with_dad_comm_w1                // might be important
rename H1PF25 satisfied_with_dad_relation_w1        // might be important

		   
		   
rename H2PF1 mom_warm_and_loving_w2                // might be important 
rename H2PF2 mom_encourage_indep_w2                // might be important
rename H2PF3 mom_talk_wrongdoings_w2               // might be important
rename H2PF4 satisfied_with_mom_comm_w2            // might be important
rename H2PF5 satisfied_with_mom_relation_w2        // might be important		   
rename H2PF8 dad_warm_and_loving_w2                // might be important 
rename H2PF9 satisfied_with_dad_comm_w2            // might be important
rename H2PF10 satisfied_with_dad_relation_w2        // might be important			   


/*
forvalues i = 1(1)5 {
	tab H1PF`i'
	tab H2PF`i'		   
}		   
*/	
	
* section 19 w1 is skipped since it is not useful to know about risky sexual behaviors  

		   
		   
* section 20 w1, w2 

* can be important....be skip this part first









* section 21 w1 (cant find in w1) : not important



* section 22 w1, section 21 w2
rename H1RR1 had_relationship_w1

rename H2RR1 had_relationship_w2



* section 23 w1, section 22 w2      (can be y variables)
forvalues i = 1(1)2 {

	rename H`i'LR1 hold_hands_w`i'
	rename H`i'LR2 kiss_someone_w`i'
	rename H`i'LR3 tell_love_w`i'
	rename H`i'LR4 do_all_to_same_person_w`i'

}







* section 24 w1, section 23 w2      (can be y variables)
rename H1CO1 ever_had_sex_w1


rename H2CO2 ever_had_sex_w2
		   
		   
		   
* section 25 w1, section 24 w2  (control)  (skipped the detail first)

		   
egen num_partner_w1 = rownonmiss(H1RI1Y_1 H1RI1Y_2 H1RI1Y_3) if IMONTH !=. | IDAY !=. | IYEAR !=.
egen num_partner_w2 = rownonmiss(H2RI1Y_1 H2RI1Y_2 H2RI1Y_3) if IMONTH2 !=. | IDAY2 !=. | IYEAR2 !=. 




		   
		   
		   
		   
		   
* section 26 w1, section 25 w2  (control)
		   
rename H1NR7 num_sexual_relationship_w1
rename H1NR8 num_sexual_relationship_v2_w1



 
rename H2NR8 num_sexual_relationship_w2
rename H2NR9 num_sexual_relationship_v2_w2

		   
		   
		   
		   
* section 27 w1, section 26 w2 (control)
rename H1BC1 birth_control_hazzle_w1		   
rename H1BC2 birth_control_expensive_w1		   
rename H1BC3 birth_control_plan_trouble_w1		   
		   
		   
		   

		   
rename H2BC1 birth_control_hazzle_w2		   
rename H2BC2 birth_control_expensive_w2	   
rename H2BC3 birth_control_plan_trouble_w2		   
 
		   
		   
		   

* section 28 w1, section 27 w2 (y variable)   (add if need)
rename H1TO1 tried_cigarette_w1
rename H1TO3 regular_cigarette_w1
replace regular_cigarette_w1 = 0 if H1TO2 == 0 | tried_cigarette_w1 == 0 

rename H1TO5 how_many_days_smoke_w1
replace how_many_days_smoke_w1 = 0 if H1TO2 == 0 | tried_cigarette_w1 == 0 



rename H1TO7 how_many_cigarettes_w1
replace how_many_cigarettes_w1 = 0 if H1TO2 == 0 | tried_cigarette_w1 == 0 | how_many_days_smoke_w1 == 0


gen total_smoke_a_month_w1 = how_many_days_smoke_w1*how_many_cigarettes_w1









rename H1TO9 smoke_frds_w1


rename H1TO12 ever_drink_alcohol_w1
rename H1TO13 drink_when_parents_not_home_w1            
replace drink_when_parents_not_home_w1 = 0 if ever_drink_alcohol_w1 == 0 
rename H1TO14 drink_age_w1
rename H1TO15 drink_days_w1
replace drink_days_w1 = 7 if ever_drink_alcohol_w1 == 0     

* v2 means translate it in days so that marginal effect can be interpreted using OLS
gen drink_days_v2_w1 = 365 if drink_days_w1 == 1
replace drink_days_v2_w1 = 4.5*52 if drink_days_w1 == 2
replace drink_days_v2_w1 = 1.5*52 if drink_days_w1 == 3
replace drink_days_v2_w1 = 2.5*12 if drink_days_w1 == 4
replace drink_days_v2_w1 = 7.5 if drink_days_w1 == 5
replace drink_days_v2_w1 = 1.5 if drink_days_w1 == 6
replace drink_days_v2_w1 = 0 if drink_days_w1 == 7




 
rename H1TO16 drink_amount_w1
replace drink_amount_w1 = 0 if drink_days_w1 == 7  // this one is better since the previous questions ask lifetime use
rename H1TO17 drink_5_a_row_w1
replace drink_5_a_row_w1 = 7 if drink_days_w1 == 7 


gen drink_5_a_row_v2_w1 = 365 if drink_5_a_row_w1 == 1
replace drink_5_a_row_v2_w1 = 4.5*52 if drink_5_a_row_w1 == 2
replace drink_5_a_row_v2_w1 = 1.5*52 if drink_5_a_row_w1 == 3
replace drink_5_a_row_v2_w1 = 2.5*12 if drink_5_a_row_w1 == 4
replace drink_5_a_row_v2_w1 = 7.5 if drink_5_a_row_w1 == 5
replace drink_5_a_row_v2_w1 = 1.5 if drink_5_a_row_w1 == 6
replace drink_5_a_row_v2_w1 = 0 if drink_5_a_row_w1 == 7







rename H1TO18 drink_very_high_w1
replace drink_very_high_w1 = 7 if drink_days_w1 == 7 

gen drink_very_high_v2_w1 = 365 if drink_very_high_w1 == 1
replace drink_very_high_v2_w1 = 4.5*52 if drink_very_high_w1 == 2
replace drink_very_high_v2_w1 = 1.5*52 if drink_very_high_w1 == 3
replace drink_very_high_v2_w1 = 2.5*12 if drink_very_high_w1 == 4
replace drink_very_high_v2_w1 = 7.5 if drink_very_high_w1 == 5
replace drink_very_high_v2_w1 = 1.5 if drink_very_high_w1 == 6
replace drink_very_high_v2_w1 = 0 if drink_very_high_w1 == 7








gen total_drink_per_year_w1 = drink_amount_w1*drink_days_v2_w1 









rename H1TO19 type_of_drink_w1

rename H1TO20 drink_trouble_with_parents_w1
replace drink_trouble_with_parents_w1 = 0 if drink_days_w1 == 7 

rename H1TO21 drink_trouble_with_schools_w1
replace drink_trouble_with_schools_w1 = 0 if drink_days_w1 == 7 


rename H1TO22 drink_trouble_with_frds_w1
replace drink_trouble_with_frds_w1 = 0 if drink_days_w1 == 7 

rename H1TO23 drink_trouble_with_date_w1
replace drink_trouble_with_date_w1 = 0 if drink_days_w1 == 7 

rename H1TO24 drink_regret_w1
replace drink_regret_w1 = 0 if drink_days_w1 == 7 

rename H1TO25 drink_hung_over_w1
replace drink_hung_over_w1 = 0 if drink_days_w1 == 7 

rename H1TO26 drink_threw_up_w1
replace drink_threw_up_w1 = 0 if drink_days_w1 == 7 

rename H1TO27 drink_regret_sex_w1
replace drink_regret_sex_w1 = 0 if drink_days_w1 == 7 

rename H1TO28 drink_fight_w1
replace drink_fight_w1 = 0 if drink_days_w1 == 7 

rename H1TO29 drink_frds_w1



rename H1TO31 how_many_times_marijuana_w1       
replace how_many_times_marijuana_w1 = 0 if H1TO30 == 0     




rename H1TO32 how_many_times_marijuana_30_w1                 // this one is better since the previous questions ask lifetime use
replace how_many_times_marijuana_30_w1 = 0 if H1TO30 == 0 


gen ever_marijuana_30_w1 = 0 if  how_many_times_marijuana_30_w1 == 0
replace ever_marijuana_30_w1 = 1 if (how_many_times_marijuana_30_w1 > 0 & how_many_times_marijuana_30_w1 !=. )





rename H1TO36 how_many_times_cocaine_30_w1                 // this one is better since the previous questions ask lifetime use
replace how_many_times_cocaine_30_w1 = 0 if H1TO34 == 0 

gen ever_cocaine_30_w1 = 0 if  how_many_times_cocaine_30_w1   == 0
replace ever_cocaine_30_w1 = 1 if (how_many_times_cocaine_30_w1   > 0 & how_many_times_cocaine_30_w1   !=. )




rename H1TO39 how_many_times_inhalants_30_w1                 // this one is better since the previous questions ask lifetime use
replace how_many_times_inhalants_30_w1 = 0 if H1TO37 == 0 

gen ever_inhalants_30_w1 = 0 if  how_many_times_inhalants_30_w1   == 0
replace ever_inhalants_30_w1 = 1 if (how_many_times_inhalants_30_w1   > 0 & how_many_times_inhalants_30_w1   !=. )






rename H1TO42 how_many_times_other_drug_30_w1                 // this one is better since the previous questions ask lifetime use
replace how_many_times_other_drug_30_w1 = 0 if H1TO40 == 0 

gen ever_other_drug_30_w1 = 0 if  how_many_times_other_drug_30_w1   == 0
replace ever_other_drug_30_w1 = 1 if (how_many_times_other_drug_30_w1   > 0 & how_many_times_other_drug_30_w1   !=. )








rename H1TO33 marijuana_frds_w1


* controls
rename H1TO50 cigarettes_available_home_w1  
rename H1TO51 alcohol_available_home_w1  
rename H1TO52 drugs_available_home_w1  
rename H1TO53 gun_available_home_w1  











rename H2TO1 tried_cigarette_w2

rename H2TO3 regular_cigarette_w2 
replace regular_cigarette_w2 = 0 if tried_cigarette_w2 == 0
rename H2TO5 how_many_days_smoke_w2
replace how_many_days_smoke_w2 = 0 if tried_cigarette_w2 == 0

rename H2TO7 how_many_cigarettes_w2
replace how_many_cigarettes_w2 = 0 if tried_cigarette_w2 == 0 | how_many_days_smoke_w2 == 0



gen total_smoke_a_month_w2 = how_many_days_smoke_w2*how_many_cigarettes_w2


rename H2TO10 smoke_frds_w2
   
   
   
rename H2TO15 ever_drink_alcohol_w2
rename H2TO16 drink_when_parents_not_home_w2            //!!!!!!!!!!!!!!!!!!!!!! super important!!!
replace drink_when_parents_not_home_w2 = 0 if ever_drink_alcohol_w2 == 0 

rename H2TO19 drink_days_w2
replace drink_days_w2 = 7 if ever_drink_alcohol_w2 == 0



gen drink_days_v2_w2 = 365 if drink_days_w2 == 1
replace drink_days_v2_w2 = 4.5*52 if drink_days_w2 == 2
replace drink_days_v2_w2 = 1.5*52 if drink_days_w2 == 3
replace drink_days_v2_w2 = 2.5*12 if drink_days_w2 == 4
replace drink_days_v2_w2 = 7.5 if drink_days_w2 == 5
replace drink_days_v2_w2 = 1.5 if drink_days_w2 == 6
replace drink_days_v2_w2 = 0 if drink_days_w2 == 7





rename H2TO20 drink_amount_w2
replace drink_amount_w2 = 0 if drink_days_w2 == 7 

rename H2TO21 drink_5_a_row_w2
replace drink_5_a_row_w2 = 7 if drink_days_w2 == 7 


gen drink_5_a_row_v2_w2 = 365 if drink_5_a_row_w2 == 1
replace drink_5_a_row_v2_w2 = 4.5*52 if drink_5_a_row_w2 == 2
replace drink_5_a_row_v2_w2 = 1.5*52 if drink_5_a_row_w2 == 3
replace drink_5_a_row_v2_w2 = 2.5*12 if drink_5_a_row_w2 == 4
replace drink_5_a_row_v2_w2 = 7.5 if drink_5_a_row_w2 == 5
replace drink_5_a_row_v2_w2 = 1.5 if drink_5_a_row_w2 == 6
replace drink_5_a_row_v2_w2 = 0 if drink_5_a_row_w2 == 7


rename H2TO22 drink_very_high_w2
replace drink_very_high_w2 = 7 if drink_days_w2 == 7 


gen drink_very_high_v2_w2 = 365 if drink_very_high_w2 == 1
replace drink_very_high_v2_w2 = 4.5*52 if drink_very_high_w2 == 2
replace drink_very_high_v2_w2 = 1.5*52 if drink_very_high_w2 == 3
replace drink_very_high_v2_w2 = 2.5*12 if drink_very_high_w2 == 4
replace drink_very_high_v2_w2 = 7.5 if drink_very_high_w2 == 5
replace drink_very_high_v2_w2 = 1.5 if drink_very_high_w2 == 6
replace drink_very_high_v2_w2 = 0 if drink_very_high_w2 == 7



gen total_drink_per_year_w2 = drink_amount_w2*drink_days_v2_w2 


rename H2TO23 type_of_drink_w2
rename H2TO25 drink_trouble_with_parents_w2
replace drink_trouble_with_parents_w2 = 0 if drink_days_w2 == 7 

rename H2TO26 drink_trouble_with_schools_w2
replace drink_trouble_with_schools_w2 = 0 if drink_days_w2 == 7 

rename H2TO27 drink_trouble_with_frds_w2 
replace drink_trouble_with_frds_w2 = 0 if drink_days_w2 == 7 

rename H2TO28 drink_trouble_with_date_w2
replace drink_trouble_with_date_w2 = 0 if drink_days_w2 == 7 

rename H2TO29 drink_regret_w2
replace drink_regret_w2 = 0 if drink_days_w2 == 7 

rename H2TO30 drink_hung_over_w2
replace drink_hung_over_w2 = 0 if drink_days_w2 == 7 

rename H2TO31 drink_threw_up_w2
replace drink_threw_up_w2 = 0 if drink_days_w2 == 7 

rename H2TO32 drink_regret_sex_w2
replace drink_regret_sex_w2 = 0 if drink_days_w2 == 7 

rename H2TO33 drink_fight_w2
replace drink_fight_w2 = 0 if drink_days_w2 == 7 

rename H2TO41 drink_frds_w2



rename H2TO45 how_many_times_marijuana_w2    
replace how_many_times_marijuana_w2  = 0 if H2TO44 == 0 

rename H2TO46 how_many_times_marijuana_30_w2    // this one is better since the previous questions ask lifetime use
replace how_many_times_marijuana_30_w2 = 0 if H2TO44 == 0

rename H2TO48 marijuana_frds_w2




gen ever_marijuana_30_w2 = 0 if  how_many_times_marijuana_30_w2 == 0
replace ever_marijuana_30_w2 = 1 if (how_many_times_marijuana_30_w2 > 0 & how_many_times_marijuana_30_w2 !=. )





rename H2TO52 how_many_times_cocaine_30_w2                 // this one is better since the previous questions ask lifetime use
replace how_many_times_cocaine_30_w2 = 0 if H2TO50 == 0 

gen ever_cocaine_30_w2 = 0 if  how_many_times_cocaine_30_w2   == 0
replace ever_cocaine_30_w2 = 1 if (how_many_times_cocaine_30_w2   > 0 & how_many_times_cocaine_30_w2   !=. )




rename H2TO56 how_many_times_inhalants_30_w2                 // this one is better since the previous questions ask lifetime use
replace how_many_times_inhalants_30_w2 = 0 if H2TO54 == 0 

gen ever_inhalants_30_w2 = 0 if  how_many_times_inhalants_30_w2   == 0
replace ever_inhalants_30_w2 = 1 if (how_many_times_inhalants_30_w2   > 0 & how_many_times_inhalants_30_w2   !=. )





rename H2TO60 how_many_times_other_drug_30_w2                 // this one is better since the previous questions ask lifetime use
replace how_many_times_other_drug_30_w2 = 0 if H2TO58 == 0 

gen ever_other_drug_30_w2 = 0 if  how_many_times_other_drug_30_w2   == 0
replace ever_other_drug_30_w2 = 1 if (how_many_times_other_drug_30_w2   > 0 & how_many_times_other_drug_30_w2   !=. )






* controls
rename H2TO11 cigarettes_available_home_w2  
rename H2TO42 alcohol_available_home_w2  
rename H2TO68 drugs_available_home_w2  



* cocaine, other drugs are skipped cuz too few data





* section 29 w1, section 28 w2 (y variable) (skipped some..usually cuz not enuf data)
rename H1DS1 paint_graffiti_w1
rename H1DS2 damage_property_w1
rename H1DS3 lie_to_parents_whereabout_w1
rename H1DS4 steal_things_more_fifty_w1
rename H1DS7 run_away_from_home_w1
rename H1DS8 steal_car_w1
rename H1DS9 steal_things_w1
rename H1DS10 go_into_house_w1
rename H1DS13 steal_things_less_fifty_w1
rename H1DS14 fight_with_group_w1






rename H2DS1 paint_graffiti_w2
rename H2DS2 damage_property_w2
rename H2DS3 lie_to_parents_whereabout_w2
rename H2DS4 steal_things_more_fifty_w2
rename H2DS5 run_away_from_home_w2
rename H2DS6 steal_car_w2
rename H2DS7 steal_things_w2
rename H2DS8 go_into_house_w2
rename H2DS11 steal_things_less_fifty_w2
rename H2DS13 fight_with_group_w2







* section 30 w1, w2 (skipped cuz not enuf data)




* section 31  w1, section 29 w2
rename H1FV1 saw_shoot_stab_someone_w1   // (control)
rename H1FV2 someone_pulled_weapon_w1   // (control)




rename H2FV1 saw_shoot_stab_someone_w2   // (control)
rename H2FV2 someone_pulled_weapon_w2   // (control)






* H1TO53 for wave 1
rename H2FV14 gun_available_home_w2 // (control)



		   
		   
		   
* section 32A,B w1, section 31A,B w2 (skipped)

		   
		   
		   

		   
		   
		   
* section 33 w1, section 32 w2  (skipped cuz not too many data)



* section 34 w1, section 33 w2  (use this when you run regression with y variables as sex behavior)
rename H1PA1 mom_att_sex_w1
rename H1PA2 mom_att_sex_gf_bf_w1
rename H1PA3 mom_att_birth_control_w1
rename H1PA4 dad_att_sex_w1
rename H1PA5 dad_att_sex_gf_bf_w1
rename H1PA6 dad_att_birth_control_w1
rename H1PA7 att_premarital_birth_w1





rename H2PA1 mom_att_sex_w2
rename H2PA2 mom_att_sex_gf_bf_w2
rename H2PA3 mom_att_birth_control_w2
rename H2PA4 dad_att_sex_w2
rename H2PA5 dad_att_sex_gf_bf_w2
rename H2PA6 dad_att_birth_control_w2
rename H2PA7 att_premarital_birth_w2
   
		   
		   
		   
		   
		   
* section 35 w1, section 34 w2  (very important!!! use this as parents attitudes)
forvalues i = 1(1)2 {

	rename H`i'PR1 adults_care_w`i'
	rename H`i'PR2 teachers_care_w`i'
	rename H`i'PR3 parents_care_w`i'
	rename H`i'PR4 frds_care_w`i'                            // control
	rename H`i'PR5 family_understands_w`i'                   // control
	rename H`i'PR6 leave_home_w`i'
	rename H`i'PR7 family_fun_w`i'                          // control
	rename H`i'PR8 family_pays_attention_w`i'
	

}
		   
		   
		   
		   
		   
		   
		   
	   
* section 36 w1, section 35 w2  (use this as controls) (maybe x variable too)
forvalues i = 1(1)2 {

	rename H`i'NB1 know_neighborhood_w`i'
	rename H`i'NB2 talk_to_neighbor_w`i'
	rename H`i'NB3 neighbor_look_out_others_w`i'   
	rename H`i'NB4 neighborhood_gym_w`i'   
	rename H`i'NB5 neighborhood_safe_w`i'  
	rename H`i'NB6 neighborhood_happy_w`i'  
	rename H`i'NB7 move_out_happy_w`i'
	
}






* section 37 w1, section 36 w2  (controls)
		   
forvalues i = 1(1)2 {		   
	rename H`i'RE1 religion_w`i'  
	rename H`i'RE2 god_without_mistakes_w`i'
	rename H`i'RE3 attend_religious_service_w`i'
	rename H`i'RE4 religion_importance_w`i'
	rename H`i'RE6 pray_times_w`i'
	rename H`i'RE7 religion_activities_w`i'
}


 
* H1RE2, H1RE4 cant add "legitimate skip" 

replace attend_religious_service_w1 = 4 if religion_w1 == 0
replace attend_religious_service_w2 = 4 if religion_w2 == 29

replace pray_times_w1 = 5 if religion_w1 == 0
replace pray_times_w2 = 5 if religion_w2 == 29		   
		   
replace religion_activities_w1 = 4 if religion_w1 == 0 
replace religion_activities_w2 = 4 if religion_w2 == 29 




		   
* section 38 w1, section 36 w2  (controls) (maybe can be x variables)


forvalues i = 1(1)2 {		   

	rename H`i'EE1 want_college_w`i'
	rename H`i'EE2 expect_college_w`i'
	rename H`i'EE3 work_outside_w`i'
	rename H`i'EE4 work_hours_non_summer_w`i'
	rename H`i'EE6 work_hours_summer_w`i'

	* controls:
	rename H`i'EE9 ever_drive_a_car_w`i'                    
	rename H`i'EE10 had_driving_license_w`i'                
	rename H`i'EE11 drive_miles_w`i'                        // can skip this control
	rename H`i'EE12 expect_age_35_w`i'
	rename H`i'EE13 expect_married_25_w`i'
	rename H`i'EE14 expect_killed_21_w`i'
	rename H`i'EE15 expect_HIV_AId_w`i'

}


gen earnings_non_summer_w1 = 0
replace earnings_non_summer_w1 = H1EE5 if H1EE5 != .
gen earnings_summer_w1 = 0
replace earnings_summer_w1 = H1EE7 if H1EE7 != .


rename H1EE8 allowance_w1
gen earning_per_week_w1 = earnings_non_summer_w1 + allowance_w1




gen earnings_non_summer_w2 = 0
replace earnings_non_summer_w2 = H2EE5 if H2EE5 != .
gen earnings_summer_w2 = 0
replace earnings_summer_w2 = H2EE7 if H2EE7 != .


rename H2EE8 allowance_w2
gen earning_per_week_w2 = earnings_non_summer_w2 + allowance_w2



		   
		   
		   
		   
* section 39 w1, section 38 w2

egen num_study_sib_w1 = anycount(STUDSIBA STUDSIBB STUDSIBC STUDSIBD STUDSIBE STUDSIBF STUDSIBG), values(1)
* egen num_study_sib_w1 = anycount(studsiba studsibb studsibc studsibd studsibe studsibf studsibg), values(1)


egen num_sibling_survey_w1 = rownonmiss(H1WS1A H1WS1B H1WS1C H1WS1D H1WS1E H1WS1F H1WS1G) if IMONTH !=. | IDAY !=. | IYEAR !=.
egen num_sibling_survey_w2 = rownonmiss(H2WS1A H2WS1B H2WS1C H2WS1D H2WS1E H2WS1F H2WS1G) if IMONTH2 !=. | IDAY2 !=. | IYEAR2 !=. 



/* not there!!! why???
rename H2SIBA
egen num_study_sib_w1 = anycount(H2SIBA H2SIBB H2SIBC H2SIBD H2SIBE H2SIBF H2SIBG), values(1)

*/


* this part has problem!!! check the survey detail!!!!! wave 1 and wave 2 do not match!!!


forvalues i = 1(1)4 {
	egen time_spent_sib`i'_w1 = anycount(H1WS1A H1WS1B H1WS1C H1WS1D H1WS1E H1WS1F H1WS1G), values(`i')
	egen time_spent_sib_frds`i'_w1 = anycount(H1WS2A H1WS2B H1WS2C H1WS2D H1WS2E H1WS2F H1WS2G), values(`i')
	gen time_spent_sib`i'_ratio_w1 = time_spent_sib`i'_w1/num_sibling_survey_w1
	gen time_spent_sib_frds`i'_ratio_w1 = time_spent_sib_frds`i'_w1/num_sibling_survey_w1
	
	egen time_spent_sib`i'_w2 = anycount(H2WS1A H2WS1B H2WS1C H2WS1D H2WS1E H2WS1F H2WS1G), values(`i')
	egen time_spent_sib_frds`i'_w2 = anycount(H2WS2A H2WS2B H2WS2C H2WS2D H2WS2E H2WS2F H2WS2G), values(`i')
	gen time_spent_sib`i'_ratio_w2 = time_spent_sib`i'_w2/num_sibling_survey_w2
	gen time_spent_sib_frds`i'_ratio_w2 = time_spent_sib_frds`i'_w2/num_sibling_survey_w2

}


forvalues i = 1(1)5 {

	egen quarrel_sib`i'_w1 = anycount(H1WS3A H1WS3B H1WS3C H1WS3D H1WS3E H1WS3F H1WS3G), values(`i')
	gen quarrel_sib`i'_ratio_w1 = quarrel_sib`i'_w1/num_sibling_survey_w1

	egen quarrel_sib`i'_w2 = anycount(H2WS3A H2WS3B H2WS3C H2WS3D H2WS3E H2WS3F H2WS3G), values(`i')
	gen quarrel_sib`i'_ratio_w2 = quarrel_sib`i'_w2/num_sibling_survey_w2


}


forvalues i = 1(1)3 {

	egen love_sib`i'_w1 = anycount(H1WS4A H1WS4B H1WS4C H1WS4D H1WS4E H1WS4F H1WS4G), values(`i')
	gen love_sib`i'_ratio_w1 = love_sib`i'_w1/num_sibling_survey_w1

	egen love_sib`i'_w2 = anycount(H2WS4A H2WS4B H2WS4C H2WS4D H2WS4E H2WS4F H2WS4G), values(`i')
	gen love_sib`i'_ratio_w2 = love_sib`i'_w2/num_sibling_survey_w2


}


forvalues i = 1(1)3 {

	egen who_receive_attention`i'_w1 = anycount(H1WS5A H1WS5B H1WS5C H1WS5D H1WS5E H1WS5F H1WS5G), values(`i')
	gen who_receive_attention`i'_ratio_w1 = who_receive_attention`i'_w1/num_sibling_survey_w1

	egen who_receive_attention`i'_w2 = anycount(H2WS5A H2WS5B H2WS5C H2WS5D H2WS5E H2WS5F H2WS5G), values(`i')
	gen who_receive_attention`i'_ratio_w2= who_receive_attention`i'_w2/num_sibling_survey_w2

}
		   
		   

		   
		   
* section 40 w1, section 39 w2  (mainly for control)

forvalues i = 1(1)2 {		   

	rename H`i'IR1 physical_attractive_w`i' 
	rename H`i'IR2 personality_attractive_w`i'   // very important!!!!!! can be x!!!
	rename H`i'IR3 well_groom_w`i'   
	rename H`i'IR4 candid_w`i'   
	rename H`i'IR5 physical_mature_w`i'   
	rename H`i'IR6 third_person_presence_w`i'   
	rename H`i'IR9 interview_location_w`i'   
	rename H`i'IR10 building_type_w`i'             // control for property
	rename H`i'IR11 building_well_kept_w`i'             // control for property
	rename H`i'IR12 environment_nearby_w`i'             // control for property
	rename H`i'IR13 residence_type_w`i'             // control for property
	rename H`i'IR14 nearby_well_kept_w`i'             // control for property
	rename H`i'IR15 nearby_safe_w`i'             // control for property
	rename H`i'IR16 number_interruptions_w`i'             
	rename H`i'IR19 resp_impatient_w`i'             
	rename H`i'IR21 resp_embarrassed_w`i'             
	rename H`i'IR23 resp_family_smoke_w`i'             
	rename H`i'IR24 resp_family_drink_w`i'             
	rename H`i'IR25 resp_language_w`i'       // no need
	rename H`i'IR26 resp_blind_w`i'           // no need  
	rename H`i'IR27 resp_deaf_w`i'             // no need


}
		   
		   
		   
		   
		   
		   
		   
		   
		   

		   
		   
rename S59F s_lie_to_parents_w1

rename S47 s_time_spend_tv_video_w1


		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   
		   


	   


 
 
 

* checked 1 time
rename PA1 sex_mom_or_dad	    
rename PA2 age_mom_or_dad
rename PA10 marital_status_mom_or_dad
rename PA13 work_outside_mom_or_dad
rename PA17 full_time_mom_or_dad
rename PA21 receiving_public_assistance
rename PA22 religion_parent
rename (PA27A PA27B PA27C PA27D PA27E) (parent_org military_org labor_union hobby_org civic_org)
rename (PA28A PA28B PA28C PA28D PA28E PA28F PA28G PA28H PA28I PA28J) ///
(move_here_reason_A move_here_reason_B move_here_reason_C move_here_reason_D move_here_reason_E move_here_reason_F move_here_reason_G move_here_reason_H move_here_reason_I move_here_reason_J)

rename PA30 neighborhood
rename PA31 parent_tell_neighbor_child
rename PA33 neighborhood_trash
rename PA34 neighborhood_drug
rename PA35 neighborhood_bad

rename PA36 most_important_son_learn
rename PA37 most_important_daughter_learn

rename PA38 ever_married

rename PA55 family_income_1994
rename PA56 enuf_pay_bills
rename (PA57A PA57B PA57C PA57D PA57E PA57F) (Soc_Sec SSI AFDC food_stamps unemp_compensation housing_sub)


rename PA61 drink_alcohol_mom_dad 
rename PA62 drink_5_more_mom_dad

rename PA64 smoke_mom_or_dad
replace smoke_mom_or_dad = 0 if smoke_mom_or_dad == 7




* 1443 people do not have spouse
rename PB2 sex_spouse
rename (PB5_1 PB5_2 PB5_3 PB5_4 PB5_5) (white_spouse black_spouse indian_spouse asian_spouse other_spouse)  
rename PB7 religion_spouse
rename PB8 school_spouse
rename PB9 work_outside_spouse
rename PB13 full_time_spouse
* replace full_time_spouse = 0 if work_outside_spouse == 0
rename PB14 disabled_spouse
rename PB15 retired_spouse
rename PB16 happy_spouse
rename PB17 receive_public_assist_spouse
rename PB18 happy_w_spouse
rename PB19 separating_spouse
rename PB20 fight_w_spouse
rename PB21 health_status_spouse
rename PB22 drink_alcohol_spouse


	   
rename PC1 relationship
rename PC2 bio_mom_live_here
replace bio_mom_live_here = 2 if relationship == 1

rename PC6B bio_dad_live_here
replace bio_dad_live_here = 1 if relationship == 9

rename PC10 know_frds
rename PC11 met_frds
rename PC12 met_frds_parents
rename PC13 opinion_frds

rename PC14 kids_have_gf_bf
rename PC15 met_gf_bf    // will drop data

rename PC16 met_gf_bf_parent // will drop data

rename PC17 talk_to_how_many_parents
rename PC18 son_health

rename (PC21_1 PC21_2 PC21_3 PC21_4 PC21_5 PC21_6 PC21_7) (medicare medicaid individual_coverage prepaid_health_plan other none dont_know)
rename PC22 no_insurance // will drop data
rename PC23 time_to_bed
rename PC24 in_school
rename PC25 talk_about_school_grade    //  will drop data
replace talk_about_school_grade = 0 if in_school == 0


rename PC26 talk_about_school_things 
replace talk_about_school_things = 0 if in_school == 0


rename PC27 talk_to_teachers
replace talk_to_teachers = 0 if in_school == 0


rename PC28 participate_school_activities
replace participate_school_activities = 0 if in_school == 0

 
rename (PC29A PC29B PC29C) (school_good_learn school_safe school_good)
replace school_good_learn = 0 if in_school == 0
replace school_safe = 0 if in_school == 0
replace school_good = 0 if in_school == 0


rename PC30 expect_high_school_stud
rename PC31 expect_hs
rename PC32 bad_temper
rename PC33 son_life
rename (PC34A PC34B PC34C PC34D PC34E) (get_along_well make_decision_tgt do_not_understand_him trust_him son_interferes_u)
rename PC35 not_live_with_you_6_months
rename PC37 retarded
rename PC38 learning_disability
rename PC39 special_educ
rename PC40 son_use_tobacco   // would be super interesting to see how much claim by mom, how much claim by son!!
rename PC41 son_use_alcohol

rename PC44B disapprove_sex
* PC42 PC43 PC44 only do it when talk about sex behavior

rename PC45 son_ever_gone_date   // would be super interesting to see how much claim by mom, how much claim by son!!
rename PC46 son_ever_kissed 
rename PC47 son_ever_had_sex
rename PC48 son_sex_age


* PC49 when talk about intergeneration
	   


	   
	   
rename H2NU77 num_fast_food_w2
rename H2NU78 num_eat_breakfast_w2
rename H2NU79 num_eat_lunch_w2
rename H2NU80 num_eat_dinner_w2
	   
	   
									
gen before_school_supervision_w1 = 1 if (res_mom_at_home_leave_school_w1 == 1 | res_mom_at_home_leave_school_w1  == 2 | res_mom_at_home_leave_school_w1 == 6 | ///									
                                      res_dad_at_home_leave_school_w1 == 1 | res_dad_at_home_leave_school_w1  == 2 | res_dad_at_home_leave_school_w1 == 6 )									
									
replace before_school_supervision_w1 = 0 if (before_school_supervision_w1 != 1 & res_mom_at_home_leave_school_w1 != .)									
									  
gen after_school_supervision_w1 = 1 if (res_mom_at_home_return_school_w1  == 1 | res_mom_at_home_return_school_w1   == 2 | res_mom_at_home_return_school_w1  == 6 | ///									
                                     res_dad_at_home_return_school_w1  == 1 | res_dad_at_home_return_school_w1   == 2 | res_dad_at_home_return_school_w1  == 6 )									
									
replace after_school_supervision_w1 = 0 if (after_school_supervision_w1 != 1 & res_mom_at_home_return_school_w1 != .)									
									
									
gen bedtime_supervision_w1 = 1 if (res_mom_at_home_go_to_bed_w1  == 1 | res_mom_at_home_go_to_bed_w1 == 2 | res_mom_at_home_go_to_bed_w1  == 6 | ///									
                                res_dad_at_home_go_to_bed_w1  == 1 | res_dad_at_home_go_to_bed_w1 == 2 | res_dad_at_home_go_to_bed_w1  == 6 )									
									
replace bedtime_supervision_w1 = 0 if (bedtime_supervision_w1 != 1 & res_mom_at_home_go_to_bed_w1 != .)									

	   
	   
	   
	   
	   
	   
gen before_school_supervision_w2 = 1 if (res_mom_at_home_leave_school_w2 == 1 | res_mom_at_home_leave_school_w2  == 2 | res_mom_at_home_leave_school_w2 == 6 | ///
                                      res_dad_at_home_leave_school_w2 == 1 | res_dad_at_home_leave_school_w2  == 2 | res_dad_at_home_leave_school_w2 == 6 )

replace before_school_supervision_w2 = 0 if (before_school_supervision_w2 != 1 & res_mom_at_home_leave_school_w2 != .)
									  
gen after_school_supervision_w2 = 1 if (res_mom_at_home_return_school_w2  == 1 | res_mom_at_home_return_school_w2   == 2 | res_mom_at_home_return_school_w2  == 6 | ///
                                     res_dad_at_home_return_school_w2  == 1 | res_dad_at_home_return_school_w2   == 2 | res_dad_at_home_return_school_w2  == 6 )

replace after_school_supervision_w2 = 0 if (after_school_supervision_w2 != 1 & res_mom_at_home_return_school_w2 != .)


gen bedtime_supervision_w2 = 1 if (res_mom_at_home_go_to_bed_w2  == 1 | res_mom_at_home_go_to_bed_w2 == 2 | res_mom_at_home_go_to_bed_w2  == 6 | ///
                                res_dad_at_home_go_to_bed_w2  == 1 | res_dad_at_home_go_to_bed_w2 == 2 | res_dad_at_home_go_to_bed_w2  == 6 )

replace bedtime_supervision_w2 = 0 if (bedtime_supervision_w2 != 1 & res_mom_at_home_go_to_bed_w2 != .)
	   
	   
	   
	   
gen bad_food_w2 =  H2NU60 + H2NU62 +  H2NU63 + H2NU66 + H2NU70 



gen vege_fruits_w1 = fruit_juice_w1 + vege_w1



* bean is veggies!!
gen fruit_juice_w2 = H2NU5 + H2NU6 + H2NU10 + H2NU11 + H2NU12 + H2NU13 + H2NU14 + H2NU15 + H2NU17 + H2NU18 
gen vege_w2 =  H2NU16 + H2NU19 + H2NU20 + H2NU21 + H2NU22 + H2NU23 + H2NU24 + H2NU25 + H2NU26 + H2NU27 + H2NU28 + H2NU30
 

 
 
gen vege_fruits_w2 =  H2NU10 + H2NU11 + H2NU12 + H2NU13 + H2NU14 + H2NU15 + H2NU16 + H2NU17 + H2NU19 + H2NU20 + H2NU21 + H2NU22 + H2NU23 + H2NU24 + H2NU25 + H2NU26 + H2NU27 + H2NU28 + H2NU30


rename H2NU63 cookies_dum_w2 

gen vege_fruits_dum_w1 = 0 if vege_fruits_w1 == 0
replace vege_fruits_dum_w1 = 1 if (vege_fruits_w1 > 0 & vege_fruits_w1 !=. )
 
gen vege_fruits_dum_w2 = 0 if vege_fruits_w2 == 0
replace vege_fruits_dum_w2 = 1 if (vege_fruits_w2 > 0 & vege_fruits_w2 !=. )

 

gen decision_w1 = decide_time_at_home_weekend_w1 + decide_hang_around_with_w1 + decide_what_u_wear_w1 + decide_how_much_tv_w1 + decide_what_tv_programs_w1 + decide_what_time_go_bed_w1 + decide_what_you_eat_w1

replace  decision_w1 = 7-decision_w1

gen decision_w2 =  decide_time_at_home_weekend_w2 + decide_hang_around_with_w2 + decide_what_u_wear_w2 + decide_how_much_tv_w2 + decide_what_tv_programs_w2 + decide_what_time_go_bed_w2 + decide_what_you_eat_w2


replace  decision_w2 = 7-decision_w2
	   
	   
	   
	   
	   
	   
	   
	   




*********************** for compare_child_mom_report_data *****************************




















* checked 1 time
gen dad_full_time_mom_report_w1 = 1 if (sex_mom_or_dad == 1 & full_time_mom_or_dad == 1)
replace dad_full_time_mom_report_w1 = 1 if (sex_mom_or_dad == 2 & sex_spouse == 1 & full_time_spouse == 1)
replace dad_full_time_mom_report_w1 = 0 if (sex_mom_or_dad == 1 & full_time_mom_or_dad == 0)
replace dad_full_time_mom_report_w1 = 0 if (sex_mom_or_dad == 2 & sex_spouse == 1 & full_time_spouse == 0)









* checked 1 time
gen mom_full_time_mom_report_w1 = 1 if (sex_mom_or_dad == 2 & full_time_mom_or_dad == 1)
replace mom_full_time_mom_report_w1 = 1 if (sex_mom_or_dad == 1 & sex_spouse == 2 & full_time_spouse == 1)
replace mom_full_time_mom_report_w1 = 0 if (sex_mom_or_dad == 2 & full_time_mom_or_dad == 0)
replace mom_full_time_mom_report_w1 = 0 if (sex_mom_or_dad == 1 & sex_spouse == 2 & full_time_spouse == 0)








* checked 1 time  (version 2 means 0 is added here)
gen mom_full_time_mom_report_v2_w1 = 2 if (sex_mom_or_dad == 2 & full_time_mom_or_dad == 1)
replace mom_full_time_mom_report_v2_w1 = 2 if (sex_mom_or_dad == 1 & sex_spouse == 2 & full_time_spouse == 1)
replace mom_full_time_mom_report_v2_w1 = 1 if (sex_mom_or_dad == 2 & full_time_mom_or_dad == 0)
replace mom_full_time_mom_report_v2_w1 = 1 if (sex_mom_or_dad == 1 & sex_spouse == 2 & full_time_spouse == 0)
replace mom_full_time_mom_report_v2_w1 = 0 if (sex_mom_or_dad == 2 & work_outside_mom_or_dad == 0)
replace mom_full_time_mom_report_v2_w1 = 0 if (sex_mom_or_dad == 1 & sex_spouse == 2 & work_outside_spouse == 0)








* checked 1 time
gen dad_full_time_mom_report_v2_w1 = 2 if (sex_mom_or_dad == 1 & full_time_mom_or_dad == 1)
replace dad_full_time_mom_report_v2_w1 = 2 if (sex_mom_or_dad == 2 & sex_spouse == 1 & full_time_spouse == 1)
replace dad_full_time_mom_report_v2_w1 = 1 if (sex_mom_or_dad == 1 & full_time_mom_or_dad == 0)
replace dad_full_time_mom_report_v2_w1 = 1 if (sex_mom_or_dad == 2 & sex_spouse == 1 & full_time_spouse == 0)
replace dad_full_time_mom_report_v2_w1 = 0 if (sex_mom_or_dad == 1 & work_outside_mom_or_dad == 0)
replace dad_full_time_mom_report_v2_w1 = 0 if (sex_mom_or_dad == 1 & work_outside_mom_or_dad == 0)
replace dad_full_time_mom_report_v2_w1 = 0 if (sex_mom_or_dad == 2 & sex_spouse == 1 & work_outside_spouse == 0)









*********************** for compare_child_mom_report_data *****************************




* version of mom working hours are the one with imputed mom working hours with mom does not work for pay and mom without occupation
gen res_mom_work_hours_v2_w1 = res_mom_work_hours_w1    
replace res_mom_work_hours_v2_w1 = 0 if (res_mom_pay_w1 == 0  | res_mom_occupation_w1 == 16)



gen res_mom_work_hours_v2_w2 = res_mom_work_hours_w2
replace res_mom_work_hours_v2_w2 = 0 if (res_mom_pay_w2 == 0  | res_mom_occupation_w2 == 16)




* this version is a dummy version
gen mom_full_time_child_report_v2_w1 = 2 if (res_mom_work_hours_v2_w1 >= 35 & res_mom_work_hours_v2_w1 !=. )    
replace mom_full_time_child_report_v2_w1 = 1 if (res_mom_work_hours_v2_w1 < 35 & res_mom_work_hours_v2_w1 > 0 & res_mom_work_hours_v2_w1 !=.  )
replace mom_full_time_child_report_v2_w1 = 0 if res_mom_work_hours_v2_w1 == 0 


gen mom_full_time_child_report_v2_w2 = 2 if (res_mom_work_hours_v2_w2 >= 35 & res_mom_work_hours_v2_w2 !=.)     
replace mom_full_time_child_report_v2_w2 = 1 if (res_mom_work_hours_v2_w2 < 35 & res_mom_work_hours_v2_w2 > 0 & res_mom_work_hours_v2_w2 !=. ) 
replace mom_full_time_child_report_v2_w2 = 0 if res_mom_work_hours_v2_w2 == 0 




* this version is a dummy version + restricted to mom's report 
gen mom_full_time_child_report_v3_w1 = 2 if (res_mom_work_hours_v2_w1 >= 35 & res_mom_work_hours_v2_w1 !=.   & mom_full_time_mom_report_v2_w1  != .  )
replace mom_full_time_child_report_v3_w1 = 1 if (res_mom_work_hours_v2_w1 < 35 & res_mom_work_hours_v2_w1 > 0 & res_mom_work_hours_v2_w1 !=.   & mom_full_time_mom_report_v2_w1  != . )
replace mom_full_time_child_report_v3_w1 = 0 if (res_mom_work_hours_v2_w1 == 0  & mom_full_time_mom_report_v2_w1  != . )











* version of mom working hours are the one with imputed mom working hours
gen res_dad_work_hours_v2_w1 = res_dad_work_hours_w1 
replace res_dad_work_hours_v2_w1 = 0 if (res_dad_pay_w1 == 0  | res_dad_occupation_w1 == 16)



gen res_dad_work_hours_v2_w2 = res_dad_work_hours_w2
replace res_dad_work_hours_v2_w2 = 0 if (res_dad_pay_w2 == 0  | res_dad_occupation_w2 == 16)



* this version is a dummy version

gen dad_full_time_child_report_v2_w1 = 2 if (res_dad_work_hours_v2_w1 >= 35 & res_dad_work_hours_v2_w1 !=. )    
replace dad_full_time_child_report_v2_w1 = 1 if (res_dad_work_hours_v2_w1 < 35 & res_dad_work_hours_v2_w1 > 0 & res_dad_work_hours_v2_w1 !=.  )
replace dad_full_time_child_report_v2_w1 = 0 if res_dad_work_hours_v2_w1 == 0


* this version is a dummy version + restricted to dad's report 
gen dad_full_time_child_report_v3_w1 = 2 if (res_dad_work_hours_v2_w1 >= 35 & res_dad_work_hours_v2_w1 !=.    & dad_full_time_mom_report_v2_w1  != . )
replace dad_full_time_child_report_v3_w1 = 1 if (res_dad_work_hours_v2_w1 < 35 & res_dad_work_hours_v2_w1 > 0 & res_dad_work_hours_v2_w1 !=.    & dad_full_time_mom_report_v2_w1  != . )
replace dad_full_time_child_report_v3_w1 = 0 if (res_dad_work_hours_v2_w1 == 0  & dad_full_time_mom_report_v2_w1  != . )




*********************** for panel_regression *****************************






save constructed_variables, replace








