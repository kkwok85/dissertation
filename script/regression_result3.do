
* change these things:

* cancel  zExtraversion_w1 zNeuroticism_w1 in every regression
* replace $dad_bg_impute by dad_bg in the 3rd, 4th and 5th regression
* replace  i.res_dad_work_hours_v2_w1 by i.res_dad_work_hours_impute_w1



* i.no_dad_w1 i.no_mom_w1 perfectly collinearite with mom born in US/dad born in US


global control2 $respondent_background zConscientiousness_w1
global control3 $respondent_background zConscientiousness_w1 $fam_mem_bg $mom_bg $dad_bg  i.no_mom_w1 i.no_dad_w1
global control4 $respondent_background zConscientiousness_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg $relationship $religion $relation_w_ppl  $income_and_expectation $interviewer_comments $parents_involvement_mom_report $parents_relation_mom_report $parents_expectation_mom_report i.no_mom_w1 i.no_dad_w1         

global control4_for_sex $respondent_background zConscientiousness_w1 res_mom_work_hours_v2_w1  res_dad_work_hours_v2_w1 $school_related_controls $psy_health $health_status $family_wealth $environment $fam_mem_bg $mom_bg $dad_bg $religion $relation_w_ppl  $income_and_expectation $interviewer_comments $parents_involvement_mom_report $parents_relation_mom_report $parents_expectation_mom_report  i.no_mom_w1 i.no_dad_w1       



 * 1) redo all imputation and put it in summary stat, put a list of what i have imputed and show it. impute res_mom_at_home_or_outside_w1 almost (done)

   * check variable mom_w1
   
   * put video hours in it
   
   * change the summary stat
   

   
   
   *** relabel the dummy
   ** check which one not in the summary stat
   
   * pick which one to interact
   * explain why data drops

   
   * 5) reorganize the code






foreach variable in race BIO_SEX ///
abs_school_w1 suspension_w1 pay_attention_w1 get_along_stud_w1 get_along_teacher_w1 feel_safe_w1 grade_ELA_w1 grade_math_w1 /// 
bothered_by_things_w1 appetite_w1 felt_as_good_as_others_w1 trouble_concentrate_w1 felt_too_tired_w1 felt_hopeful_w1 felt_fearful_w1 talked_less_w1 felt_lonely_w1 felt_unfriendly_w1 hard_get_started_w1 life_not_worth_living_w1 ///
general_health_w1  ///
routine_phy_check_w1  gun_available_home_w1 ///
know_neighborhood_w1 environment_nearby_w1 neighborhood_gym_w1 neighborhood_safe_w1 move_out_happy_w1 building_type_w1 building_well_kept_w1  nearby_safe_w1 ///
mom_w1  dad_w1  ///
res_mom_educ_w1 res_mom_born_US_w1 res_mom_occupation_w1 res_mom_handicapped_w1 res_mom_smoked_w1 ///
res_dad_educ_w1 res_dad_born_US_w1 res_dad_occupation_w1 res_dad_handicapped_w1 res_dad_smoked_w1 ///
had_relationship_w1 ever_had_sex_w1 ///
religion_group_w1  pray_times_w1 ///
adults_care_w1 teachers_care_w1 frds_care_w1 family_understands_w1 ///
expect_college_w1  ///
candid_w1 physical_mature_w1 third_person_presence_w1 resp_impatient_w1 resp_embarrassed_w1 ///
school_good_learn  school_safe  school_good ///
know_frds met_frds met_frds_parents talk_to_how_many_parents talk_about_school_grade talk_about_school_things  talk_to_teachers  make_decision_tgt time_to_bed ///
get_along_well trust_him son_interferes_u ///
no_mom_w1 no_dad_w1 ///
expect_high_school_stud expect_hs   {

	tabulate `variable', gen(`variable'_dummy)


}

* name too long

tab health_cause_soc_absence_w1, gen(health_abs_w1_dummy)
tab cigarettes_available_home_w1, gen(cigar_h_w1_dummy) 
tab alcohol_available_home_w1, gen(alcohol_j_w1_dummy)   
tab drugs_available_home_w1, gen(drugs_h_w1_dummy)  
tab attend_religious_service_w1, gen(attend_relig_w1_dummy)
tab participate_school_activities, gen(participate_w1_dummy)  

	






* dad work hours are skipped *dad_bg_impute

