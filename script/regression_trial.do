cd "D:\Dropbox\J file\dissertation\Add_health_data\temp_data"


use Add_Health_merged_w1_to_w4, clear


gen race = .

replace race = 1 if H1GI4 == 1   // Hispanic, All Races
replace race = 2 if H1GI6B == 1  // Black or African American, Non-Hispanic
replace race = 3 if H1GI6D == 1  // Asian, Non-Hispanic
replace race = 4 if H1GI6C == 1  // Native American, Non-Hispanic
replace race = 5 if H1GI6E == 1  // Other, Non-Hispanic
replace race = 6 if H1GI6A == 1  // White, Non-Hispanic





gen Extraversion = H4PE1 + H4PE9 + H4PE17 + H4PE25 
gen Agreeableness = H4PE2 + H4PE10 + H4PE18 + H4PE26 
gen Conscientiousness = H4PE3 + H4PE11 + H4PE19 + H4PE27
gen Neuroticism = H4PE4 + H4PE12 + H4PE20 + H4PE28
gen Openness = H4PE5 + H4PE13 + H4PE21 + H4PE29



egen zExtraversion = std(Extraversion)
egen zAgreeableness = std(Agreeableness) 
egen zConscientiousness = std(Conscientiousness)
egen zNeuroticism = std(Neuroticism)
egen zOpenness = std(Openness)




global resident_mom "H1RM1 H1RM2 H1RM4 H1RM5 H1RM7 H1RM8 H1RM9 H1RM10 H1RM11 H1RM12 H1RM13 H1RM14"
global resident_dad "H1RF1 H1RF2 H1RF4 H1RF5 H1RF7 H1RF8 H1RF9 H1RF10 H1RF11 H1RF12 H1RF13 H1RF14"


sum BIO_SEX race H1GI1Y $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12

reg H2NU78  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 AH_PVT AH_RAW H2EE8 
* signif

reg H2NU79  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 AH_PVT AH_RAW H2EE8 

reg H2NU77  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 AH_PVT AH_RAW  zExtraversion zAgreeableness zConscientiousness zNeuroticism zOpenness H2EE8 
* very signif!!


reg H2NU80  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 AH_PVT AH_RAW  H2EE8



reg H2NU63  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 AH_PVT AH_RAW H2EE8



reg H2NU78  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8  AH_PVT AH_RAW H1EE4 H1EE5


reg S10D  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H1EE4 H1EE5  AH_PVT AH_RAW H2NU77 H2NU78



reg H3EC4 BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW zExtraversion zAgreeableness zConscientiousness zNeuroticism zOpenness H2DA6  





 foreach name of varlist H2DA1-H2WS17 {


	capture  reg `name'  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW H2DA6
	capture noisily est table, keep(H2DA6)  star(.05 .01 .001) title(`name')


}





 foreach name of varlist  H4OD2A-H4EO7 {


	capture  reg `name'  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW zExtraversion zAgreeableness zConscientiousness zNeuroticism zOpenness H2DA6
	capture noisily est table, keep(H2DA6)  star(.05 .01 .001) title(`name')


}



 foreach name of varlist H2DA1-H2WS17 {


	capture  reg `name'  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW zExtraversion zAgreeableness zConscientiousness zNeuroticism zOpenness H2DA6 H2EE8 [pweight = GSWGT2]
	capture noisily est table, keep(H2EE8)  star(.05 .01 .001) title(`name')


}



 foreach name of varlist H2DA1-H2WS17 {


	capture  reg `name'  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW zExtraversion zAgreeableness zConscientiousness zNeuroticism zOpenness H2DA6 H2EE8 H2EE5[pweight = GSWGT2]
	capture noisily est table, keep(H2EE5)  star(.05 .01 .001) title(`name')


}




 foreach name of varlist H2DA1-H2WS17 {


	capture  reg `name'  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW zExtraversion zAgreeableness zConscientiousness zNeuroticism zOpenness H2DA6 H2EE8 H2EE5[pweight = GSWGT2]
	capture noisily est table, keep(zConscientiousness)  star(.05 .01 .001) title(`name')


}





 foreach name of varlist H2DA1-H2WS17 {


	capture  reg H2EE4  `name'  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW zExtraversion zAgreeableness zConscientiousness zNeuroticism zOpenness H2DA6 H2EE8 H2EE5[pweight = GSWGT2]
	capture noisily est table, keep(`name')  star(.05 .01 .001) title(`name')


}




 foreach name of varlist H2DA1-H2WS17 {


	capture  reg `name'  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW zExtraversion zAgreeableness zConscientiousness zNeuroticism zOpenness H2DA6 H2EE8 H2EE5 H2NU77 [pweight = GSWGT2]
	capture noisily est table, keep(H2NU77)  star(.05 .01 .001) title(`name')


}



 foreach name of varlist H2DA1-H2WS17 {


	capture reg H2NU77 `name'  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW zExtraversion zAgreeableness zConscientiousness zNeuroticism zOpenness H2DA6 H2EE8 H2EE5  [pweight = GSWGT2]
	capture noisily est table, keep(`name')  star(.05 .01 .001) title(`name')


}



foreach name of varlist H2DA1-H2WS17 {

  foreach name2 of varlist H2DA1-H2WS17 {


	capture reg `name2' `name'  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW zExtraversion zAgreeableness zConscientiousness zNeuroticism zOpenness H2DA6 H2EE8 H2EE5  [pweight = GSWGT2]
	capture noisily est table, keep(`name')  star(.05 .01 .001) title(`name2')

	}
}





 foreach name of varlist H2DA1-H2WS17 {


	capture  reg `name'  H2RM7  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW zExtraversion zAgreeableness zConscientiousness zNeuroticism zOpenness H2DA6 H2EE8 H2EE5[pweight = GSWGT2]
	capture noisily est table, keep(H2RM7)  star(.05 .01 .001) title(`name')


}




reg H2DA8  H2RM7 AH_PVT  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12 H1EE8 H2NU77 H2NU78 AH_PVT AH_RAW H1PF1-H1PF36  S10 S10A S10B S10C S10D H2WP17H H2WP17I H2DA6 H2EE8 H2EE5[pweight = GSWGT2]




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


gen percentage_allowance = allowance_w2/earning_per_week_w2

reg H2NU80  percentage_allowance AH_PVT  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12  H2NU77 H2NU78 AH_PVT AH_RAW H1PF1-H1PF36  S10 S10A S10B S10C S10D H2WP17H H2WP17I [pweight = GSWGT2]




reg H2DA8  c.H2RM7##c.H2RM4 AH_PVT  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12  H2NU77 H2NU78 AH_PVT AH_RAW H1PF1-H1PF36  S10 S10A S10B S10C S10D H2WP17H H2WP17I H2DA6 earning_per_week_w2[pweight = GSWGT2]



reg H2DA8  c.H2RM7##c.Conscientiousness_w1 AH_PVT  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12  H2NU77 H2NU78 AH_PVT AH_RAW H1PF1-H1PF36  S10 S10A S10B S10C S10D H2WP17H H2WP17I H2DA6 earning_per_week_w2[pweight = GSWGT2]
reg H2DA8  H2RM7 Conscientiousness_w1 AH_PVT  BIO_SEX race H1GI1Y H1RE1 $resident_mom $resident_dad PA21 PA28A-PA28J PA30 PA55 PA56 PA57A-PA57F PB8 PA12  H2NU77 H2NU78 AH_PVT AH_RAW H1PF1-H1PF36  S10 S10A S10B S10C S10D H2WP17H H2WP17I H2DA6 earning_per_week_w2[pweight = GSWGT2]
