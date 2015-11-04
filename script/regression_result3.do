 
* change these things:

* cancel  zExtraversion_w1 zNeuroticism_w1 in every regression
* replace $dad_bg_impute by dad_bg in the 3rd, 4th and 5th regression
* replace  i.res_dad_work_hours_v2_w1 by i.res_dad_work_hours_impute_w1



* i.no_dad_w1 i.no_mom_w1 perfectly collinearite with mom born in US/dad born in US



 * 1) redo all imputation and put it in summary stat, put a list of what i have imputed and show it. impute res_mom_at_home_or_outside_w1 almost (done)

   * check variable mom_w1
   
   * put video hours in it
   
   * change the summary stat
   

   
   
   *** relabel the dummy
   ** check which one not in the summary stat
   
   * pick which one to interact
   * explain why data drops

   
   * 5) reorganize the code


   







foreach variable in hang_out_frds_w1 eat_breakfast_w1 drink_alcohol_w1 tried_cigarette_w1  error_alcohol_dummy ever_had_sex_w1 error_sex_dummy  ///
race BIO_SEX ///
abs_school_w1 suspension_w1 pay_attention_w1 get_along_stud_w1 get_along_teacher_w1 feel_safe_w1 grade_ELA_w1 grade_math_w1 /// 
bothered_by_things_w1 appetite_w1 felt_as_good_as_others_w1 trouble_concentrate_w1 felt_too_tired_w1 felt_hopeful_w1 felt_fearful_w1 talked_less_w1 felt_lonely_w1 felt_unfriendly_w1 hard_get_started_w1 life_not_worth_living_w1 ///
general_health_w1  ///
routine_phy_check_w1  gun_available_home_w1 ///
know_neighborhood_w1 environment_nearby_w1 neighborhood_gym_w1 neighborhood_safe_w1 move_out_happy_w1 building_type_w1 building_well_kept_w1  nearby_safe_w1 ///
mom_w1  dad_w1  ///
res_mom_educ_w1 res_mom_born_US_w1 res_mom_occupation_w1 res_mom_handicapped_w1 res_mom_smoked_w1 ///
res_dad_educ_w1 res_dad_born_US_w1 res_dad_occupation_w1 res_dad_handicapped_w1 res_dad_smoked_w1  ///
had_relationship_w1 ///
religion_group_w1  pray_times_w1 ///
adults_care_w1 teachers_care_w1 frds_care_w1 family_understands_w1 ///
expect_college_w1  ///
candid_w1 physical_mature_w1 third_person_presence_w1 resp_impatient_w1 resp_embarrassed_w1 ///
school_good_learn  school_safe  school_good ///
know_frds met_frds met_frds_parents talk_to_how_many_parents talk_about_school_grade talk_about_school_things  talk_to_teachers  make_decision_tgt time_to_bed ///
get_along_well trust_him son_interferes_u  ///
no_mom_w1 no_dad_w1  ///
expect_high_school_stud expect_hs {

	tabulate `variable', gen(`variable'_dummy)

}









* name too long

tab health_cause_soc_absence_w1, gen(health_abs_w1_dummy)
tab cigarettes_available_home_w1, gen(cigar_h_w1_dummy) 
tab alcohol_available_home_w1, gen(alcohol_j_w1_dummy)   
tab drugs_available_home_w1, gen(drugs_h_w1_dummy)  
tab attend_religious_service_w1, gen(attend_relig_w1_dummy)
tab participate_school_activities, gen(participate_w1_dummy)  




tab mom_full_time_mom_report_v2_w1 , gen(mom_report_hr_w1_dummy) 



tab res_mom_at_home_leave_school_w1 , gen(mom_avail_leave_w1_dummy)
tab res_mom_at_home_return_school_w1 , gen(mom_avail_return_w1_dummy)
tab res_mom_at_home_go_to_bed_w1 , gen(mom_avail_bed_dummy)
tab mom_stay_home_out_v2_w1 , gen(mom_work_home_w1_dummy)
tab decide_how_much_tv_w1 , gen(control_tv_w1_dummy)
tab decide_hang_around_with_w1 , gen(control_frd_w1_dummy)
tab decide_what_you_eat_w1 , gen(control_diet_w1_dummy)
tab res_dad_at_home_leave_school_w1 , gen(dad_avail_leave_w1_dummy)
tab res_dad_at_home_return_school_w1 , gen(dad_avail_return_w1_dummy)
tab res_dad_at_home_go_to_bed_w1 , gen(dad_avail_bed_dummy)
	





* dad work hours are skipped *dad_bg_impute

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

 
mdesc  ///
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
no_mom_w1* no_dad_w1* 





*************************************************************************************************************************************************************






	
ologit grade_math_w1   i.`xvariable'##c.zConscientiousness_w1  maybe good	
	 mom_stay_home_out_w1 decide_how_much_tv_w1 decide_what_tv_programs_w1 family_pays_attention_w1 
	
	
	H1DS6
		  possible controls: i.want_college_w1  i.mom_care_about_u_w1 family_attention allowance_w1    drink_days_w1

		  

	mom_stay_home_out_v2_w1 ?????

	
*************************************************************************************************************************************************************
cd D:\result3




local count_y 0



local yshort "tv frds breakfast alcohol cigar mariju  err_alcohol err_date smoke_frds drink_frds mariju_frds"  // change this
local xshort "work_hours_dum work_hours mom_home_leave mom_home_return mom_home_bed mom_work_home control_tv control_frds control_diet mom_at_home_index" // change this

* change this
foreach y in "reg tv_hours_per_week_w1" "ologit hang_out_frds_w1" "logit eat_breakfast_w1"  "logit drink_alcohol_w1" "logit tried_cigarette_w1" "reg how_many_times_marijuana_w1"   "probit error_alcohol_dummy" "logit error_date_dummy" "ologit smoke_frds_w1" "ologit drink_frds_w1" "oprobit marijuana_frds_w1"  {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

    foreach x in ib0.mom_full_time_mom_report_v2_w1  c.res_mom_work_hours_v2_w1  ib0.res_mom_at_home_leave_school_w1 ib0.res_mom_at_home_return_school_w1 ib1.res_mom_at_home_go_to_bed_w1 ib1.mom_stay_home_out_v2_w1 ib0.decide_how_much_tv_w1 ib0.decide_hang_around_with_w1 ib0.decide_what_you_eat_w1 ib0.mom_at_home_index_dummy {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'
	
	
	capture noisily `y' `x' [pweight = GSWGT1], r
	outreg2 using result_3_`a'_`b', ctitle(`yvariable')  excel append  keep(`x') replace

	capture noisily `y' `x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 

	capture noisily `y' `x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')

		

	capture noisily `y' `x' $control4 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 
	
	
	capture noisily `y' `x' $control5 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')
	
	capture noisily `y' `x' $control6 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')

	
	capture noisily `y' `x'##c.zConscientiousness_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x'##c.zConscientiousness_w1) 
	
	
 	capture noisily `y' `x'##c.zConscientiousness_w1  $control6 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x'##c.zConscientiousness_w1) 
	

	


	}

}



	
		  
	

local count_y 0