estpost sum  AH_PVT race* age_w1 BIO_SEX* ///
zConscientiousness_w1 res_mom_work_hours_v2_w1  ///
abs_school_w1* abs_school_no_excuse_w1 suspension_w1* pay_attention_w1* get_along_stud_w1* get_along_teacher_w1* feel_safe_w1* grade_ELA_w1* grade_math_w1* ///
bothered_by_things_w1* appetite_w1* felt_as_good_as_others_w1* trouble_concentrate_w1* felt_too_tired_w1* felt_hopeful_w1* felt_fearful_w1* talked_less_w1* felt_lonely_w1* felt_unfriendly_w1* hard_get_started_w1* life_not_worth_living_w1* ///
general_health_w1* ///
routine_phy_check_w1*  gun_available_home_w1* family_income_1994 ///
know_neighborhood_w1* environment_nearby_w1* neighborhood_gym_w1* neighborhood_safe_w1* move_out_happy_w1* building_type_w1* building_well_kept_w1*  nearby_safe_w1* ///
age_mom_w1 age_dad_w1 mom_w1*  dad_w1*  num_bro_w1 num_sis_w1 num_granddad_w1 num_grandmom_w1 ///
res_mom_educ_w1* res_mom_born_US_w1* res_mom_occupation_w1* res_mom_handicapped_w1* res_mom_smoked_w1* ///
res_dad_educ_w1* res_dad_born_US_w1* res_dad_occupation_w1* res_dad_handicapped_w1* res_dad_smoked_w1* ///
had_relationship_w1* ever_had_sex_w1*  ///
religion_group_w1*  pray_times_w1* ///
adults_care_w1* teachers_care_w1* frds_care_w1* family_understands_w1* ///
expect_college_w1* work_hours_non_summer_w1 work_hours_summer_w1  earning_per_week_w1 ///
candid_w1 physical_mature_w1 third_person_presence_w1 resp_impatient_w1 resp_embarrassed_w1 ///
school_good_learn*  school_safe*  school_good* ///
know_frds* met_frds* met_frds_parents* talk_to_how_many_parents* talk_about_school_grade* talk_about_school_things*  talk_to_teachers*  make_decision_tgt* time_to_bed* ///
get_along_well* trust_him* son_interferes_u* ///
expect_high_school_stud* expect_hs* ///
health_abs_w1_dummy* cigar_h_w1_dummy* alcohol_j_w1_dummy* drugs_h_w1_dummy* attend_relig_w1_dummy* participate_w1_dummy*  ///
no_mom_w1* no_dad_w1* [aweight = GSWGT1]



estout using test.xls,  cells("count mean sd min max sum") replace








sum bn.race 

outreg2  using x.doc, replace sum(log) keep(i.race)



esttab, cells("count mean sd min max") noobs

label define race_name 1 "Hispanic" 2 "Black" 3 " Asian" 4 "Native American"  5 "Other" 6 "White"
label values race race_name
sum bn.race

label define mom_report 0 "no job" 1 "PT" 2 "FT" 
label values mom_full_time_mom_report_v2_w1 mom_report




* label define race_name 1 "a" 2 "b" 3 "c" 4 "d"  5 "e" 6 "f"
* label values race race_name
* sum bn i.race
* sum $control2











*************************************************************************************************************************************************************



* cd C:\Users\AYSPS\Desktop



	foreach x in mom_full_time_mom_report_v2_w1  mom_at_home_index_dummy decide_how_much_tv_w1 {

	
	reg tv_hours_per_week_w1 i.`x' [pweight = GSWGT1], r
	outreg2 using result_3_tv_`x', word ctitle(`yvariable')  excel append  keep(i.`x') replace

	reg tv_hours_per_week_w1 i.`x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_`x', word ctitle(`yvariable')  excel append  keep(i.`x') 

	reg tv_hours_per_week_w1 i.`x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_`x', word ctitle(`yvariable')  excel append  keep(i.`x')

		

	reg tv_hours_per_week_w1 i.`x' $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_`x', word ctitle(`yvariable')  excel append  keep(i.`x') 

	
	reg tv_hours_per_week_w1 i.`x'##c.zConscientiousness_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_`x', word ctitle(`yvariable')  excel append  keep(i.`x'##c.zConscientiousness_w1) 
	

	}


	
	
	
	. local agrp "cat dog cow pig"

. local bgrp "meow woof moo oinkoink"

. local n : word count `agrp'

. forvalues i = 1/`n' {
  2.    local a : word `i' of `agrp'
  3.    local b : word `i' of `bgrp'
  4.    di "`a' says `b'"
  5. }
cat says meow
dog says woof
cow says moo
pig says oinkoink'
	
	

local agrp "cat dog cow pig"

local bgrp "meow woof moo oinkoink"
	
foreach y in "reg tv_hours_per_week_w1" "ologit hang_out_frds_w1" {


* strategy 1
* count number of word, then just put the number in in the outreg2 name


/*
gen t1 = subinstr("reg tv_hours_per_week_w1" ,"reg","",1)



gen t12 = subinstr("reg tv_hours_per_week_w1" ,"ologit","",1)
*/


* another strategy:

foreach y2 in `y'
* concatenate 



	foreach x in mom_full_time_mom_report_v2_w1  mom_at_home_index_dummy decide_how_much_tv_w1 {

	
	`y' i.`x' [pweight = GSWGT1], r
	outreg2 using result_3_tv_`x', word ctitle(`yvariable')  excel append  keep(i.`x') replace

	`y' i.`x' $control2 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_`x', word ctitle(`yvariable')  excel append  keep(i.`x') 

	`y' i.`x' $control3 [pweight = GSWGT1], r 
	outreg2 using result_3_tv_`x', word ctitle(`yvariable')  excel append  keep(i.`x')

		

	`y' i.`x' $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_`x', word ctitle(`yvariable')  excel append  keep(i.`x') 

	
	`y' i.`x'##c.zConscientiousness_w1  $control4 [pweight = GSWGT1],r
	outreg2 using result_3_tv_`x', word ctitle(`yvariable')  excel append  keep(i.`x'##c.zConscientiousness_w1) 
	

	}

}
	
	
	
	
	
	
	
	
	
	
	
	
	
	





	
	




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
	
	

	



		
		
		
	
		
			