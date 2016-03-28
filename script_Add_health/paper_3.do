cd "F:\temp_data"


set maxvar 32767

clear



use constructed_variables, clear


global demographic_panel age_w BIO_SEX i.race num_siblings_w AH_PVT i.no_mom_w i.no_dad_w age_mom_w age_dad_w

global mom_occupation_panel i.res_mom_occupation_w

global mom_edu_panel i.res_mom_educ_w i.mom_edu_impute_indicator_w 

global dad_educ_career_panel res_dad_work_hours_v2_w  i.res_dad_occupation_w  i.dwh_impute_indicator_w i.res_dad_educ_w i.dad_edu_impute_indicator_w 

global family_income_panel family_income_1994 i.fam_income_impute_ind

global supervision_panel  i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w

global time_panel  i.month_year_w






global demographic age_w2 i.BIO_SEX i.race num_siblings_w2 AH_PVT i.no_mom_w2 i.no_dad_w2 age_mom_w2 age_dad_w2

global mom_occupation i.res_mom_occupation_w2

global mom_edu i.res_mom_educ_w2 i.mom_edu_impute_indicator_w2 

global dad_educ_career res_dad_work_hours_v2_w2  i.res_dad_occupation_w2  i.dwh_impute_indicator_w2 i.res_dad_educ_w2 i.dad_edu_impute_indicator_w2

global family_income family_income_1994 i.fam_income_impute_ind

global supervision  i.decide_time_at_home_weekend_w2 i.decide_hang_around_with_w2 i.decide_what_u_wear_w2 i.decide_how_much_tv_w2 i.decide_what_tv_programs_w2 i.decide_what_time_go_bed_w2 i.decide_what_you_eat_w2

global time  i.month_year_w2






gen fam_income_impute_ind = 1 if family_income_1994 ==.
replace fam_income_impute_ind = 0 if family_income_1994 !=.


sum family_income_1994 [aweight = GSWGT1]

replace family_income_1994 = r(mean) if AID != "." & family_income_1994 == . & fam_income_impute_ind == 1







replace H2NU60 = . if H2NU60 == 8
replace H2NU62 = . if H2NU62 == 8
replace H2NU63 = . if H2NU63 == 8
replace H2NU66 = . if H2NU66 == 8
replace H2NU70 = . if H2NU70 == 8

replace H2NU77 = . if H2NU77 >= 8
replace H2NU78 = . if H2NU78 >= 8
replace H2NU79 = . if H2NU79 >= 8
replace H2NU80 = . if H2NU80 >= 8




gen bad_food_w2 =  H2NU60 + H2NU62 +  H2NU63 + H2NU66 + H2NU70 


forvalues i = 10(1)28 {
replace H2NU`i' = . if H2NU`i' == 8

}

gen vege_fruits_w2 = H2NU10 + H2NU11 + H2NU12 + H2NU13 + H2NU14 + H2NU15 + H2NU16 + H2NU18 + H2NU19 + H2NU20 + H2NU21 + H2NU22 + H2NU23 + H2NU24 + H2NU25 + H2NU26 + H2NU27 + H2NU28 

gen decision_w1 = decide_time_at_home_weekend_w1 + decide_hang_around_with_w1 + decide_what_u_wear_w1 + decide_how_much_tv_w1 + decide_what_tv_programs_w1 + decide_what_time_go_bed_w1 + decide_what_you_eat_w1

gen decision_w2 =  decide_time_at_home_weekend_w2 + decide_hang_around_with_w2 + decide_what_u_wear_w2 + decide_how_much_tv_w2 + decide_what_tv_programs_w2 + decide_what_time_go_bed_w2 + decide_what_you_eat_w2







reg H2NU77 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time    [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU78 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time   [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU79 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU80 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg bad_food_w2 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg vege_fruits_w2 res_mom_work_hours_v2_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $supervision $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )


ivregress 2sls bad_food_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  (res_mom_work_hours_v2_w2 = youngest_sib_age_w2)  [pw=GSWGT2], vce(cluster PSUSCID_w2 )




reg H2NU77 res_mom_work_hours_v2_w2 decision_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU78 res_mom_work_hours_v2_w2 decision_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU79 res_mom_work_hours_v2_w2 decision_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time   [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU80 res_mom_work_hours_v2_w2 decision_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg bad_food_w2 res_mom_work_hours_v2_w2 decision_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg vege_fruits_w2 res_mom_work_hours_v2_w2 decision_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )



replace H2NU3 = . if H2NU3 == 8
replace H2NU3 = 2 if H2NU4 == 2
replace H2NU3 = 3 if H2NU4 == 3


res_mom_at_home_leave_school_w2 
res_mom_at_home_return_school_w2 
res_mom_at_home_go_to_bed_w2


 
reg H2NU77 res_mom_work_hours_v2_w2 i.res_mom_at_home_leave_school_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU78 res_mom_work_hours_v2_w2 i.res_mom_at_home_leave_school_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU79 res_mom_work_hours_v2_w2 i.res_mom_at_home_leave_school_w2 $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time   [pw=GSWGT2], vce(cluster PSUSCID_w2 )
reg H2NU80 res_mom_work_hours_v2_w2 i.res_mom_at_home_leave_school_w2  $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel  $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )

reg vege_fruits_w2  res_mom_work_hours_v2_w2 i.res_mom_at_home_return_school_w2    $demographic $mom_occupation  $mom_edu $dad_educ_career $family_income_panel   $time  [pw=GSWGT2], vce(cluster PSUSCID_w2 )





parent_present_when_eat_w2