local yshort "sex err_sex "  // change this
local xshort "work_hours_dum work_hours mom_home_leave mom_home_return mom_home_bed mom_work_home control_tv control_frds control_diet mom_at_home_index" // change this

* change this
foreach y in  "logit ever_had_sex_w1" "logit error_sex_dummy"   {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

	 foreach x in ib0.mom_full_time_mom_report_v2_w1  c.res_mom_work_hours_v2_w1  ib0.res_mom_at_home_leave_school_w1 ib0.res_mom_at_home_return_school_w1 ib1.res_mom_at_home_go_to_bed_w1 ib1.mom_stay_home_out_v2_w1 ib0.decide_how_much_tv_w1 ib0.decide_hang_around_with_w1 ib0.decide_what_you_eat_w1  ib0.mom_at_home_index_dummy {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'
	
	
	capture noisily `y' `x' [pweight = GSWGT1], r
	outreg2 using result_3_`a'_`b', ctitle(`yvariable')  excel append  keep(`x') replace

	capture noisily `y' `x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 

	capture noisily `y' `x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')

		

	capture noisily `y' `x' $control4_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 
	
	capture noisily `y' `x' $control5_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 
	
	capture noisily `y' `x' $control6_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 

	
	capture noisily `y' `x'##c.zConscientiousness_w1 $control4_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x'##c.zConscientiousness_w1) 
	
	
	capture noisily `y' `x'##c.zConscientiousness_w1 $control6_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x'##c.zConscientiousness_w1) 
	
	


	}

}


	
	
	
	
	
	
	
	
	
*************************************************************************************************************************************************************

*************************************************************************************************************************************************************


*************************************************************************************************************************************************************	
	
cd C:\Users\AYSPS\Desktop\result2




local count_y 0



local yshort "tv frds breakfast alcohol cigar mariju  err_alcohol err_date smoke_frds drink_frds mariju_frds"  // change this
local xshort "wr_mom_home_leave wr_mom_home_return wr_mom_home_bed wr_mom_work_home wr_mom_at_home_index" // change this

* change this
foreach y in "reg tv_hours_per_week_w1" "ologit hang_out_frds_w1" "logit eat_breakfast_w1"  "logit drink_alcohol_w1" "logit tried_cigarette_w1" "reg how_many_times_marijuana_w1"   "logit error_alcohol_dummy" "logit error_date_dummy" "ologit smoke_frds_w1" "ologit drink_frds_w1" "ologit marijuana_frds_w1"   {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

	foreach x in  c.res_mom_work_hours_v2_w1##ib0.res_mom_at_home_leave_school_w1   c.res_mom_work_hours_v2_w1##ib0.res_mom_at_home_return_school_w1 c.res_mom_work_hours_v2_w1##ib1.res_mom_at_home_go_to_bed_w1 c.res_mom_work_hours_v2_w1##ib1.mom_stay_home_out_v2_w1   c.res_mom_work_hours_v2_w1##ib0.mom_at_home_index_dummy {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'
	
	
	`y' `x' [pweight = GSWGT1], r
	outreg2 using result_3_`a'_`b', ctitle(`yvariable')  excel append  keep(`x') replace

	`y' `x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 

	`y' `x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')

		

	`y' `x' $control4 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 
	
	
	`y' `x' $control5 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')
	
	`y' `x' $control6 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')

	
	`y' `x'##c.zConscientiousness_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x'##c.zConscientiousness_w1) 
	
	
	`y' `x'##c.zConscientiousness_w1  $control6 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x'##c.zConscientiousness_w1)  

	


	}

}



	
		  
	

local count_y 0



local yshort "sex err_sex "  // change this
local xshort "wr_mom_home_leave wr_mom_home_return wr_mom_home_bed wr_mom_work_home wr_mom_at_home_index" // change this

* change this
foreach y in  "logit ever_had_sex_w1" "logit error_sex_dummy"   {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

	foreach x in c.res_mom_work_hours_v2_w1##ib0.res_mom_at_home_leave_school_w1   c.res_mom_work_hours_v2_w1##ib0.res_mom_at_home_return_school_w1 c.res_mom_work_hours_v2_w1##ib1.res_mom_at_home_go_to_bed_w1 c.res_mom_work_hours_v2_w1##ib1.mom_stay_home_out_v2_w1   c.res_mom_work_hours_v2_w1##ib0.mom_at_home_index_dummy {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'
	
	
	`y' `x' [pweight = GSWGT1], r
	outreg2 using result_3_`a'_`b', ctitle(`yvariable')  excel append  keep(`x') replace

	`y' `x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 

	`y' `x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')

		

	`y' `x' $control4_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 
	
	`y' `x' $control5_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 
	
	`y' `x' $control6_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 

	
	`y' `x'##c.zConscientiousness_w1 $control4_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x'##c.zConscientiousness_w1) 
	
	
	`y' `x'##c.zConscientiousness_w1 $control6_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x'##c.zConscientiousness_w1) 
	
	


	}

}


	
	
		
	
	
	
	
	
*************************************************************************************************************************************************************
*************************************************************************************************************************************************************
*************************************************************************************************************************************************************	
	
	
	
	
	
cd C:\Users\AYSPS\Desktop\result2
	
	
	
local count_y 0



local yshort "tv frds breakfast  alcohol cigar mariju  err_alcohol "  // change this
local xshort "work_hours_dum work_hours"  // change this

