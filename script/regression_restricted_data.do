* new regression

set maxvar 32767
use "F:\temp_data\constructed_variables", clear

cd "F:\temp_result"

* this is the version of re



sum breakfast_milk_w1 breakfast_snack_w1 eat_breakfast_w1 diet_for_weight_w1 exercise_for_weight_w1  drink_alcohol_w1 tried_cigarette_w1  ever_had_sex_w1 
 
sum  mom_stay_home_out_v2_w1 zConscientiousness_w1 BIO_SEX age_w1 race res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 res_mom_occupation_w1 res_dad_occupation_w1  decide_time_at_home_weekend_w1 decide_hang_around_with_w1 decide_what_u_wear_w1 decide_how_much_tv_w1 decide_what_tv_programs_w1 decide_what_time_go_bed_w1 decide_what_you_eat_w1 num_household_mem_w1 num_bro_w1  num_sis_w1 family_income_1994



sum   times_tv_videos_w1 tv_hours_per_week_w1 video_hours_per_week_w1 computer_games_hours_per_week_w1  listen_radio_hours_per_week_w1 tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1  how_many_cigarettes_w1 ///
ever_drink_alcohol_w1 drink_days_w1 drink_amount_w1  drink_5_a_row_w1  drink_very_high_w1












* imputation:


* reference: 
/*
http://www.colorado.edu/ibs/crs/workshops/Missing_Data_11-15-2011/SlidesHandout.pdf
https://www.ssc.wisc.edu/sscc/pubs/stata_mi_decide.htm
http://sites.stat.psu.edu/~jls/mifaq.html
http://www.csos.jhu.edu/contact/staff/jwayman_pub/wayman_multimp_aera2003.pdf
https://www3.nd.edu/~rwilliam/stats2/l13.pdf: good
*/


gen fam_income_impute_ind = 1 if family_income_1994 ==.
replace fam_income_impute_ind = 0 if family_income_1994 !=.



mi set wide 
mi register imputed family_income_1994
mi register  regular res_mom_occupation_w1 res_dad_occupation_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 race res_mom_at_home_leave_school_w1 res_mom_at_home_return_school_w1 res_dad_at_home_leave_school_w1 res_dad_at_home_return_school_w1

mi impute regress family_income_1994   i.res_mom_occupation_w1 i.res_dad_occupation_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.race i.res_mom_at_home_leave_school_w1 i.res_mom_at_home_return_school_w1 i.res_dad_at_home_leave_school_w1 i.res_dad_at_home_return_school_w1, add(30) force

mi rename res_mom_at_home_leave_school_w1  mom_leave_school_w1
mi rename res_mom_at_home_return_school_w1 mom_return_school_w1, noupdate
mi rename res_dad_at_home_leave_school_w1 dad_leave_school_w1, noupdate
mi rename res_dad_at_home_return_school_w1 dad_return_school_w1, noupdate



mi xeq 0 1 20: sum family_income_1994




mi estimate: reg eat_breakfast_w1  c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           





/*

destring FAMILY_ID, replace

destring SCID, replace
destring PSUSCID, replace













* do school fixed effect (ask why some data are dropped?)

xtset SSCHLCDE

xtset PSUSCID

xtset FAMILY_ID

xtset    W1COUNTY
xtset	W1STATE
xtreg tried_cigarette_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , fe 



xi: regress regular_cigarette_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 i.IMONTH i.PSUSCID 




*/


* testing
 mi xeq 0: reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r
 reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r


 
 * check fixed effect:
 how to do grouping with several fixed effect?


* do impute, mi impute


	reg eat_breakfast_w1  c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           



foreach yvariable in tv_hours_per_week_w1 video_hours_per_week_w1 computer_games_hours_per_week_w1 tv_video_comp_games_w1  eat_breakfast_w1 {
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 [pw=GSWGT1], r
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic [pw=GSWGT1], r

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 [pw=GSWGT1], r
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 [pw=GSWGT1], r
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r

	mi estimate: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind [pw=GSWGT1] , r





	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           
	mi estimate: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           




}








foreach yvariable in tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1  {
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 [pw=GSWGT1], r
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic [pw=GSWGT1], r

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 [pw=GSWGT1], r
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 [pw=GSWGT1], r
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r






	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           




}

foreach yvariable in ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1  {
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 [pw=GSWGT1], r
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic [pw=GSWGT1], r

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 [pw=GSWGT1], r
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 [pw=GSWGT1], r
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r






	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           




}







BMI_w1 BMI_zscore_w1 overweight_w1 obese_w1






















    
  

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
 

 
 
 

 
 
 
 
 

  
  
 
 
 
 
 
 
 
 
 
 
 
 
 
  
  
  
  
  
  
 ** important 
* other possible y variables:  res_mom_at_home_leave_school_w1 res_mom_at_home_return_school_w1 res_mom_at_home_go_to_bed_w1  
