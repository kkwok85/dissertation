* summary statistics



cd "F:\temp_data"



clear


*set maxvar 32767

use panel_data, clear

/*

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

estpost sum  $demographic_panel [aweight = GSWGT]

estout using summary_stat.xls,  cells("count mean sd min max sum") replace

sum BIO_SEX

sum  $demographic_panel [aweight = GSWGT]

sutex $demographic_panel [aweight = GSWGT] ,nobs minmax


ever_drink_alcohol_w  drink_days_v2_w drink_amount_w total_drink_per_year_w ///
tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
ever_marijuana_30_w ever_all_but_m_drugs_w ///
BMI_w BMI_zscore_w overweight_w obese_w lose_weight_dum_w

*/


cd "D:\temp_result_panel"


estpost sum BMI_zscore_w lose_weight_dum_w tried_cigarette_w regular_cigarette_w how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
ever_drink_alcohol_w drink_days_v2_w drink_amount_w total_drink_per_year_w ever_marijuana_30_w  ever_all_but_m_drugs_w [aweight = GSWGT]





estout using summary_stat.tex ,  prehead(\makeatletter\setlength{\@fptop}{0pt}\makeatother\setlength{\extrarowheight}{2pt}\begin{table}\caption{Summary Statistics for Dependent Variables} \begin{tabular}{l*{1}{ccccc}}\hline) ///
varlabels(BMI_zscore_w "BMI Z-score" ///
lose_weight_dum_w  "Lose weight" tried_cigarette_w  "Ever smoked" ///
 regular_cigarette_w "Regular smoker" how_many_days_smoke_w "Num. of smoke days" ///
 how_many_cigarettes_w "Num. of cigarettes" total_smoke_a_month_w  "Total num. of cigarettes" ///
ever_drink_alcohol_w    "Ever drank alcohol" drink_days_v2_w "Num. of drink days"  /// 
 drink_amount_w "Num. of drink amount"  total_drink_per_year_w "Total num. of drink" ///
 ever_marijuana_30_w  "Smoked marijuana" ever_all_but_m_drugs_w  "Used other drugs")  ///
style(tex)  cells("count(fmt(0))  mean(fmt(a3))  sd(fmt(a3))  min(fmt(a3))  max(fmt(a3)) ") replace postfoot(\hline\end{tabular}\end{table})


global demographic_panel age_w BIO_SEX zNeuroticism_w1 zConscientiousness_w1 i.race num_siblings_w AH_PVT i.no_mom_w i.no_dad_w age_mom_w age_dad_w

global mom_occupation_panel i.res_mom_occupation_w

global mom_edu_panel i.res_mom_educ_w i.mom_edu_impute_indicator_w 

global dad_educ_career_panel res_dad_work_hours_v2_w  i.res_dad_occupation_w  i.dwh_impute_indicator_w i.res_dad_educ_w i.dad_edu_impute_indicator_w 

global family_income_panel family_income_1994 i.fam_income_impute_ind

global supervision_panel  i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w

global time_panel  i.month_year_w








foreach variable in race BIO_SEX ///
res_mom_occupation_w res_mom_educ_w res_dad_occupation_w res_dad_educ_w  {

	tabulate `variable', gen(`variable'_dummy)

}