* change this
foreach y in "reg tv_hours_per_week_w1" "ologit hang_out_frds_w1" "logit eat_breakfast_w1"  "logit drink_alcohol_w1" "logit tried_cigarette_w1" "reg how_many_times_marijuana_w1"   "logit error_alcohol_dummy"  {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

	foreach x in ib0.mom_full_time_mom_report_v2_w1  c.res_mom_work_hours_v2_w1    {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'	
	
	
	
	
	
	
	
	`y' `x'##i.res_mom_at_home_leave_school_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b'_interact,  ctitle(`yvariable')  excel append  keep(`x'##i.res_mom_at_home_leave_school_w1)
	
	
	`y' `x'##i.res_mom_at_home_return_school_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b'_interact,  ctitle(`yvariable')  excel append  keep(`x'##i.res_mom_at_home_return_school_w1) 
	
	
	`y' `x'##i.res_mom_at_home_go_to_bed_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b'_interact,  ctitle(`yvariable')  excel append  keep(`x'##i.res_mom_at_home_go_to_bed_w1) 
	
	
	`y' `x'##i.mom_stay_home_out_v2_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b'_interact,  ctitle(`yvariable')  excel append  keep(`x'##i.mom_stay_home_out_v2_w1)
	
	
	
	}

}

	
	
	
	
	
	
local count_y 0



local yshort "sex err_sex"  // change this
local xshort "work_hours_dum work_hours" // change this

* change this
foreach y in "logit ever_had_sex_w1"  "logit error_sex_dummy"  {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

	foreach x in ib0.mom_full_time_mom_report_v2_w1  c.res_mom_work_hours_v2_w1    {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'	
	
	
	
	
	
	
	
	`y' `x'##i.res_mom_at_home_leave_school_w1  $control4_for_sex [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b'_interact,  ctitle(`yvariable')  excel append  keep(`x'##i.res_mom_at_home_leave_school_w1)
	
	
	`y' `x'##i.res_mom_at_home_return_school_w1  $control4_for_sex [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b'_interact,  ctitle(`yvariable')  excel append  keep(`x'##i.res_mom_at_home_return_school_w1) 
	
	
	`y' `x'##i.res_mom_at_home_go_to_bed_w1  $control4_for_sex [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b'_interact,  ctitle(`yvariable')  excel append  keep(`x'##i.res_mom_at_home_go_to_bed_w1) 
	
	
	`y' `x'##i.mom_stay_home_out_v2_w1 $control4_for_sex [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b'_interact,  ctitle(`yvariable')  excel append  keep(`x'##i.mom_stay_home_out_v2_w1)
	
	
	}

}

	
	
	
	
	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
*************************************************************************************************************************************************************
*************************************************************************************************************************************************************
*************************************************************************************************************************************************************	

	
cd D:\result4

 ******** H1GH33


 

local count_y 0



local yshort "tv frds breakfast alcohol cigar mariju  err_alcohol err_date smoke_frds drink_frds mariju_frds"  // change this
local xshort "work_hours_dum work_hours mom_work_home interact" // change this

* change this
foreach y in "reg tv_hours_per_week_w1" "ologit hang_out_frds_w1" "logit eat_breakfast_w1"  "logit drink_alcohol_w1" "logit tried_cigarette_w1" "reg how_many_times_marijuana_w1"   "probit error_alcohol_dummy" "logit error_date_dummy" "ologit smoke_frds_w1" "ologit drink_frds_w1" "oprobit marijuana_frds_w1"  {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

    foreach x in ib0.mom_full_time_mom_report_v2_w1  c.res_mom_work_hours_v2_w1  ib0.mom_work_home_w1 c.res_mom_work_hours_v2_w1##ib0.mom_work_home_w1  {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'
	
	
	capture noisily `y' `x' [pweight = GSWGT1], r
	outreg2 using result_3_`a'_`b', ctitle(`yvariable')  excel append  keep(`x') replace

	capture noisily `y' `x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 

	capture noisily `y' `x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')

		

	capture noisily `y' `x' $control4 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 
	
	
	capture noisily `y' `x' $control5 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')
	
	capture noisily `y' `x' $control6 [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')
	

	}

}



	
		  
	

local count_y 0



local yshort "sex err_sex "  // change this
local xshort "work_hours_dum work_hours mom_work_home interact" // change this

* change this
foreach y in  "logit ever_had_sex_w1" "logit error_sex_dummy"   {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

	 foreach x in ib0.mom_full_time_mom_report_v2_w1  c.res_mom_work_hours_v2_w1  ib0.mom_work_home_w1 c.res_mom_work_hours_v2_w1##ib0.mom_work_home_w1 {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'
	
	
	capture noisily `y' `x' [pweight = GSWGT1], r
	outreg2 using result_3_`a'_`b', ctitle(`yvariable')  excel append  keep(`x') replace

	capture noisily `y' `x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 

	capture noisily `y' `x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x')

		

	capture noisily `y' `x' $control4_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 
	
	capture noisily `y' `x' $control5_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 
	
	capture noisily `y' `x' $control6_for_sex  [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable')  excel append  keep(`x') 

	

	}

}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
*************************************************************************************************************************************************************
*************************************************************************************************************************************************************
*************************************************************************************************************************************************************	
	
	
cd D:\result6


  
 
 

local count_y 0



local yshort "brk_snack brk exercise diet alcohol cigar  err_alcohol"  // change this
local xshort "WFH_v2 " // change this

* change this
foreach y in  "probit breakfast_snack_w1" "probit eat_breakfast_w1"  "probit exercise_for_weight_w1 " "probit diet_for_weight_w1" "probit drink_alcohol_w1"  "probit regular_cigarette_w1" "probit error_alcohol_dummy"  {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

    foreach x in  ib1.mom_work_home_w1     {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'
	
	
	capture noisily `y' `x' [pweight = GSWGT1], r	
	outreg2 using result_3_`a'_`b', ctitle(`yvariable') nocons excel tex append  keep(`x') replace label
	margins, dydx(mom_work_home_w1) post noestimcheck
	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x') replace label
	
	

	capture noisily `y' `x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x')  label
	margins, dydx(mom_work_home_w1) post noestimcheck
	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x') label

	
	capture noisily `y' `x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label
	margins, dydx(mom_work_home_w1) post noestimcheck
	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x')  label

		

	capture noisily `y' `x' $control4 i.IMONTH i.SCH_YR [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label
	margins, dydx(mom_work_home_w1) post noestimcheck
	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x')  label
	
	
	capture noisily `y' `x' $control5 i.IMONTH i.SCH_YR [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons  excel tex append  keep(`x') label
	margins, dydx(mom_work_home_w1) post noestimcheck
	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x')  label
	


	}

}



	
		  
	

local count_y 0



local yshort "sex err_sex "  // change this
local xshort "WFH_v2 " // change this

* change this
foreach y in  "probit ever_had_sex_w1" "probit error_sex_dummy"   {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

	 foreach x in ib1.mom_work_home_w1   {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'
	
	
	capture noisily `y' `x' [pweight = GSWGT1], r
	outreg2 using result_3_`a'_`b', ctitle(`yvariable') nocons excel tex append  keep(`x') replace label
	margins, dydx(mom_work_home_w1) post noestimcheck
	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x') replace label

	capture noisily `y' `x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label	 
	margins, dydx(mom_work_home_w1) post noestimcheck
	outreg2 using result_3_`a'_`b'_margin,  ctitle(`yvariable') nocons excel tex append  keep(`x')  label

	capture noisily `y' `x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label	
	margins, dydx(mom_work_home_w1) post noestimcheck
	outreg2 using result_3_`a'_`b'_margin,  ctitle(`yvariable') nocons excel tex append  keep(`x') label

		

	capture noisily `y' `x' $control4_for_sex  i.IMONTH i.SCH_YR [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label
	margins, dydx(mom_work_home_w1) post noestimcheck
	outreg2 using result_3_`a'_`b'_margin,  ctitle(`yvariable') nocons  excel tex append  keep(`x') label
	
	capture noisily `y' `x' $control5_for_sex  i.IMONTH i.SCH_YR [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label	
	margins, dydx(mom_work_home_w1) post noestimcheck
	outreg2 using result_3_`a'_`b'_margin,  ctitle(`yvariable') nocons excel tex append  keep(`x')  label
	

	

	}

}
















 

local count_y 0



local yshort "brk_snack brk exercise diet alcohol cigar  err_alcohol"  // change this
local xshort "WFH_int_v2" // change this

* change this
foreach y in  "probit breakfast_snack_w1" "probit eat_breakfast_w1"  "probit exercise_for_weight_w1 " "probit diet_for_weight_w1" "probit drink_alcohol_w1"  "probit regular_cigarette_w1" "probit error_alcohol_dummy"  {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

    foreach x in   c.zConscientiousness_w1##ib1.mom_work_home_w1   {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'
	
	
	capture noisily `y' `x' [pweight = GSWGT1], r	
	outreg2 using result_3_`a'_`b', ctitle(`yvariable') nocons excel tex append  keep(`x') replace label
	margins  ,dydx(zConscientiousness_w1) over(mom_work_home_w1) noestimcheck post
	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x') replace label
	
	

	capture noisily `y' `x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x')  label
	margins  ,dydx(zConscientiousness_w1) over(mom_work_home_w1) noestimcheck post

	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x') label

	
	capture noisily `y' `x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label
	margins  ,dydx(zConscientiousness_w1) over(mom_work_home_w1) noestimcheck post
	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x') label

		

	capture noisily `y' `x' $control4 i.IMONTH i.SCH_YR [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label
	margins  ,dydx(zConscientiousness_w1) over(mom_work_home_w1) noestimcheck post
	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x') label
	
	
	capture noisily `y' `x' $control5 i.IMONTH i.SCH_YR [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons  excel tex append  keep(`x') label
	margins  ,dydx(zConscientiousness_w1) over(mom_work_home_w1) noestimcheck post
	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x') label
	


	}

}



	
	
	
	
	
	
		  
	

local count_y 0



local yshort "sex err_sex "  // change this
local xshort " WFH_int_v2" // change this

* change this
foreach y in  "probit ever_had_sex_w1" "probit error_sex_dummy"   {



local count_y = `count_y' + 1
local a : word `count_y' of `yshort'


local count_x 0


	* change this

	 foreach x in  c.zConscientiousness_w1##ib1.mom_work_home_w1  {

	
	local count_x = `count_x' + 1
	local b : word `count_x' of `xshort'
	
	
	capture noisily `y' `x' [pweight = GSWGT1], r
	outreg2 using result_3_`a'_`b', ctitle(`yvariable') nocons excel tex append  keep(`x') replace label
	margins  ,dydx(zConscientiousness_w1) over(mom_work_home_w1) noestimcheck post
	outreg2 using result_3_`a'_`b'_margin, ctitle(`yvariable') nocons excel tex append  keep(`x') replace label

	capture noisily `y' `x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label	 
	margins  ,dydx(zConscientiousness_w1) over(mom_work_home_w1) noestimcheck post
	outreg2 using result_3_`a'_`b'_margin,  ctitle(`yvariable') nocons excel tex append  keep(`x')  label

	capture noisily `y' `x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label	
	margins  ,dydx(zConscientiousness_w1) over(mom_work_home_w1) noestimcheck post
	outreg2 using result_3_`a'_`b'_margin,  ctitle(`yvariable') nocons excel tex append  keep(`x') label

		

	capture noisily `y' `x' $control4_for_sex  i.IMONTH i.SCH_YR [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label
	margins  ,dydx(zConscientiousness_w1) over(mom_work_home_w1) noestimcheck post
	outreg2 using result_3_`a'_`b'_margin,  ctitle(`yvariable') nocons  excel tex append  keep(`x') label
	
	capture noisily `y' `x' $control5_for_sex  i.IMONTH i.SCH_YR [pweight = GSWGT1],r
	outreg2 using result_3_`a'_`b',  ctitle(`yvariable') nocons excel tex append  keep(`x') label	
	margins  ,dydx(zConscientiousness_w1) over(mom_work_home_w1) noestimcheck post
	outreg2 using result_3_`a'_`b'_margin,  ctitle(`yvariable') nocons excel tex append  keep(`x')  label
	

	

	}

}
	


























	

	
	
	
	
	
	
	
	
		probit exercise_for_weight_w1 c.zConscientiousness_w1 ib2.mom_stay_home_out_v2_w1##i.SCH_YR $control6  i.IMONTH  [pweight = GSWGT1],r

	
	
	
	
	
	
	probit breakfast_snack_w1 ib2.mom_stay_home_out_v2_w1 $control5  i.IMONTH i.SCH_YR [pweight = GSWGT1],r
	probit breakfast_snack_w1 ib2.mom_stay_home_out_v2_w1 $control5_d  IMONTH_d* SCH_YR_d* [pweight = GSWGT1],r

	
	
	
probit exercise_for_weight_w1 zConscientiousness_w1 mom_stay_home_out_v2_w1_d2 WFH_int_v1_2 WFH_int_v1_1 WFH_int_v1_4 WFH_int_v1_5 WFH_int_v1_6 mom_stay_home_out_v2_w1_d1 mom_stay_home_out_v2_w1_d4  mom_stay_home_out_v2_w1_d5 mom_stay_home_out_v2_w1_d6  $control5_d IMONTH_d* SCH_YR_d* [pweight = GSWGT1],r
inteff exercise_for_weight_w1 zConscientiousness_w1 mom_stay_home_out_v2_w1_d2 WFH_int_v1_2 WFH_int_v1_1 WFH_int_v1_4 WFH_int_v1_5 WFH_int_v1_6 mom_stay_home_out_v2_w1_d1 mom_stay_home_out_v2_w1_d4  mom_stay_home_out_v2_w1_d5 mom_stay_home_out_v2_w1_d6  $control5_d IMONTH_d* SCH_YR_d* , savedata(C:\Users\AYSPS\Desktop\logit_inteff,replace) savegraph1(C:\Users\AYSPS\Desktop\figure1, replace) savegraph2(C:\Users\AYSPS\Desktop\figure2, replace)



probit exercise_for_weight_w1 c.zConscientiousness_w1##ib2.mom_stay_home_out_v2_w1 $control2 i.IMONTH i.SCH_YR [pweight = GSWGT1],r
probit exercise_for_weight_w1 zConscientiousness_w1 mom_stay_home_out_v2_w1_d2 WFH_int_v1_2 WFH_int_v1_1 WFH_int_v1_4 WFH_int_v1_5 WFH_int_v1_6 mom_stay_home_out_v2_w1_d1 mom_stay_home_out_v2_w1_d4  mom_stay_home_out_v2_w1_d5 mom_stay_home_out_v2_w1_d6  $control2_d IMONTH_d* SCH_YR_d* [pweight = GSWGT1],r
inteff exercise_for_weight_w1 zConscientiousness_w1 mom_stay_home_out_v2_w1_d2 WFH_int_v1_2 WFH_int_v1_1 WFH_int_v1_4 WFH_int_v1_5 WFH_int_v1_6 mom_stay_home_out_v2_w1_d1 mom_stay_home_out_v2_w1_d4  mom_stay_home_out_v2_w1_d5 mom_stay_home_out_v2_w1_d6  $control2_d IMONTH_d* SCH_YR_d* , savedata(C:\Users\AYSPS\Desktop\logit_inteff,replace) savegraph1(C:\Users\AYSPS\Desktop\figure1, replace) savegraph2(C:\Users\AYSPS\Desktop\figure2, replace)

	

	
	
	
	probit exercise_for_weight_w1 c.zConscientiousness_w1 ib2.mom_stay_home_out_v2_w1##i.SCH_YR $control6  i.IMONTH  [pweight = GSWGT1],r
	margins ib2.mom_stay_home_out_v2_w1##i.SCH_YR, noestimcheck vsquish
	
	
	
		outreg2 using test,  ctitle(`yvariable') nocons excel replace keep( ib2.mom_stay_home_out_v2_w1)

	
	inteff exercise_for_weight_w1 zConscientiousness_w1  
	
	
	
	* write out the factor variables to obtain the inteff number
	
	
	
	
	
	
	
probit exercise_for_weight_w1 c.zConscientiousness_w1##ib2.mom_stay_home_out_v2_w1 $control5  i.IMONTH i.SCH_YR [pweight = GSWGT1],r
probit exercise_for_weight_w1 zConscientiousness_w1 mom_stay_home_out_v2_w1_d2 WFH_int_v1_2 WFH_int_v1_1 WFH_int_v1_4 WFH_int_v1_5 WFH_int_v1_6 mom_stay_home_out_v2_w1_d1 mom_stay_home_out_v2_w1_d4  mom_stay_home_out_v2_w1_d5 mom_stay_home_out_v2_w1_d6  $control2_d no_mom_w1_d* no_dad_w1_d* IMONTH_d* SCH_YR_d* [pweight = GSWGT1],r
inteff exercise_for_weight_w1 zConscientiousness_w1 mom_stay_home_out_v2_w1_d2 WFH_int_v1_2 WFH_int_v1_1 WFH_int_v1_4 WFH_int_v1_5 WFH_int_v1_6 mom_stay_home_out_v2_w1_d1 mom_stay_home_out_v2_w1_d4  mom_stay_home_out_v2_w1_d5 mom_stay_home_out_v2_w1_d6  $control2_d no_mom_w1_d* no_dad_w1_d* IMONTH_d* SCH_YR_d* , savedata(C:\Users\AYSPS\Desktop\logit_inteff,replace) savegraph1(C:\Users\AYSPS\Desktop\figure1, replace) savegraph2(C:\Users\AYSPS\Desktop\figure2, replace)
	
	
	
	
	
	
	
	
	
	
	
	

	
*	try sleep time
*  listen_radio_hours_per_week_w1	
	
	
	
	* good
reg tv_hours_per_week_w1 ib0.mom_full_time_mom_report_v2_w1 $control3 res_dad_work_hours_v2_w1 i.grade_ELA_w1 i.grade_math_w1 i.trouble_concentrate_w1 i.felt_lonely_w1 i.general_health_w1 family_income_1994 i.environment_nearby_w1 i.adults_care_w1  $income_and_expectation i.candid_w1 i.school_good_learn  i.school_safe  i.school_good i.know_frds i.met_frds_parents i.talk_to_teachers i.participate_school_activities i.trust_him i.expect_hs [pweight = GSWGT1],r  
			
reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1 $control3 res_dad_work_hours_v2_w1  i.grade_ELA_w1 i.grade_math_w1 i.trouble_concentrate_w1 i.felt_lonely_w1 i.general_health_w1 family_income_1994 i.environment_nearby_w1 i.adults_care_w1  $income_and_expectation i.candid_w1 i.school_good_learn  i.school_safe  i.school_good i.know_frds i.met_frds_parents i.talk_to_teachers i.participate_school_activities i.trust_him i.expect_hs [pweight = GSWGT1],r  
			
	
reg tv_hours_per_week_w1 ib0.mom_work_home_w1 $control3 res_dad_work_hours_v2_w1  i.grade_ELA_w1 i.grade_math_w1 i.trouble_concentrate_w1 i.felt_lonely_w1 i.general_health_w1 family_income_1994 i.environment_nearby_w1 i.adults_care_w1  $income_and_expectation i.candid_w1 i.school_good_learn  i.school_safe  i.school_good i.know_frds i.met_frds_parents i.talk_to_teachers i.participate_school_activities i.trust_him i.expect_hs [pweight = GSWGT1],r  
			
	
	
	
	* ok
logit drink_alcohol_w1 ib0.mom_full_time_mom_report_v2_w1	$control3 res_dad_work_hours_v2_w1  i.grade_ELA_w1 i.grade_math_w1 i.trouble_concentrate_w1 i.felt_lonely_w1 i.general_health_w1 family_income_1994 i.environment_nearby_w1 i.adults_care_w1  $income_and_expectation i.candid_w1 i.school_good_learn  i.school_safe  i.school_good i.know_frds i.met_frds_parents i.talk_to_teachers i.participate_school_activities i.trust_him i.expect_hs i.alcohol_available_home_w1 i.drink_alcohol_spouse [pweight = GSWGT1],r  
			
logit drink_alcohol_w1 c.res_mom_work_hours_v2_w1 $control3 res_dad_work_hours_v2_w1  i.grade_ELA_w1 i.grade_math_w1 i.trouble_concentrate_w1 i.felt_lonely_w1 i.general_health_w1 family_income_1994 i.environment_nearby_w1 i.adults_care_w1  $income_and_expectation i.candid_w1 i.school_good_learn  i.school_safe  i.school_good i.know_frds i.met_frds_parents i.talk_to_teachers i.participate_school_activities i.trust_him i.expect_hs i.alcohol_available_home_w1 i.drink_alcohol_spouse [pweight = GSWGT1],r  
			
logit drink_alcohol_w1 ib0.mom_work_home_w1	$control3 res_dad_work_hours_v2_w1  i.grade_ELA_w1 i.grade_math_w1 i.trouble_concentrate_w1 i.felt_lonely_w1 i.general_health_w1 family_income_1994 i.environment_nearby_w1 i.adults_care_w1  $income_and_expectation i.candid_w1 i.school_good_learn  i.school_safe  i.school_good i.know_frds i.met_frds_parents i.talk_to_teachers i.participate_school_activities i.trust_him i.expect_hs i.alcohol_available_home_w1 i.drink_alcohol_spouse [pweight = GSWGT1],r  
			

	
	* good
logit tried_cigarette_w1 ib0.mom_full_time_mom_report_v2_w1	$control3 res_dad_work_hours_v2_w1
logit tried_cigarette_w1 c.res_mom_work_hours_v2_w1	$control3 res_dad_work_hours_v2_w1
logit tried_cigarette_w1 ib0.mom_work_home_w1	$control3 res_dad_work_hours_v2_w1


* bad
logit marijunan_dum ib0.mom_full_time_mom_report_v2_w1 $control3 res_dad_work_hours_v2_w1
logit marijunan_dum c.res_mom_work_hours_v2_w1 $control3 res_dad_work_hours_v2_w1
logit marijunan_dum ib0.mom_work_home_w1 $control3 res_dad_work_hours_v2_w1


* ok
logit error_alcohol_dummy ib0.mom_full_time_mom_report_v2_w1 $control3 res_dad_work_hours_v2_w1
logit error_alcohol_dummy c.res_mom_work_hours_v2_w1 $control3 res_dad_work_hours_v2_w1
logit error_alcohol_dummy ib0.mom_work_home_w1 $control3 res_dad_work_hours_v2_w1

* ok
logit error_date_dummy ib0.mom_full_time_mom_report_v2_w1	$control3 res_dad_work_hours_v2_w1
logit error_date_dummy c.res_mom_work_hours_v2_w1	$control3 res_dad_work_hours_v2_w1
logit error_date_dummy ib0.mom_work_home_w1 $control3 res_dad_work_hours_v2_w1
	
* bad	
logit ever_had_sex_w1 ib0.mom_full_time_mom_report_v2_w1 $control3 res_dad_work_hours_v2_w1
logit ever_had_sex_w1 c.res_mom_work_hours_v2_w1 $control3 res_dad_work_hours_v2_w1
logit ever_had_sex_w1 ib0.mom_work_home_w1 $control3 res_dad_work_hours_v2_w1

 * poor
logit error_sex_dummy ib0.mom_full_time_mom_report_v2_w1 $control3 res_dad_work_hours_v2_w1	
logit error_sex_dummy c.res_mom_work_hours_v2_w1 $control3 res_dad_work_hours_v2_w1	
logit error_sex_dummy ib0.mom_work_home_w1 $control3 res_dad_work_hours_v2_w1	
	
	
* super good for the first one!	but super bad for the others
logit error_sex_dummy ib0.mom_work_home_w1 $control6_for_sex [pweight = GSWGT1],r	
logit error_sex_dummy c.res_mom_work_hours_v2_w1 $control6_for_sex [pweight = GSWGT1],r	
logit error_sex_dummy ib0.mom_full_time_mom_report_v2_w1 $control6_for_sex [pweight = GSWGT1],r	
	
	
	
	
	
	
	
	
	
	
	
	
	




	* res_mom_work_hours mom report

	
	reg tv_hours_per_week_w1 i.mom_full_time_mom_report_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_tv_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1) replace

	reg tv_hours_per_week_w1 i.mom_full_time_mom_report_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1) 

	reg tv_hours_per_week_w1 i.mom_full_time_mom_report_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1)

		

	reg tv_hours_per_week_w1 i.mom_full_time_mom_report_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1) 

	
	reg tv_hours_per_week_w1 i.mom_full_time_mom_report_v2_w1##c.zConscientiousness_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1##c.zConscientiousness_w1) 
	

	/*
	reg tv_hours_per_week_w1 i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy) 
	
	
	reg tv_hours_per_week_w1 i.mom_full_time_mom_report_v2_w1##i.mom_stay_home_out_v2_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy) 
	*/
	
	
	
	* res_mom_work_hours children report
	
	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_tv_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)

		

	reg tv_hours_per_week_w1 res_mom_work_hours_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 
	
	/*
	reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy) 
	
	
* reg tv_hours_per_week_w1 c.res_mom_work_hours_v2_w1##i.res_mom_at_home_go_to_bed_w1  $control4,r ???/?

	*/


	* res mom at home or not
		
	reg tv_hours_per_week_w1 i.mom_at_home_index_dummy [pweight = GSWGT1], r
	outreg2 using result_3_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	reg tv_hours_per_week_w1 i.mom_at_home_index_dummy $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	reg tv_hours_per_week_w1 i.mom_at_home_index_dummy $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	* res_dad_work_hours_v2_w1 zExtraversion_w1 zNeuroticism_w1
	
	reg tv_hours_per_week_w1 i.mom_at_home_index_dummy  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

		
	reg tv_hours_per_week_w1 i.mom_at_home_index_dummy##c.zConscientiousness_w1   $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy##c.zConscientiousness_w1 ) 

	

	
	
	* res mom at home or not_v2
		
	reg tv_hours_per_week_w1 i.mom_stay_home_out_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_stay_home_out_v2_w1) replace

	reg tv_hours_per_week_w1 i.mom_stay_home_out_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_stay_home_out_v2_w1) 

	reg tv_hours_per_week_w1 i.mom_stay_home_out_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_stay_home_out_v2_w1) 

	
	reg tv_hours_per_week_w1 i.mom_stay_home_out_v2_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_stay_home_out_v2_w1) 

		
	reg tv_hours_per_week_w1 i.mom_stay_home_out_v2_w1##c.zConscientiousness_w1   $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_home, word ctitle(`yvariable')  excel append  keep(i.mom_stay_home_out_v2_w1##c.zConscientiousness_w1 ) 


	
	
	

	* res mom control
	
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1 [pweight = GSWGT1], r
	outreg2 using result_3_tv_control, word ctitle(`yvariable')  excel append  keep(i.decide_how_much_tv_w1) replace


	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_control, word ctitle(`yvariable')  excel append  keep(i.decide_how_much_tv_w1) 
	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_control, word ctitle(`yvariable')  excel append  keep(i.decide_how_much_tv_w1) 


	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_control, word ctitle(`yvariable')  excel append  keep(i.decide_how_much_tv_w1) 

	
	reg tv_hours_per_week_w1 i.decide_how_much_tv_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_control, word ctitle(`yvariable')  excel append  keep(i.decide_how_much_tv_w1##c.zConscientiousness_w1) 
	


	


 


	

		
		
		
	
*************************************************************************************************************************************************************	
	* res_mom_work_hours mom report

	
	ologit hang_out_frds_w1 i.mom_full_time_mom_report_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_frd_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1) replace

	ologit hang_out_frds_w1 i.mom_full_time_mom_report_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_frd_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1) 

	ologit hang_out_frds_w1 i.mom_full_time_mom_report_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_frd_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1) 


	ologit hang_out_frds_w1 i.mom_full_time_mom_report_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_frd_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1) 

	
	ologit hang_out_frds_w1 i.mom_full_time_mom_report_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_frd_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1##c.zConscientiousness_w1) 
	
	
	ologit hang_out_frds_w1 i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_frd_workhour2, word ctitle(`yvariable')  excel append  keep(i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy)

	
	* res_mom_work_hours
	
	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_frd_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_frd_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_frd_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	ologit hang_out_frds_w1 res_mom_work_hours_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_frd_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	ologit hang_out_frds_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_frd_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 
	
	
	ologit hang_out_frds_w1 c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_frd_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy)


	* res mom at home or not
		
	ologit hang_out_frds_w1 i.mom_at_home_index_dummy [pweight = GSWGT1], r
	outreg2 using result_3_frd_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	ologit hang_out_frds_w1 i.mom_at_home_index_dummy $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_frd_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	ologit hang_out_frds_w1 i.mom_at_home_index_dummy $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_frd_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	ologit hang_out_frds_w1 i.mom_at_home_index_dummy  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_frd_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	ologit hang_out_frds_w1 i.mom_at_home_index_dummy##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_frd_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy##c.zConscientiousness_w1) 
	 


	
	

	* res mom control
	
	
	ologit hang_out_frds_w1 i.decide_hang_around_with_w1 [pweight = GSWGT1], r
	outreg2 using result_3_frd_control, word ctitle(`yvariable')  excel append  keep(i.decide_hang_around_with_w1) replace

	ologit hang_out_frds_w1 i.decide_hang_around_with_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_frd_control, word ctitle(`yvariable')  excel append  keep(i.decide_hang_around_with_w1) 

	ologit hang_out_frds_w1 i.decide_hang_around_with_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_frd_control, word ctitle(`yvariable')  excel append  keep(i.decide_hang_around_with_w1) 


	ologit hang_out_frds_w1 i.decide_hang_around_with_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_frd_control, word ctitle(`yvariable')  excel append  keep(i.decide_hang_around_with_w1) 

	
	ologit hang_out_frds_w1 i.decide_hang_around_with_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_frd_control, word ctitle(`yvariable')  excel append  keep(i.decide_hang_around_with_w1##c.zConscientiousness_w1) 
	


	


	
	
	

	
	
*************************************************************************************************************************************************************	
	
	
	* res_mom_work_hours mom report



	probit eat_breakfast_w1 i.mom_full_time_mom_report_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_breakfast_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace


	probit eat_breakfast_w1 i.mom_full_time_mom_report_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_breakfast_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit eat_breakfast_w1 i.mom_full_time_mom_report_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_breakfast_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit eat_breakfast_w1 i.mom_full_time_mom_report_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_breakfast_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	probit eat_breakfast_w1 i.mom_full_time_mom_report_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_breakfast_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 
	
	probit eat_breakfast_w1 i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_breakfast_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy)


	
	* res_mom_work_hours
	
	probit eat_breakfast_w1 res_mom_work_hours_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_breakfast_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace


	probit eat_breakfast_w1 res_mom_work_hours_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_breakfast_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit eat_breakfast_w1 res_mom_work_hours_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_breakfast_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit eat_breakfast_w1 res_mom_work_hours_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_breakfast_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	probit eat_breakfast_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_breakfast_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 
	
	probit eat_breakfast_w1 c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_breakfast_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy)

	
	
	* res mom at home or not
		
	probit eat_breakfast_w1 i.mom_at_home_index_dummy [pweight = GSWGT1], r 
	outreg2 using result_3_breakfast_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	probit eat_breakfast_w1 i.mom_at_home_index_dummy $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_breakfast_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit eat_breakfast_w1 i.mom_at_home_index_dummy $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_breakfast_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy)


	probit eat_breakfast_w1 i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_breakfast_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	probit eat_breakfast_w1 i.mom_at_home_index_dummy##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_breakfast_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy##c.zConscientiousness_w1) 
	


	
	

	* res mom control (eat breakfast = have nothing for breakfast)
	
	
	probit eat_breakfast_w1 i.decide_what_you_eat_w1 [pweight = GSWGT1], r
	outreg2 using result_3_breakfast_control, word ctitle(`yvariable')  excel append  keep(i.decide_what_you_eat_w1) replace

	probit eat_breakfast_w1 i.decide_what_you_eat_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_breakfast_control, word ctitle(`yvariable')  excel append  keep(i.decide_what_you_eat_w1) 

	probit eat_breakfast_w1 i.decide_what_you_eat_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_breakfast_control, word ctitle(`yvariable')  excel append  keep(i.decide_what_you_eat_w1) 


	probit eat_breakfast_w1 i.decide_what_you_eat_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_breakfast_control, word ctitle(`yvariable')  excel append  keep(i.decide_what_you_eat_w1) 

	
	probit eat_breakfast_w1 i.decide_what_you_eat_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r	
	outreg2 using result_3_breakfast_control, word ctitle(`yvariable')  excel append  keep(i.decide_what_you_eat_w1##c.zConscientiousness_w1) 


	





	
	
*************************************************************************************************************************************************************


	
	* res_mom_work_hours mom report

	
	probit ever_had_sex_w1 i.mom_full_time_mom_report_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_sex_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit ever_had_sex_w1 i.mom_full_time_mom_report_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_sex_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit ever_had_sex_w1 i.mom_full_time_mom_report_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_sex_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit ever_had_sex_w1 i.mom_full_time_mom_report_v2_w1  $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_sex_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

		

	probit ever_had_sex_w1 i.mom_full_time_mom_report_v2_w1##c.zConscientiousness_w1 $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_sex_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 
	
	probit ever_had_sex_w1 i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_sex_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy)	
	
	
	
	* res_mom_work_hours
	
	probit ever_had_sex_w1 res_mom_work_hours_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit ever_had_sex_w1 res_mom_work_hours_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit ever_had_sex_w1 res_mom_work_hours_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit ever_had_sex_w1 res_mom_work_hours_v2_w1  $control4_for_sex i.had_relationship_w1,r
	outreg2 using result_3_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

		

	probit ever_had_sex_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_sex_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 
	
	probit ever_had_sex_w1 c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_sex_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy) 
	



	* res mom at home or not
		
	probit ever_had_sex_w1 i.mom_at_home_index_dummy [pweight = GSWGT1], r
	outreg2 using result_3_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace
	
	probit ever_had_sex_w1 i.mom_at_home_index_dummy $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit ever_had_sex_w1 i.mom_at_home_index_dummy $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	probit ever_had_sex_w1 i.mom_at_home_index_dummy $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	probit ever_had_sex_w1 i.mom_at_home_index_dummy##c.zConscientiousness_w1 $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy##c.zConscientiousness_w1) 

	
	
	




	
	

	* res mom control (not available)
	
	

	




	
*************************************************************************************************************************************************************	
	* res_mom_work_hours mom report


	probit drink_alcohol_w1 i.mom_full_time_mom_report_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit drink_alcohol_w1 i.mom_full_time_mom_report_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit drink_alcohol_w1 i.mom_full_time_mom_report_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)


	probit drink_alcohol_w1 i.mom_full_time_mom_report_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	probit drink_alcohol_w1 i.mom_full_time_mom_report_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 

	probit drink_alcohol_w1 i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy) 
	
	
	* res_mom_work_hours
	
	probit drink_alcohol_w1 res_mom_work_hours_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit drink_alcohol_w1 res_mom_work_hours_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit drink_alcohol_w1 res_mom_work_hours_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)


	probit drink_alcohol_w1 res_mom_work_hours_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	probit drink_alcohol_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 

	probit drink_alcohol_w1 c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy) 
	

	* res mom at home or not
		
	probit drink_alcohol_w1 i.mom_at_home_index_dummy [pweight = GSWGT1], r
	outreg2 using result_3_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	probit drink_alcohol_w1 i.mom_at_home_index_dummy $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit drink_alcohol_w1 i.mom_at_home_index_dummy $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	probit drink_alcohol_w1 i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	probit drink_alcohol_w1 i.mom_at_home_index_dummy##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy##c.zConscientiousness_w1) 
	 


	
	
	* res mom control (not available)
	
	

	
	
	
	
	
	
	
*************************************************************************************************************************************************************	
	* res_mom_work_hours mom report


	probit tried_cigarette_w1 i.mom_full_time_mom_report_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_cigarette_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit tried_cigarette_w1 i.mom_full_time_mom_report_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_cigarette_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit tried_cigarette_w1 i.mom_full_time_mom_report_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_cigarette_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit tried_cigarette_w1 i.mom_full_time_mom_report_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_cigarette_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	probit tried_cigarette_w1 i.mom_full_time_mom_report_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_cigarette_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 
	
	probit tried_cigarette_w1 i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_cigarette_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy) 
	
		
	* res_mom_work_hours
	
	probit tried_cigarette_w1 res_mom_work_hours_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_cigarette_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit tried_cigarette_w1 res_mom_work_hours_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_cigarette_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit tried_cigarette_w1 res_mom_work_hours_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_cigarette_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit tried_cigarette_w1 res_mom_work_hours_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_cigarette_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	probit tried_cigarette_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_cigarette_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 
	
	probit tried_cigarette_w1 c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_cigarette_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy) 
	

	* res mom at home or not
		
	probit tried_cigarette_w1 i.mom_at_home_index_dummy [pweight = GSWGT1], r
	outreg2 using result_3_cigarette_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	probit tried_cigarette_w1 i.mom_at_home_index_dummy $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_cigarette_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit tried_cigarette_w1 i.mom_at_home_index_dummy $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_cigarette_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	probit tried_cigarette_w1 i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_cigarette_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	probit tried_cigarette_w1 i.mom_at_home_index_dummy##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_cigarette_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy##c.zConscientiousness_w1) 
	


	
	

	* res mom control (not available)
	
	

	






	
	
*************************************************************************************************************************************************************	
	
	* res_mom_work_hours mom report


	reg how_many_times_marijuana_w1 i.mom_full_time_mom_report_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_marijuana_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace
	

	reg how_many_times_marijuana_w1 i.mom_full_time_mom_report_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_marijuana_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	reg how_many_times_marijuana_w1 i.mom_full_time_mom_report_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_marijuana_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)


	reg how_many_times_marijuana_w1 i.mom_full_time_mom_report_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_marijuana_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	reg how_many_times_marijuana_w1 i.mom_full_time_mom_report_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_marijuana_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 
	
	reg how_many_times_marijuana_w1 i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_marijuana_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy) 
	
			
	* res_mom_work_hours
	
	reg how_many_times_marijuana_w1 res_mom_work_hours_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_marijuana_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace
	

	reg how_many_times_marijuana_w1 res_mom_work_hours_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_marijuana_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	reg how_many_times_marijuana_w1 res_mom_work_hours_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_marijuana_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)


	reg how_many_times_marijuana_w1 res_mom_work_hours_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_marijuana_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	
	reg how_many_times_marijuana_w1 c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_marijuana_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 
	
	reg how_many_times_marijuana_w1 c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_marijuana_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy) 
	

	* res mom at home or not
		
	reg how_many_times_marijuana_w1 i.mom_at_home_index_dummy [pweight = GSWGT1], r
	outreg2 using result_3_marijuana_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	reg how_many_times_marijuana_w1 i.mom_at_home_index_dummy $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_marijuana_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	reg how_many_times_marijuana_w1 i.mom_at_home_index_dummy $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_marijuana_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	reg how_many_times_marijuana_w1 i.mom_at_home_index_dummy  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_marijuana_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 
	
	
	reg how_many_times_marijuana_w1 i.mom_at_home_index_dummy##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_marijuana_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy##c.zConscientiousness_w1) 
	 


	
	

	* res mom control (not available)
	





	
	
	
