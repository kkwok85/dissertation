* file to clean data


clear


cd "F:\temp_data"
*set maxvar 32767

use Add_Health_merged_w1_to_w4, clear






* can check age_mom/age_dad, dwh_impute_indicator_w,dad_edu_impute_indicator_w   later again 

* checked variables:
* c.res_mom_work_hours_v2_w1, zConscientiousness_w1, zNeuroticism_w2, age_w1, BIO_SEX, race, num_siblings_w1, AH_PVT, no_mom_w1, no_dad_w1, age_mom_w1,  
* res_mom_occupation_w1, res_mom_educ_w1, mom_edu_impute_indicator_w,  res_dad_work_hours_v2_w1,  res_dad_occupation_w1, res_dad_educ_w, family_income_1994
* i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w
* all smoking, drinking and drugs, BMI, lose_weight

* c.res_mom_work_hours_v2_w2, zConscientiousness_w2, zNeuroticism_w2, age_w2, num_siblings_w2, no_mom_w2, no_dad_w2, age_mom_w2 , 
* res_mom_occupation_w2,  res_mom_educ_w2, mom_edu_impute_indicator_w, res_dad_work_hours_v2_w2,  res_dad_occupation_w2, res_dad_educ_w 
*i.decide_time_at_home_weekend_w i.decide_hang_around_with_w i.decide_what_u_wear_w i.decide_how_much_tv_w i.decide_what_tv_programs_w i.decide_what_time_go_bed_w i.decide_what_you_eat_w
* all smoking, drinking and drugs, BMI, lose_weight








* wave 1


replace BIO_SEX = . if (BIO_SEX == 6 | BIO_SEX==8)




replace H1DA3 = . if (H1DA3 == 6 | H1DA3 == 8)
replace H1DA8 = . if (H1DA8 >= 996 & H1DA8 <= 999)
replace H1DA9 = . if (H1DA9 >= 996 & H1DA9 <= 999)
replace H1DA10 = . if (H1DA10 >= 996 & H1DA10 <= 999)
replace H1DA11 = . if (H1DA11 >= 996 & H1DA11 <= 999)



* race
replace H1GI1M = . if (H1GI1M == 96)
replace H1GI1Y = . if (H1GI1Y == 96)

replace H1GI6A = . if (H1GI6A == 6 | H1GI6A == 8 | H1GI6A == 9)
replace H1GI6B = . if (H1GI6B == 6 | H1GI6B == 8 | H1GI6B == 9)
replace H1GI6C = . if (H1GI6C == 6 | H1GI6C == 8 | H1GI6C == 9)
replace H1GI6D = . if (H1GI6D == 6 | H1GI6D == 8 | H1GI6D == 9)
replace H1GI6E = . if (H1GI6E == 6 | H1GI6E == 8 | H1GI6E == 9)


* mom educ + work hours + occupations
replace H1RM1 = . if (H1RM1 == 96 | H1RM1 == 97 | H1RM1 == 98)

replace H1RM4 = . if (H1RM4 >= 96 & H1RM4 <= 99)
replace H1RM7 = . if (H1RM7 >= 996 & H1RM7 <= 999)



* no mom will be filled in in contruct_all_waves
replace H1RM11 = . if (H1RM11 == 96 | H1RM11 == 97 | H1RM11 == 98 | H1RM11 == 99)
replace H1RM12 = . if (H1RM12 == 96 | H1RM12 == 97 | H1RM12 == 98 | H1RM12 == 99)
replace H1RM13 = . if (H1RM13 == 96 | H1RM13 == 97 | H1RM13 == 98 | H1RM13 == 99)







* dad educ + work hours + occupations
replace H1RF1 = . if (H1RF1 == 96 | H1RF1 == 97 | H1RF1 == 98 | H1RF1 == 99)

replace H1RF4 = . if (H1RF4 >= 96 & H1RF4 <= 99)
replace H1RF7 = . if (H1RF7 >= 996 & H1RF7 <= 999)

