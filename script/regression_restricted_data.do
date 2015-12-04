* new regression

set maxvar 32767
use "F:\temp_data\constructed_variables", clear

cd "F:\temp_result"








sum   tv_hours_per_week_w1 video_hours_per_week_w1 computer_games_hours_per_week_w1 tv_video_comp_games_w1  eat_breakfast_w1 ///
tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1 ///
ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1 ///
 BMI_w1 BMI_zscore_w1 overweight_w1 obese_w1 [aweight = GSWGT1]






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

mi impute regress family_income_1994   i.res_mom_occupation_w1 i.res_dad_occupation_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1 i.race i.res_mom_at_home_leave_school_w1 i.res_mom_at_home_return_school_w1 i.res_dad_at_home_leave_school_w1 i.res_dad_at_home_return_school_w1, add(15) force

mi rename res_mom_at_home_leave_school_w1  mom_leave_school_w1
mi rename res_mom_at_home_return_school_w1 mom_return_school_w1, noupdate
mi rename res_dad_at_home_leave_school_w1 dad_leave_school_w1, noupdate
mi rename res_dad_at_home_return_school_w1 dad_return_school_w1, noupdate


/* this is just for 5 imputations
mi xeq 0 1 5: sum family_income_1994


m=0 data:
-> sum family_income_1994

Variable         Obs	Mean	Std. Dev.	Min	Max
				
family_~1994      15,351	45.72816	51.61657	0	999

m=1 data:
-> sum family_income_1994

Variable         Obs	Mean	Std. Dev.	Min	Max
				
family_~1994      20,567	45.09695	51.49319	-134.7672	999

m=5 data:
-> sum family_income_1994

Variable         Obs	Mean	Std. Dev.	Min	Max
				
family_~1994      20,567	45.08111	51.83985	-138.8117	999
*/


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

egen month_PSUSCID =group(IMONTH PSUSCID)

areg tried_cigarette_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , absorb(month_PSUSCID)

xtset month_PSUSCID 
xtreg tried_cigarette_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 , fe


xi: regress tried_cigarette_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1  i.month_PSUSCID 







* testing
 mi xeq 0: reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r
 reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r

*/

 
 


* do impute, mi impute





egen month_PSUSCID =group(IMONTH PSUSCID)
egen month_W1STATE =group(IMONTH W1STATE)
egen month_FAMILY_ID =group(IMONTH FAMID)
egen month_PSUSCID_W1STATE = group(IMONTH PSUSCID W1STATE)
egen month_PSUSCID_W1STATE_FAMID = group(IMONTH PSUSCID W1STATE FAMID)





foreach yvariable in tv_hours_per_week_w1 video_hours_per_week_w1 computer_games_hours_per_week_w1 tv_video_comp_games_w1  eat_breakfast_w1 {
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  replace
		
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append
	
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, NO)

	mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind [pw=GSWGT1] , r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, YES)




	
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, NO)

	
    mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, YES)

	
	
	
	
	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_FAMILY_ID)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, YES, School FE, NO, State FE, NO, Imputed, YES)


	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_PSUSCID)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, YES, State FE, NO, Imputed, YES)


	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_W1STATE)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, NO, State FE, YES, Imputed, YES)

	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, YES, State FE, YES, Imputed, YES)

	





}









foreach yvariable in tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1  {
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  replace
		
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append
	
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, NO)

	mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind [pw=GSWGT1] , r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, YES)




	
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, NO)

	
    mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, YES)

	
	
	
	
	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_FAMILY_ID)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, YES, School FE, NO, State FE, NO, Imputed, YES)


	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_PSUSCID)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, YES, State FE, NO, Imputed, YES)


	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_W1STATE)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, NO, State FE, YES, Imputed, YES)

	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, YES, State FE, YES, Imputed, YES)

	


}




foreach yvariable in ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1 {
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  replace
		
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append
	
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, NO)

	mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind [pw=GSWGT1] , r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, YES)




	
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, NO)

	
    mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, YES)

	
	
	
	
	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_FAMILY_ID)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, YES, School FE, NO, State FE, NO, Imputed, YES)


	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_PSUSCID)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, YES, State FE, NO, Imputed, YES)


	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_W1STATE)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, NO, State FE, YES, Imputed, YES)

	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, YES, State FE, YES, Imputed, YES)

	

}