*************************************************************************************************************************************************************	
	* res_mom_work_hours mom report

	
	probit error_sex_dummy i.mom_full_time_mom_report_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_error_sex_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace
	

	probit error_sex_dummy i.mom_full_time_mom_report_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_error_sex_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit error_sex_dummy i.mom_full_time_mom_report_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_error_sex_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)


	probit error_sex_dummy i.mom_full_time_mom_report_v2_w1 $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_error_sex_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)
	
	
	probit error_sex_dummy i.mom_full_time_mom_report_v2_w1##c.zConscientiousness_w1 $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_error_sex_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)

	probit error_sex_dummy i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_error_sex_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy)


    * res_mom_work_hours
	
	probit error_sex_dummy res_mom_work_hours_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_error_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace
	

	probit error_sex_dummy res_mom_work_hours_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_error_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit error_sex_dummy res_mom_work_hours_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_error_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)


	probit error_sex_dummy res_mom_work_hours_v2_w1 $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_error_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)
	
	
	probit error_sex_dummy c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_error_sex_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1)

	probit error_sex_dummy c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_error_sex_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy)

/*	* not working
	probit error_sex_dummy res_mom_work_hours_v2_w1  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
*/	


	* res mom at home or not
		
	probit error_sex_dummy i.mom_at_home_index_dummy [pweight = GSWGT1], r
	outreg2 using result_3_error_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	probit error_sex_dummy i.mom_at_home_index_dummy $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_error_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit error_sex_dummy i.mom_at_home_index_dummy $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_error_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	probit error_sex_dummy i.mom_at_home_index_dummy $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_error_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	probit error_sex_dummy i.mom_at_home_index_dummy##c.zConscientiousness_w1 $control4_for_sex i.had_relationship_w1 [pweight = GSWGT1],r
	outreg2 using result_3_error_sex_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