replace H1RF11 = . if (H1RF11 == 96 | H1RF11 == 97 | H1RF11 == 98 | H1RF11 == 99)
replace H1RF12 = . if (H1RF12 == 96 | H1RF12 == 97 | H1RF12 == 98 | H1RF12 == 99)
replace H1RF13 = . if (H1RF13 == 96 | H1RF13 == 97 | H1RF13 == 98 | H1RF13 == 99)

* family income
replace PA55 = . if (PA55 == 9996)


* supervision
replace H1WP1 = . if (H1WP1 >= 6 & H1WP1 <= 9)
replace H1WP2 = . if (H1WP2 >= 6 & H1WP2 <= 9)
replace H1WP3 = . if (H1WP3 >= 6 & H1WP3 <= 9)
replace H1WP4 = . if (H1WP4 >= 6 & H1WP4 <= 9)
replace H1WP5 = . if (H1WP5 >= 6 & H1WP5 <= 9)
replace H1WP6 = . if (H1WP6 >= 6 & H1WP6 <= 9)
replace H1WP7 = . if (H1WP7 >= 6 & H1WP7 <= 9)

replace H1WP8 = . if (H1WP8 >= 96 & H1WP8 <= 98)




* eat and BMI


* diet
replace H1GH33 = . if (H1GH33 == 6 | H1GH33 == 8)
replace H1GH34 = . if (H1GH34 == 6 | H1GH34 == 8)
replace H1GH36 = . if (H1GH36 == 6 | H1GH36 == 8)





* breakfast
replace H1GH23A = . if (H1GH23A == 6 | H1GH23A == 8)
replace H1GH23G = . if (H1GH23G == 6 | H1GH23G == 8)
replace H1GH23J = . if (H1GH23J == 6 | H1GH23J == 8)


replace H1GH29 = . if (H1GH29 == 6 | H1GH29 == 8)

replace H1GH30A = . if (H1GH30A >= 6 & H1GH30A <= 8)
replace H1GH30B = . if (H1GH30B >= 6 & H1GH30B <= 8)

* sleep
replace H1GH50 = "" if (H1GH50 == "999996" | H1GH50 ==  "999998" | H1GH50 ==  "999999") 
replace H1GH51 = . if (H1GH51 >= 96 & H1GH51 <= 99)
replace H1GH52 = . if (H1GH52 >= 6 & H1GH52 <= 8)




replace H1GH59A = . if (H1GH59A == 96 | H1GH59A == 98 |H1GH59A == 99)
replace H1GH59B = . if (H1GH59B == 96 | H1GH59B == 98 |H1GH59B == 99)
replace H1GH60 = . if (H1GH60 == 996 | H1GH60 == 998 |H1GH60 == 999)








* smoking
replace H1TO1 = . if (H1TO1 == 6 | H1TO1 == 8 | H1TO1 == 9)
replace H1TO3 = . if (H1TO3 == 6 | H1TO3 == 7 | H1TO3 == 8)
replace H1TO5 = . if (H1TO5 == 96 | H1TO5 == 97 | H1TO5 == 98 | H1TO5 == 99)
replace H1TO7 = . if (H1TO7 == 96 | H1TO7 == 97 | H1TO7 == 98 | H1TO7 == 99)


* drinking
replace H1TO12 = . if (H1TO12 == 6 | H1TO12 == 8 | H1TO12 == 9)
replace H1TO15 = . if (H1TO15 == 96 | H1TO15 == 97 | H1TO15 == 98)
replace H1TO16 = . if (H1TO16 == 96 | H1TO16 == 97 | H1TO16 == 98 | H1TO16 == 99)
replace H1TO17 = . if (H1TO17 == 96 | H1TO17 == 97 | H1TO17 == 98)
replace H1TO18 = . if (H1TO18 == 96 | H1TO18 == 97 | H1TO18 == 98)



