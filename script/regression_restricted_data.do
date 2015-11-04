* new regression



cd "F:\Add_health_data\courtemanche_data\temp_result"





sum breakfast_milk_w1 breakfast_snack_w1 eat_breakfast_w1 diet_for_weight_w1 exercise_for_weight_w1  drink_alcohol_w1 tried_cigarette_w1  ever_had_sex_w1 
 
sum  mom_stay_home_out_v2_w1 zConscientiousness_w1 BIO_SEX age_w1 race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 res_mom_occupation_w1 res_dad_occupation_w1  decide_time_at_home_weekend_w1 decide_hang_around_with_w1 decide_what_u_wear_w1 decide_how_much_tv_w1 decide_what_tv_programs_w1 decide_what_time_go_bed_w1 decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1 family_income_1994



sum   times_tv_videos_w1 tv_hours_per_week_w1 video_hours_per_week_w1 computer_games_hours_per_week_w1  listen_radio_hours_per_week_w1 tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1  how_many_cigarettes_w1 ///
ever_drink_alcohol_w1 drink_days_w1 drink_amount_w1  drink_5_a_row_w1  drink_very_high_w1


* regression for y variables in proposal defense

/*

foreach yvariable in  breakfast_milk_w1 breakfast_snack_w1 eat_breakfast_w1 diet_for_weight_w1 exercise_for_weight_w1  drink_alcohol_w1 tried_cigarette_w1  ever_had_sex_w1 {
    reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race , r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel  replace

	reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1, r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
	
	reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1 , r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
		
		
	reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , r  	
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
		
	reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1  , r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
	
	
	reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1 family_income_1994  , r                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
	

}
 

 
 
 

 
 
 
 
 
 
 
 foreach yvariable in  breakfast_milk_w1 breakfast_snack_w1 eat_breakfast_w1 diet_for_weight_w1 exercise_for_weight_w1  drink_alcohol_w1 tried_cigarette_w1  ever_had_sex_w1 {
    reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race , r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel replace

	reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1, r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
	
	reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1 , r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
		
		
	reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , r  	
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
		
	reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1 , r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
	
	reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1  num_household_mem_w1 num_bro_w1  num_sis_w1 family_income_1994, r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 

}
 
 
 

 
 
 

 
 




 
 foreach yvariable in  breakfast_milk_w1 breakfast_snack_w1 eat_breakfast_w1 diet_for_weight_w1 exercise_for_weight_w1  drink_alcohol_w1 tried_cigarette_w1  ever_had_sex_w1 {
    reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race , r 
	outreg2 using `yvariable'_int_hrs, word ctitle(`yvariable') excel replace

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race i.mom_stay_home_out_v2_w1 res_dad_work_hours_v2_w1, r 
	outreg2 using `yvariable'_int_hrs, word ctitle(`yvariable') excel append 
	
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race i.mom_stay_home_out_v2_w1  res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1 , r 
	outreg2 using `yvariable'_int_hrs, word ctitle(`yvariable') excel append 
		
		
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race i.mom_stay_home_out_v2_w1  res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , r  	
	outreg2 using `yvariable'_int_hrs, word ctitle(`yvariable') excel append 
		
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race i.mom_stay_home_out_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1 , r 
	outreg2 using `yvariable'_int_hrs, word ctitle(`yvariable') excel append 
	
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race  i.mom_stay_home_out_v2_w1  res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1  num_household_mem_w1 num_bro_w1  num_sis_w1 family_income_1994, r 
	outreg2 using `yvariable'_int_hrs, word ctitle(`yvariable') excel append 

}
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 oprobit times_tv_videos_w1
 tv_hours_per_week_w1
 video_hours_per_week_w1
 computer_games_hours_per_week_w1
 listen_radio_hours_per_week_w1
 
 
 tried_cigarette_w1
 regular_cigarette_w1
 how_many_days_smoke_w1
 how_many_cigarettes_w1
 
 ever_drink_alcohol_w1
 oprobit drink_days_w1
 drink_amount_w1
 oprobit drink_5_a_row_w1
 oprobit drink_very_high_w1
 
 */
 
 * OLS
 
 
 
 foreach yvariable in  tv_hours_per_week_w1 video_hours_per_week_w1 computer_games_hours_per_week_w1  listen_radio_hours_per_week_w1 tried_cigarette_w1 regular_cigarette_w1  how_many_days_smoke_w1   how_many_cigarettes_w1  ever_drink_alcohol_w1  drink_amount_w1 {
    reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race , r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel  replace

	reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1, r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
	
	reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1 , r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
		
		
	reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , r  	
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
		
	reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1  , r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
	
	
	reg `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1 family_income_1994  , r                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
	

}
 

 
 
 

 
 
 
 
 
 
 
 foreach yvariable in  tv_hours_per_week_w1 video_hours_per_week_w1 computer_games_hours_per_week_w1  listen_radio_hours_per_week_w1 tried_cigarette_w1 regular_cigarette_w1  how_many_days_smoke_w1   how_many_cigarettes_w1  ever_drink_alcohol_w1  drink_amount_w1 {
    reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race , r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel replace

	reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1, r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
	
	reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1 , r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
		
		
	reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , r  	
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
		
	reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1 , r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
	
	reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1  num_household_mem_w1 num_bro_w1  num_sis_w1 family_income_1994, r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 

}




* oprobit


 foreach yvariable in  times_tv_videos_w1 drink_days_w1 drink_5_a_row_w1 drink_very_high_w1 {
    oprobit `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race , r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel  replace

	oprobit `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1, r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
	
	oprobit `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1 , r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
		
		
	oprobit `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , r  	
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
		
	oprobit `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1  , r 
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
	
	
	oprobit `yvariable' ib2.mom_stay_home_out_v2_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1 family_income_1994  , r                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel append 
	

}
 

 
 
 

 
 

 
 
 
 
 foreach yvariable in  times_tv_videos_w1 drink_days_w1 drink_5_a_row_w1 drink_very_high_w1 {
    oprobit `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race , r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel replace

	oprobit `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1, r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
	
	oprobit `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1 , r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
		
		
	oprobit `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , r  	
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
		
	oprobit `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1 , r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 
	
	reg `yvariable' ib2.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 i.BIO_SEX age_w1 i.race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.res_mom_occupation_w1 i.res_dad_occupation_w1  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1  num_household_mem_w1 num_bro_w1  num_sis_w1 family_income_1994, r 
	outreg2 using `yvariable'_int, word ctitle(`yvariable') excel append 

}
  
  
  
  
  
  
  
  
  
  
  
  
 ** important 
* other possible y variables:  res_mom_at_home_leave_school_w1 res_mom_at_home_return_school_w1 res_mom_at_home_go_to_bed_w1  