foreach gender in mom dad {
	gen res_`gender'_blue_collar_w = 0 if  res_`gender'_occupation_w_dummy1 != .
	replace res_`gender'_blue_collar_w = 1 if (res_`gender'_occupation_w_dummy8 == 1 | res_`gender'_occupation_w_dummy9 == 1 | ///
	res_`gender'_occupation_w_dummy10 == 1 | res_`gender'_occupation_w_dummy11 == 1 | res_`gender'_occupation_w_dummy12 == 1 )

	gen res_`gender'_white_collar_technical_w = 0 if  res_`gender'_occupation_w_dummy1 != .
	replace res_`gender'_white_collar_technical_w = 1 if (res_`gender'_occupation_w_dummy1 == 1 | res_`gender'_occupation_w_dummy2 == 1 | ///
	res_`gender'_occupation_w_dummy3 == 1 | res_`gender'_occupation_w_dummy4 == 1 | res_`gender'_occupation_w_dummy5 == 1 )

	gen res_`gender'_service_w = 0 if  res_`gender'_occupation_w_dummy1 != .
	replace res_`gender'_service_w = 1 if (res_`gender'_occupation_w_dummy6 == 1 | res_`gender'_occupation_w_dummy7 == 1 )

	gen res_`gender'_others_w = 0 if res_`gender'_occupation_w_dummy1 != .
	replace res_`gender'_others_w = 1 if (res_`gender'_occupation_w_dummy13 == 1 | res_`gender'_occupation_w_dummy14 == 1 | res_`gender'_occupation_w_dummy15 == 1)

	gen res_`gender'_no_occupation_w = 0 if  res_`gender'_occupation_w_dummy1 != .
	replace res_`gender'_no_occupation_w  = 1 if (res_`gender'_occupation_w_dummy16 == 1 )





	gen res_`gender'_GED_hs_or_below_w = 0 if  res_`gender'_educ_w_dummy1 != .
	replace res_`gender'_GED_hs_or_below_w = 1 if (res_`gender'_educ_w_dummy1 == 1 | res_`gender'_educ_w_dummy2 == 1 | res_`gender'_educ_w_dummy4 == 1 | ///
	res_`gender'_educ_w_dummy5 == 1 | res_`gender'_educ_w_dummy10 == 1 )

	gen res_`gender'_college_not_grad_w = 0 if  res_`gender'_educ_w_dummy1 != .
	replace res_`gender'_college_not_grad_w = 1 if (res_`gender'_educ_w_dummy7 == 1) 

	gen res_`gender'_college_grad_w = 0 if  res_`gender'_educ_w_dummy1 != .
	replace res_`gender'_college_grad_w = 1 if (res_`gender'_educ_w_dummy8 == 1)

	gen res_`gender'_vocational_w = 0 if  res_`gender'_educ_w_dummy1 != .
	replace res_`gender'_vocational_w = 1 if (res_`gender'_educ_w_dummy3 == 1 | res_`gender'_educ_w_dummy6 == 1)

	gen res_`gender'_above_college_w = 0 if  res_`gender'_educ_w_dummy1 != .
	replace res_`gender'_above_college_w = 1 if (res_`gender'_educ_w_dummy9 == 1)

	gen res_`gender'_dont_know_w = 0 if  res_`gender'_educ_w_dummy1 != . 
	replace res_`gender'_dont_know_w = 1 if (res_`gender'_educ_w_dummy11 == 1 | res_`gender'_educ_w_dummy12 == 7)

}




* put refcat() later . See http://www.jwe.cc/2012/03/stata-latex-tables-estout/
* put \setlength{\extrarowheight}{8pt} after caption if you want to set height between lines

estpost sum res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 age_w BIO_SEX_dummy1 BIO_SEX_dummy2 ///
race_dummy1 race_dummy2 race_dummy3 race_dummy4 race_dummy5 race_dummy6 ///
num_siblings_w AH_PVT no_mom_w no_dad_w  age_mom_w age_dad_w ///
res_mom_blue_collar_w  ///
res_mom_white_collar_technical_w ///
res_mom_service_w ///
res_mom_others_w ///
res_mom_no_occupation_w ///
res_mom_GED_hs_or_below_w ///
res_mom_college_not_grad_w ///
res_mom_college_grad_w ///
res_mom_vocational_w ///
res_mom_above_college_w ///
res_mom_dont_know_w ///
res_dad_blue_collar_w  ///
res_dad_white_collar_technical_w ///
res_dad_service_w ///
res_dad_others_w ///
res_dad_no_occupation_w ///
res_dad_GED_hs_or_below_w ///
res_dad_college_not_grad_w ///
res_dad_college_grad_w ///
res_dad_vocational_w ///
res_dad_above_college_w ///
res_dad_dont_know_w ///
res_dad_work_hours_v2_w family_income_1994 decide_time_at_home_weekend_w decide_hang_around_with_w decide_what_u_wear_w decide_how_much_tv_w decide_what_tv_programs_w ///
decide_what_time_go_bed_w decide_what_you_eat_w [aweight = GSWGT]