* marijuana
replace H1TO32 = . if (H1TO32 == 996 | H1TO32 == 997 | H1TO32 == 998 | H1TO32 == 999)
* cocaine
replace H1TO36 = . if (H1TO36 == 996 | H1TO32 == 997 | H1TO32 == 998 | H1TO32 == 999)

* inhalants
replace H1TO39 = . if (H1TO39 == 996 | H1TO39 == 997 | H1TO39 == 998 | H1TO39 == 999)

* other illegal drugs
replace H1TO42 = . if (H1TO42 == 996 | H1TO42 == 997 | H1TO42 == 998 | H1TO42 == 999)


* sex
replace H1CO1 = . if (H1CO1 == 6 | H1CO1 == 8 | H1CO1 == 9)
replace PC47 = . if (PC47 == 6 | PC47 == 8)
replace PC41 = . if (PC41 == 6 | PC41 == 8)







* parent smoke & drink
replace PA61 = . if (PA61 == 96)
replace PA62 = . if (PA62 == 96)
replace PA64 = . if (PA64 == 6)

replace PB22 = . if (PB22 == 96 | PB22 == 98)






forvalues i = 1(1)15 {
	replace H1GH`i' = . if (H1GH`i' == 6 | H1GH`i' == 8)
}

 
forvalues i = 17(1)22 {
	replace H1GH`i' = . if (H1GH`i' == 6 | H1GH`i' == 8)
}







* personality

forvalues i = 18(1)21 {
	replace H1PF`i' = . if (H1PF`i' == 6 | H1PF`i' == 8 | H1PF`i' == 9)
}



foreach  variables in H1PF30 H1PF32 H1PF33 H1PF34 H1PF35 H1PF36 {
	replace `variables' = . if (`variables' == 6 | `variables' == 8 | `variables'  == 9)
}



foreach variables in S62B  S62E  S62O {
	replace `variables' = . if  (`variables' == 9)
}














* wave 2





* daily activities

replace H2DA3 = . if (H2DA3 == 6 | H1DA3 == 8)
replace H2DA8 = . if (H2DA8 == 998)
replace H2DA9 = . if (H2DA9 == 98)
replace H2DA10 = . if (H2DA10 == 98)
replace H2DA11 = . if (H2DA11 == 998)



replace H2GI1M = . if (H2GI1M == 98)

replace H2GI1Y = . if (H2GI1Y == 98)




* mom educ + work hours + occupations
replace H2RM1 = . if (H2RM1 == 97)

replace H2RM4 = . if (H2RM4 >= 96 & H2RM4 <= 98)
replace H2RM7 = . if (H2RM7 >= 996 & H2RM7 <= 998)

replace H2RM11 = . if (H2RM11 == 96 | H2RM11 == 97 | H2RM11 == 98 )
replace H2RM12 = . if (H2RM12 == 96 | H2RM12 == 97 | H2RM12 == 98 )
replace H2RM13 = . if (H2RM13 == 96 | H2RM13 == 97 | H2RM13 == 98 )



* dad educ + work hours + occupations
replace H2RF1 = . if (H2RF1 == 96 | H2RF1 == 97)

replace H2RF4 = . if (H2RF4 >= 96 & H2RF4 <= 98)
replace H2RF7 = . if (H2RF7 >= 996 & H2RF7 <= 998)


replace H2RF11 = . if (H2RF11 == 96 | H2RF11 == 97 | H2RF11 == 98 )
replace H2RF12 = . if (H2RF12 == 96 | H2RF12 == 97 | H2RF12 == 98 )
replace H2RF13 = . if (H2RF13 == 96 | H2RF13 == 97 | H2RF13 == 98 )



* supervision