/*	* not working
	probit error_sex_dummy i.mom_at_home_index_dummy  zConscientiousness_w1 zExtraversion_w1 zNeuroticism_w1 res_mom_work_hours_v2_w1 res_dad_work_hours_v2_w1    ///
	$school_related_controls $psy_health ///
	$health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg ///
	$relationship $religion $relation_w_ppl  $income_and_expectation ///
	$interviewer_comments $respondent_background  $parents_involvement_mom_report $parents_relation_mom_reported $parents_expectation_mom_reported $parents_school_mom_report,r
	
*/

	
	

	* res mom control (not available)
	

		
		
		
		
*************************************************************************************************************************************************************	
		
		
	* res_mom_work_hours mom report

		
	probit error_alcohol_dummy i.mom_full_time_mom_report_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_error_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit error_alcohol_dummy i.mom_full_time_mom_report_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_error_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit error_alcohol_dummy i.mom_full_time_mom_report_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_error_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit error_alcohol_dummy i.mom_full_time_mom_report_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_error_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit error_alcohol_dummy i.mom_full_time_mom_report_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_error_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 

	probit error_alcohol_dummy i.mom_full_time_mom_report_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_error_alcohol_workhour2, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy)
		
		
		
	* res_mom_work_hours
	
	probit error_alcohol_dummy res_mom_work_hours_v2_w1 [pweight = GSWGT1], r
	outreg2 using result_3_error_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) replace

	probit error_alcohol_dummy res_mom_work_hours_v2_w1 $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_error_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 

	probit error_alcohol_dummy res_mom_work_hours_v2_w1 $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_error_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit error_alcohol_dummy res_mom_work_hours_v2_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_error_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(res_mom_work_hours_v2_w1) 


	probit error_alcohol_dummy c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_error_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##c.zConscientiousness_w1) 

	probit error_alcohol_dummy c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_error_alcohol_workhour, word ctitle(`yvariable')  excel append  keep(c.res_mom_work_hours_v2_w1##i.mom_at_home_index_dummy)

	* res mom at home or not
		
	probit error_alcohol_dummy i.mom_at_home_index_dummy [pweight = GSWGT1], r
	outreg2 using result_3_error_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) replace

	probit error_alcohol_dummy i.mom_at_home_index_dummy $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_error_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	probit error_alcohol_dummy i.mom_at_home_index_dummy $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_error_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 


	probit error_alcohol_dummy i.mom_at_home_index_dummy $control4 [pweight = GSWGT1],r
	outreg2 using result_3_error_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy) 

	
	
	probit error_alcohol_dummy i.mom_at_home_index_dummy##c.zConscientiousness_w1 $control4 [pweight = GSWGT1],r
	outreg2 using result_3_error_alcohol_home, word ctitle(`yvariable')  excel append  keep(i.mom_at_home_index_dummy##c.zConscientiousness_w1) 
	


	
	

	* res mom control (not available)
	
	

	



		
		
		
	
		
			