estout . using summary_stat_2.tex , prehead(\begin{footnotesize}\setlength{\extrarowheight}{0pt}\begin{longtable}{lccccc} \caption{Summary Statistics for Variables of Interest and Controls} \\ \hline  ) ///
varlabels(res_mom_work_hours_v2_w "Mom work hours"   ///
zConscientiousness_w1  "Child's conscientiousness" zNeuroticism_w1  "Child's neuroticism" ///
age_w "Age"   ///
BIO_SEX_dummy1 "Male" BIO_SEX_dummy2 "Female" ///
race_dummy6  "White" race_dummy2  "Black or African American" race_dummy1  "Hispanic"  race_dummy3  "Asian" race_dummy4  "Native American" race_dummy5  "Other, Non-Hispanic"  ///
num_siblings_w "Num. of siblings" AH_PVT " Add Health Picture Vocabulary Test (AHPVT) score" ///
no_mom_w "Absence of mom at home" no_dad_w "Absence of dad at home" ///
age_mom_w "Mom's age" age_dad_w "Dad's age" ///
res_mom_blue_collar_w  "Mom's occupation: blue collar" ///
res_mom_white_collar_technical_w  "Mom's occupation: white collar or technical" ///
res_mom_service_w  "Mom's occupation: service" ///
res_mom_others_w  "Mom's occupation: others" ///
res_mom_no_occupation_w  "Mom's occupation: unknown" ///
res_mom_GED_hs_or_below_w "Mom's education: GED, high school or below"  ///
res_mom_college_not_grad_w "Mom's education: college but not graduate" ///
res_mom_college_grad_w "Mom's education: college" ///
res_mom_vocational_w "Mom's education: trade or vocational school" ///
res_mom_above_college_w "Mom's education: above college" ///
res_mom_dont_know_w "Mom's education: unknown" ///
res_dad_blue_collar_w  "Dad's occupation: blue collar" ///
res_dad_white_collar_technical_w  "Dad's occupation: white collar or technical" ///
res_dad_service_w  "Dad's occupation: service" ///
res_dad_others_w  "Dad's occupation: others" ///
res_dad_no_occupation_w  "Dad's occupation: unknown" ///
res_dad_GED_hs_or_below_w "Dad's education: GED, high school or below"  ///
res_dad_college_not_grad_w "Dad's education: college but not graduate" ///
res_dad_college_grad_w "Dad's education: college" ///
res_dad_vocational_w "Dad's education: trade or vocational school" ///
res_dad_above_college_w "Dad's education: above college" ///
res_dad_dont_know_w "Dad's education: unknown"  ///
res_dad_work_hours_v2_w  "Dad work hours" ///
family_income_1994 "Annual family income (\$1000s)" ///
decide_time_at_home_weekend_w "Supervision: decide the time at home on weekend nights" ///
decide_hang_around_with_w "Supervision: decide the people that the child hangs around with" ///
decide_what_u_wear_w "Supervision: decide what to wears" ///
decide_how_much_tv_w  "Supervision: decide how much TV to watch" ///
decide_what_tv_programs_w "Supervision: decide TV program" ///
decide_what_time_go_bed_w "Supervision: decide the time to go to bed on week nights" ///
decide_what_you_eat_w "Supervision: decide time at home during weekend" ) ///
style(tex)  cells("count(fmt(0))  mean(fmt(a3))  sd(fmt(a3))  min(fmt(a3))  max(fmt(a3)) ") replace postfoot(\hline\end{longtable}\end{footnotesize})