foreach yvariable in BMI_w1 BMI_zscore_w1 overweight_w1 obese_w1 {
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  replace
		
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append
	
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 [pw=GSWGT1], r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append

	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994  [pw=GSWGT1] , r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, NO)

	mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind [pw=GSWGT1] , r
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, YES)




	
	reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1   family_income_1994  i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, NO)

	
    mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r                           
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Imputed, YES)

	
	
	
	
	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_FAMILY_ID)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, YES, School FE, NO, State FE, NO, Imputed, YES)


	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_PSUSCID)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, YES, State FE, NO, Imputed, YES)


	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_W1STATE)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, NO, State FE, YES, Imputed, YES)

	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], r   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using `yvariable', word ctitle(`yvariable') excel  append addtext(Month FE, YES, Family FE, NO, School FE, YES, State FE, YES, Imputed, YES)

	

}
















 
 

  
  
  
  
  
  
  
  
  
  
  
  
  
  
  

  
  
  
  
  
  
  
  * for presentation 
  
  
  * cluster is the same as vce(cluster XXX)
 
 
* OLS, OLS*FE for smoking
 
 foreach yvariable in tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1  {

     mi estimate, post: reg `yvariable' res_mom_work_hours_v2_w1 zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)                          
	outreg2 using presnetation_smoke_ols, ctitle(`yvariable') excel tex append keep(res_mom_work_hours_v2_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
  
 
 foreach yvariable in tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1  {

	mi estimate, post: areg `yvariable' res_mom_work_hours_v2_w1 zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using presnetation_smoke_FE, ctitle(`yvariable') excel tex append keep(res_mom_work_hours_v2_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
   

 
 
 * interaction, interaction*FE  for smoking

 
 foreach yvariable in tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1  {


     mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)                          
	outreg2 using presnetation_smoke_interaction, ctitle(OLS `yvariable') excel tex append keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
 
 
 foreach yvariable in tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1  {

	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using presnetation_smoke_interaction_FE, ctitle(`yvariable') excel tex append keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
   
 
 
 
 
  
* OLS, OLS*FE  for alcohol
 
 foreach yvariable in ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1   {

     mi estimate, post: reg `yvariable' res_mom_work_hours_v2_w1 zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)                          
	outreg2 using presnetation_alcohol_ols, ctitle(`yvariable') excel tex append keep(res_mom_work_hours_v2_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
 } 
 
 foreach yvariable in ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1   {

	mi estimate, post: areg `yvariable' res_mom_work_hours_v2_w1 zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using presnetation_alcohol_FE, ctitle(`yvariable') excel tex append keep(res_mom_work_hours_v2_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
   

 
 
 * interaction, interaction*FE for alcohol
 
 foreach yvariable in ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1   {


     mi estimate, post: reg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1  family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)                          
	outreg2 using presnetation_alcohol_interaction, ctitle(OLS `yvariable') excel tex append keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
 
 }
 
 foreach yvariable in ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1   {

	mi estimate, post: areg `yvariable' c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $demographic  i.res_mom_occupation_w1 res_dad_work_hours_v2_w1  i.res_dad_occupation_w1 family_income_1994 i.fam_income_impute_ind i.decide_time_at_home_weekend_w1 i.decide_hang_around_with_w1 i.decide_what_u_wear_w1 i.decide_how_much_tv_w1 i.decide_what_tv_programs_w1 i.decide_what_time_go_bed_w1 i.decide_what_you_eat_w1 [pw=GSWGT1], vce(cluster PSUSCID)   absorb(month_PSUSCID_W1STATE)                        
	outreg2 using presnetation_alcohol_interaction_FE, ctitle(`yvariable') excel tex append keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) addnote(Standard errors are clustered at school level. Observations are weighted using the Add Health sampling weights.) 
}
   
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 foreach variable in  race res_mom_occupation_w1 res_dad_occupation_w1  {
 
 
 	tabulate `variable', gen(`variable'_dummy)

}

 
 
 
 
 * why aweight leads to smaller sample size????!!!!
 

 
 
estpost sum tried_cigarette_w1 regular_cigarette_w1 how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1 ///
ever_drink_alcohol_w1  drink_days_v2_w1 drink_amount_w1 drink_5_a_row_v2_w1 drink_very_high_v2_w1 total_drink_per_year_w1 ///
res_mom_work_hours_v2_w1 zConscientiousness_w1 age_w1 BIO_SEX race_dummy* num_siblings_w1 res_mom_occupation_w1_dummy* res_dad_occupation_w1_dummy* res_dad_work_hours_v2_w1  ///
family_income_1994 decide_time_at_home_weekend_w1 decide_hang_around_with_w1 ///
decide_what_u_wear_w1 decide_how_much_tv_w1 decide_what_tv_programs_w1 decide_what_time_go_bed_w1 decide_what_you_eat_w1 [aweight = GSWGT1]
 
 est store A 
esttab A using sum_stat.tex,  cells("count mean sd min max") replace 

 
  

  
  
  
 ** important 
* other possible y variables:  res_mom_at_home_leave_school_w1 res_mom_at_home_return_school_w1 res_mom_at_home_go_to_bed_w1  