replace H2WP1 = . if (H2WP1 >= 6 & H2WP1 <= 8)
replace H2WP2 = . if (H2WP2 >= 6 & H2WP2 <= 8)
replace H2WP3 = . if (H2WP3 >= 6 & H2WP3 <= 8)
replace H2WP4 = . if (H2WP4 >= 6 & H2WP4 <= 8)
replace H2WP5 = . if (H2WP5 >= 6 & H2WP5 <= 8)
replace H2WP6 = . if (H2WP6 >= 6 & H2WP6 <= 8)
replace H2WP7 = . if (H2WP7 >= 6 & H2WP7 <= 8)

replace H2WP8 = . if (H2WP8 >= 96 & H2WP8 <= 98)





* BMI 
replace H2GH31 = . if (H2GH31 == 6 | H2GH31 == 8)

replace H2GH42 = "" if (H2GH42 == "999996" | H2GH42 ==  "999998") 
replace H2GH43 = "" if (H2GH43 == "999996" | H2GH43 ==  "999998") 
replace H2GH44 = . if (H2GH44 >= 96 & H2GH44 <= 98)

replace H2GH45 = . if (H2GH45 >= 6 & H2GH45 <= 8)



replace H2GH52F = . if (H2GH52F == 96 | H2GH52F == 98)
replace H2GH52I = . if (H2GH52I == 96 | H2GH52I == 98)


replace H2GH53 = . if (H2GH53 == 996 | H2GH53 == 998)













* smoking
replace H2TO1 = . if (H2TO1 == 6 | H2TO1 == 8)
replace H2TO3 = . if (H2TO3 == 6 | H2TO3 == 7 | H2TO3 == 8)
replace H2TO5 = . if (H2TO5 == 96 | H2TO5 == 97 | H2TO5 == 98)
replace H2TO7 = . if (H2TO7 == 96 | H2TO7 == 97 | H2TO7 == 98)



* drinking
replace H2TO15 = . if (H2TO15 == 6 | H2TO15 == 8)

replace H2TO19 = . if (H2TO19 == 96 | H2TO19 == 97 | H2TO19 == 98)
replace H2TO20 = . if (H2TO20 == 96 | H2TO20 == 97 | H2TO20 == 98)
replace H2TO21 = . if (H2TO21 == 96 | H2TO21 == 97 | H2TO21 == 98)
replace H2TO22 = . if (H2TO22 == 96 | H2TO22 == 97 | H2TO22 == 98)

* marijuana
replace H2TO46 = . if (H2TO46 == 996 | H2TO46 == 997 | H2TO46 == 998 )

* cocaine
replace H2TO52 = . if (H2TO52 == 996 | H2TO52 == 997 | H2TO52 == 998)

* inhalants
replace H2TO56 = . if (H2TO56 == 996 | H2TO56 == 997 | H2TO56 == 998)

* other illegal drugs
replace H2TO60 = . if (H2TO60 == 996 | H2TO60 == 997 | H2TO60 == 998)


* sex
replace H2CO2 = . if (H2CO2 == 6 | H2CO2 == 8)




* nutrition

replace H2NU5 = . if H2NU5 == 8
replace H2NU6 = . if H2NU6 == 8


forvalues i = 10(1) 30 {
replace H2NU`i' = . if H2NU`i' == 8

}


replace H2NU60 = . if H2NU60 == 8
replace H2NU62 = . if H2NU62 == 8
replace H2NU63 = . if H2NU63 == 8
replace H2NU66 = . if H2NU66 == 8
replace H2NU70 = . if H2NU70 == 8

replace H2NU77 = . if H2NU77 >= 8
replace H2NU78 = . if H2NU78 >= 8
replace H2NU79 = . if H2NU79 >= 8
replace H2NU80 = . if H2NU80 >= 8




replace H2GH1 = . if (H2GH1 == 6 | H2GH1 == 8)

forvalues i = 8(1)27 {
	replace H2GH`i' = . if (H2GH`i' == 6 | H2GH`i' == 8)
}





save temp_missing_data, replace