/*
res_mom_occupation_w_dummy1 "Professional 1, such as doctor, lawyer, scientist" res_mom_occupation_w_dummy2 "Professional 2, such as teacher, librarian, nurse"  
res_mom_occupation_w_dummy3 "Manager, such as executive, director" res_mom_occupation_w_dummy4 "Technical, such as computer specialist, radiologist" 
res_mom_occupation_w_dummy5 "Office worker, such as bookkeeper, office clerk, secretary" res_mom_occupation_w_dummy6 "Sales worker, such as insurance agent, store clerk" 
res_mom_occupation_w_dummy7 "Restaurant worker or personal service, such as waitress, housekeeper" res_mom_occupation_w_dummy8 "Craftsperson, such as toolmaker, woodworker" 
res_mom_occupation_w_dummy9 "Construction worker, such as carpenter, crane operator" res_mom_occupation_w_dummy10 "Mechanic, such as electrician, plumber, machinist" 
res_mom_occupation_w_dummy11 "Factory worker or laborer, such as assembler, janitor" res_mom_occupation_w_dummy12 "Transportation, such as bus driver, taxi driver" 
res_mom_occupation_w_dummy13 "Military or security, such as police officer, soldier, fire fighter" res_mom_occupation_w_dummy14 "Farm or fishery worker" 
res_mom_occupation_w_dummy15 "Other" res_mom_occupation_w_dummy16 "No occupation"  


res_mom_educ_w_dummy1 "Eighth grade or less" res_mom_educ_w_dummy2 "More than eighth grade, but did not graduate from high school" 
res_mom_educ_w_dummy3 "Went to a business, trade, or vocational school instead of high school" res_mom_educ_w_dummy4 "High school graduate" 
res_mom_educ_w_dummy5 "Completed a GED" res_mom_educ_w_dummy6 "Went to a business, trade, or vocational school after high school" 
res_mom_educ_w_dummy7 "Went to college, but did not graduate" 
res_mom_educ_w_dummy8 "Graduated from a college or university" 
res_mom_educ_w_dummy9 "Professional training beyond a four-year college or university" 
res_mom_educ_w_dummy10 "Never went to school" 



res_dad_occupation_w_dummy1 "Professional 1, such as doctor, lawyer, scientist" res_dad_occupation_w_dummy2 "Professional 2, such as teacher, librarian, nurse"  
res_dad_occupation_w_dummy3 "Manager, such as executive, director" res_dad_occupation_w_dummy4 "Technical, such as computer specialist, radiologist" 
res_dad_occupation_w_dummy5 "Office worker, such as bookkeeper, office clerk, secretary" res_dad_occupation_w_dummy6 "Sales worker, such as insurance agent, store clerk" 
res_dad_occupation_w_dummy7 "Restaurant worker or personal service, such as waitress, housekeeper" res_dad_occupation_w_dummy8 "Craftsperson, such as toolmaker, woodworker" 
res_dad_occupation_w_dummy9 "Construction worker, such as carpenter, crane operator" res_dad_occupation_w_dummy10 "Mechanic, such as electrician, plumber, machinist" 
res_dad_occupation_w_dummy11 "Factory worker or laborer, such as assembler, janitor" res_dad_occupation_w_dummy12 "Transportation, such as bus driver, taxi driver" 
res_dad_occupation_w_dummy13 "Military or security, such as police officer, soldier, fire fighter" res_dad_occupation_w_dummy14 "Farm or fishery worker" 
res_dad_occupation_w_dummy15 "Other" res_dad_occupation_w_dummy16 "No occupation"  


res_dad_educ_w_dummy1 "Eighth grade or less" res_dad_educ_w_dummy2 "More than eighth grade, but did not graduate from high school" 
res_dad_educ_w_dummy3 "Went to a business, trade, or vocational school instead of high school" res_dad_educ_w_dummy4 "High school graduate" 
res_dad_educ_w_dummy5 "Completed a GED" res_dad_educ_w_dummy6 "Went to a business, trade, or vocational school after high school" 
res_dad_educ_w_dummy7 "Went to college, but did not graduate" 
res_dad_educ_w_dummy8 "Graduated from a college or university" 
res_dad_educ_w_dummy9 "Professional training beyond a four-year college or university" 
res_dad_educ_w_dummy10 "Never went to school" */
