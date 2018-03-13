

cd "$data_output"


clear

* use Add_Health_merged_w1_to_w2, clear


use Add_Health_merged_w1_to_w4, clear









********* Gender variable  ***********
replace BIO_SEX = . if (BIO_SEX == 6 | BIO_SEX==8)
* BIO_SEX2 does not have to change

* but BIO_SEX has 25 cases different from BIO_SEX2. read add health section: http://www.cpc.unc.edu/projects/addhealth/faqs/aboutdata
replace BIO_SEX = BIO_SEX2 if (BIO_SEX != BIO_SEX2 & BIO_SEX2 !=.)   // should be 25 changes only. web said 23, just ignore it)
********* Gender variable  ***********



********* Personality traits variable  ***********
* clean missing value
forvalues i = 18(1)21 {
	replace H1PF`i' = . if (H1PF`i' == 6 | H1PF`i' == 8 | H1PF`i' == 9)
}



foreach  variables in H1PF30 H1PF32 H1PF33 H1PF34 H1PF35 H1PF36 {
	replace `variables' = . if (`variables' == 6 | `variables' == 8 | `variables'  == 9)
}



foreach variables in S62B  S62E  S62O {
	replace `variables' = . if  (`variables' == 9)
}


* construct variable

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



foreach personality in Neuroticism_w1 Conscientiousness_w1 Extraversion_w1 {
	egen z`personality' = std(`personality')
}


** this reverse the interpretation of conscientiousness!!!!
replace zConscientiousness_w1 = zConscientiousness_w1*(-1)   // higher number indicates more conscientious


replace zNeuroticism_w1 = zNeuroticism_w1*(-1)  // higher number indicates more the neurotic



replace zExtraversion_w1 = zExtraversion_w1*(-1)   // higher number indicates more extravert

********* Personality traits variable  ***********









********* Race  ***********
* clean missing value
replace H1GI4 = . if (H1GI4 == 6 | H1GI4 == 8)

replace H1GI6A = . if (H1GI6A == 6 | H1GI6A == 8 | H1GI6A == 9)
replace H1GI6B = . if (H1GI6B == 6 | H1GI6B == 8 | H1GI6B == 9)
replace H1GI6C = . if (H1GI6C == 6 | H1GI6C == 8 | H1GI6C == 9)
replace H1GI6D = . if (H1GI6D == 6 | H1GI6D == 8 | H1GI6D == 9)
replace H1GI6E = . if (H1GI6E == 6 | H1GI6E == 8 | H1GI6E == 9)


* construct variable
* this process is according to http://www.cpc.unc.edu/projects/addhealth/faqs/aboutdata/index.html#RACE
* only 1 race will be placed
gen race = .
replace race = 1 if H1GI4==1  /* Hispanic, All Races */ 
replace race = 2 if (H1GI6B==1 & H1GI4 == 0) /* Black or African American, Non-Hispanic */
replace race = 3 if (H1GI6D==1 & H1GI4 == 0 & H1GI6B == 0 ) /* Asian, Non-Hispanic */ 
replace race = 4 if (H1GI6C==1 & H1GI4 == 0 & H1GI6B == 0 & H1GI6D == 0) /* Native American, Non-Hispanic */ 
replace race = 5 if (H1GI6E==1 & H1GI4 == 0 & H1GI6B == 0 & H1GI6D == 0 & H1GI6C == 0 ) /* Other, Non-Hispanic */ 
replace race = 6 if (H1GI6A==1 & H1GI4 == 0 & H1GI6B == 0 & H1GI6D == 0 & H1GI6C == 0 & H1GI6E == 0) /* White, Non-Hispanic */ 


********* Race  ***********





********* age ***********
* clean missing value
replace H1GI1M = . if (H1GI1M == 96)
replace H1GI1Y = . if (H1GI1Y == 96)

replace H2GI1M = . if (H2GI1M == 98)
replace H2GI1Y = . if (H2GI1Y == 98)




* construct variable
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
********* age ***********






********* number of siblings ***********

* no need to clean missing value. 
* * check obs 7841 for an example

* construct variable
egen num_bro_w1 = anycount(H1HR3A H1HR3B H1HR3C H1HR3D H1HR3E H1HR3F H1HR3G H1HR3H H1HR3I H1HR3J H1HR3K H1HR3L H1HR3M H1HR3N H1HR3O H1HR3P H1HR3Q H1HR3R H1HR3S H1HR3T), values(5)
egen num_sis_w1 = anycount(H1HR3A H1HR3B H1HR3C H1HR3D H1HR3E H1HR3F H1HR3G H1HR3H H1HR3I H1HR3J H1HR3K H1HR3L H1HR3M H1HR3N H1HR3O H1HR3P H1HR3Q H1HR3R H1HR3S H1HR3T), values(8)

replace num_bro_w1 = . if H1HR3A ==.
replace num_sis_w1 = . if H1HR3A ==.

gen num_siblings_w1 = num_bro_w1 + num_sis_w1


egen num_bro_w2 = anycount(H2HR4A H2HR4B H2HR4C H2HR4D H2HR4E H2HR4F H2HR4G H2HR4H H2HR4I H2HR4J H2HR4K H2HR4L H2HR4M H2HR4N H2HR4O H2HR4P H2HR4Q), values(5)
egen num_sis_w2 = anycount(H2HR4A H2HR4B H2HR4C H2HR4D H2HR4E H2HR4F H2HR4G H2HR4H H2HR4I H2HR4J H2HR4K H2HR4L H2HR4M H2HR4N H2HR4O H2HR4P H2HR4Q), values(8)

replace num_bro_w2 = . if H2HR4A ==.
replace num_sis_w2 = . if H2HR4A ==.


gen num_siblings_w2 = num_bro_w2 + num_sis_w2

********* number of siblings ***********








********* no mom/dad indicator ***********
* construct variable
gen no_mom_w1 = 0 if H1RM1 < 99
replace no_mom_w1 = 1 if H1RM1 == 97

gen no_dad_w1 = 0 if H1RF1 < 99
replace no_dad_w1 = 1 if H1RF1 == 97

gen no_mom_w2 = 0 if H2RM4 < 99
replace no_mom_w2 = 1 if H2RM4 == 97

gen no_dad_w2 = 0 if H2RF4 < 99
replace no_dad_w2 = 1 if H2RF4 == 97
********* no mom/dad indicator ***********




* mom age check again. Should i put in 0 for mom age? Can write another command to check replace age_mom_w1 = H1HR7A if (H1HR12 == 1 & H1HR7A < 990)
********* age mom ***********

*********** contruct variable for wave 1
foreach alpha in A B C D E F G H I J K L M N O P Q R S T {
	gen age_mom_`alpha'_w1 = .
	gen age_mom_`alpha'_est_w1 = .

	replace age_mom_`alpha'_w1 = H1HR7`alpha' if (H1HR3`alpha' == 14  & H1HR7`alpha' < 990)

	replace age_mom_`alpha'_est_w1 = H1HR8`alpha' if (H1HR3`alpha' == 14  & H1HR8`alpha' <= 990)
}

* this line use rowmean just to be convenient
egen age_mom_w1 = rowmean(age_mom_A_w1 age_mom_B_w1 age_mom_C_w1 age_mom_D_w1 age_mom_E_w1 age_mom_F_w1 age_mom_G_w1 age_mom_H_w1 age_mom_I_w1 age_mom_J_w1 age_mom_K_w1 age_mom_L_w1 age_mom_M_w1 age_mom_N_w1 ///
age_mom_O_w1 age_mom_P_w1 age_mom_Q_w1 age_mom_R_w1 age_mom_S_w1 age_mom_T_w1 ///
age_mom_A_est_w1 age_mom_B_est_w1 age_mom_C_est_w1 age_mom_D_est_w1 age_mom_E_est_w1 age_mom_F_est_w1 age_mom_G_est_w1 age_mom_H_est_w1 age_mom_I_est_w1 age_mom_J_est_w1 age_mom_K_est_w1 age_mom_L_est_w1 age_mom_M_est_w1 age_mom_N_est_w1 ///
age_mom_O_est_w1 age_mom_P_est_w1 age_mom_Q_est_w1 age_mom_R_est_w1 age_mom_S_est_w1 age_mom_T_est_w1)



replace age_mom_w1 = 0 if (H1HR12 == 0)
	
replace age_mom_w1 = H1HR7A if (H1HR12 == 1 & H1HR7A < 990)
replace age_mom_w1 = H1HR7B if (H1HR12 == 2 & H1HR7B < 990)
replace age_mom_w1 = H1HR7C if (H1HR12 == 3 & H1HR7C < 990)
replace age_mom_w1 = H1HR7D if (H1HR12 == 4 & H1HR7D < 990)
replace age_mom_w1 = H1HR7E if (H1HR12 == 5 & H1HR7E < 990)
replace age_mom_w1 = H1HR7F if (H1HR12 == 6 & H1HR7F < 990)
replace age_mom_w1 = H1HR7G if (H1HR12 == 7 & H1HR7G < 990)
replace age_mom_w1 = H1HR7H if (H1HR12 == 8 & H1HR7H < 990)
replace age_mom_w1 = H1HR7I if (H1HR12 == 9 & H1HR7I < 990)
replace age_mom_w1 = H1HR7J if (H1HR12 == 10 & H1HR7J < 990)
replace age_mom_w1 = H1HR7K if (H1HR12 == 11 & H1HR7K < 990)

replace age_mom_w1 = H1HR8A if (H1HR12 == 1 & H1HR7A == 998)
replace age_mom_w1 = H1HR8B if (H1HR12 == 2 & H1HR7B == 998)
replace age_mom_w1 = H1HR8C if (H1HR12 == 3 & H1HR7C == 998)
replace age_mom_w1 = H1HR8D if (H1HR12 == 4 & H1HR7D == 998)
replace age_mom_w1 = H1HR8E if (H1HR12 == 5 & H1HR7E == 998)
replace age_mom_w1 = H1HR8F if (H1HR12 == 6 & H1HR7F == 998)
replace age_mom_w1 = H1HR8G if (H1HR12 == 7 & H1HR7G == 998)
replace age_mom_w1 = H1HR8H if (H1HR12 == 8 & H1HR7H == 998)
replace age_mom_w1 = H1HR8I if (H1HR12 == 9 & H1HR7I == 998)
replace age_mom_w1 = H1HR8J if (H1HR12 == 10 & H1HR7J == 998)
replace age_mom_w1 = H1HR8K if (H1HR12 == 11 & H1HR7K == 998)
	
	

* command for double checking:
*   br age_mom_w1 no_mom_w1 H1HR12 H1HR7A H1HR8A if H1HR12 == 1

replace age_mom_w1 = . if age_mom_w1 > 990   // need this to kick out all other unknown data
replace age_mom_w1 = 0 if (no_mom_w1 == 1 & age_mom_w1 ==.) //check whether this number = no_mom )






*********** contruct variable for wave 2
foreach alpha in A B C D E F G H I J K L M N O P Q {
	gen age_mom_`alpha'_w2 = .
	gen age_mom_`alpha'_est_w2 = .

	replace age_mom_`alpha'_w2 = H2HR8`alpha' if (H2HR4`alpha' == 14  & H2HR8`alpha' < 990)
	replace age_mom_`alpha'_est_w2 = H2HR9`alpha' if (H2HR4`alpha' == 14  & H2HR9`alpha' <= 990)

}

* this line use egen just to be convenient
egen age_mom_w2 = rowmean( age_mom_A_w2 age_mom_B_w2 age_mom_C_w2 age_mom_D_w2 age_mom_E_w2 age_mom_F_w2 age_mom_G_w2 age_mom_H_w2 age_mom_I_w2 age_mom_J_w2 age_mom_K_w2 age_mom_L_w2 age_mom_M_w2 age_mom_N_w2 ///
age_mom_O_w2 age_mom_P_w2 age_mom_Q_w2  ///
age_mom_A_est_w2 age_mom_B_est_w2 age_mom_C_est_w2 age_mom_D_est_w2 age_mom_E_est_w2 age_mom_F_est_w2 age_mom_G_est_w2 age_mom_H_est_w2 age_mom_I_est_w2 age_mom_J_est_w2 age_mom_K_est_w2 age_mom_L_est_w2 age_mom_M_est_w2 age_mom_N_est_w2 ///
age_mom_O_est_w2 age_mom_P_est_w2 age_mom_Q_est_w2)


	
	
	
	
replace age_mom_w2 = H2HR8A if (H2HR10 == 1 & H2HR8A < 990)	
replace age_mom_w2 = H2HR8B if (H2HR10 == 2 & H2HR8B < 990)	
replace age_mom_w2 = H2HR8C if (H2HR10 == 3 & H2HR8C < 990)	
replace age_mom_w2 = H2HR8D if (H2HR10 == 4 & H2HR8D < 990)	
replace age_mom_w2 = H2HR8E if (H2HR10 == 5 & H2HR8E < 990)	
replace age_mom_w2 = H2HR8F if (H2HR10 == 6 & H2HR8F < 990)	
replace age_mom_w2 = H2HR8G if (H2HR10 == 7 & H2HR8G < 990)	
replace age_mom_w2 = H2HR8H if (H2HR10 == 8 & H2HR8H < 990)	
replace age_mom_w2 = H2HR8I if (H2HR10 == 9 & H2HR8I < 990)	

replace age_mom_w2 = H2HR9A if (H2HR10 == 1 & H2HR8A == 998)	
replace age_mom_w2 = H2HR9B if (H2HR10 == 2 & H2HR8B == 998)	
replace age_mom_w2 = H2HR9C if (H2HR10 == 3 & H2HR8C == 998)	
replace age_mom_w2 = H2HR9D if (H2HR10 == 4 & H2HR8D == 998)	
replace age_mom_w2 = H2HR9E if (H2HR10 == 5 & H2HR8E == 998)	
replace age_mom_w2 = H2HR9F if (H2HR10 == 6 & H2HR8F == 998)	
replace age_mom_w2 = H2HR9G if (H2HR10 == 7 & H2HR8G == 998)	
replace age_mom_w2 = H2HR9H if (H2HR10 == 8 & H2HR8H == 998)	
replace age_mom_w2 = H2HR9I if (H2HR10 == 9 & H2HR8I == 998)	
	
* command for double checking:
*   br age_mom_w2 no_mom_w2 H2HR10 H2HR8A H2HR9A if H2HR10 == 1



replace age_mom_w2 = . if age_mom_w2 > 990  
replace age_mom_w2 = 0 if (no_mom_w2 == 1 & age_mom_w2 ==.) //check whether this number = no_mom )


********* age mom ***********











********* age dad ***********

*********** contruct variable for wave 1	
foreach alpha in A B C D E F G H I J K L M N O P Q R S T {	
	gen age_dad_`alpha'_w1 = .
	gen age_dad_`alpha'_est_w1 = .
	
	replace age_dad_`alpha'_w1 = H1HR7`alpha' if (H1HR3`alpha' == 11  & H1HR7`alpha' < 200)
	replace age_dad_`alpha'_est_w1 = H1HR8`alpha' if (H1HR3`alpha' == 11  & H1HR8`alpha' <= 990)

}	
	
egen age_dad_w1 = rowmean( age_dad_A_w1 age_dad_B_w1 age_dad_C_w1 age_dad_D_w1 age_dad_E_w1 age_dad_F_w1 age_dad_G_w1 age_dad_H_w1 age_dad_I_w1 age_dad_J_w1 age_dad_K_w1 age_dad_L_w1 age_dad_M_w1 age_dad_N_w1 ///	
age_dad_O_w1 age_dad_P_w1 age_dad_Q_w1 age_dad_R_w1 age_dad_S_w1 age_dad_T_w1 ///
age_dad_A_est_w1 age_dad_B_est_w1 age_dad_C_est_w1 age_dad_D_est_w1 age_dad_E_est_w1 age_dad_F_est_w1 age_dad_G_est_w1 age_dad_H_est_w1 age_dad_I_est_w1 age_dad_J_est_w1 age_dad_K_est_w1 age_dad_L_est_w1 age_dad_M_est_w1 age_dad_N_est_w1 ///
age_dad_O_est_w1 age_dad_P_est_w1 age_dad_Q_est_w1 age_dad_R_est_w1 age_dad_S_est_w1 age_dad_T_est_w1)	
	
replace age_dad_w1 = 0 if (H1HR13 == 0)
	
replace age_dad_w1 = H1HR7A if (H1HR13 == 1 & H1HR7A < 990)
replace age_dad_w1 = H1HR7B if (H1HR13 == 2 & H1HR7B < 990)
replace age_dad_w1 = H1HR7C if (H1HR13 == 3 & H1HR7C < 990)
replace age_dad_w1 = H1HR7D if (H1HR13 == 4 & H1HR7D < 990)
replace age_dad_w1 = H1HR7E if (H1HR13 == 5 & H1HR7E < 990)
replace age_dad_w1 = H1HR7F if (H1HR13 == 6 & H1HR7F < 990)
replace age_dad_w1 = H1HR7G if (H1HR13 == 7 & H1HR7G < 990)
replace age_dad_w1 = H1HR7H if (H1HR13 == 8 & H1HR7H < 990)
replace age_dad_w1 = H1HR7I if (H1HR13 == 9 & H1HR7I < 990)
replace age_dad_w1 = H1HR7J if (H1HR13 == 10 & H1HR7J < 990)
replace age_dad_w1 = H1HR7N if (H1HR13 == 14 & H1HR7N < 990)

replace age_dad_w1 = H1HR8A if (H1HR13 == 1 & H1HR7A == 998)
replace age_dad_w1 = H1HR8B if (H1HR13 == 2 & H1HR7B == 998)
replace age_dad_w1 = H1HR8C if (H1HR13 == 3 & H1HR7C == 998)
replace age_dad_w1 = H1HR8D if (H1HR13 == 4 & H1HR7D == 998)
replace age_dad_w1 = H1HR8E if (H1HR13 == 5 & H1HR7E == 998)
replace age_dad_w1 = H1HR8F if (H1HR13 == 6 & H1HR7F == 998)
replace age_dad_w1 = H1HR8G if (H1HR13 == 7 & H1HR7G == 998)
replace age_dad_w1 = H1HR8H if (H1HR13 == 8 & H1HR7H == 998)
replace age_dad_w1 = H1HR8I if (H1HR13 == 9 & H1HR7I == 998)
replace age_dad_w1 = H1HR8J if (H1HR13 == 10 & H1HR7J == 998)
replace age_dad_w1 = H1HR8N if (H1HR13 == 14 & H1HR7N == 998)


* command for double checking:
*   br age_dad_w1 no_dad_w1 H1HR13 H1HR7A H1HR8A if H1HR13 == 1
	
replace age_dad_w1 = . if age_dad_w1 > 500	
replace age_dad_w1 = 0 if (no_dad_w1 == 1 & age_dad_w1 ==.)





*********** contruct variable for wave 2	


foreach alpha in A B C D E F G H I J K L M N O P Q {	
	gen age_dad_`alpha'_w2 = .
	gen age_dad_`alpha'_est_w2 = .

	replace age_dad_`alpha'_w2 = H2HR8`alpha' if (H2HR4`alpha' == 11  & H2HR8`alpha' < 990)
	replace age_dad_`alpha'_est_w2 = H2HR9`alpha' if (H2HR4`alpha' == 11  & H2HR9`alpha' <= 990)
	
}	
	
egen age_dad_w2 = rowmean( age_dad_A_w2 age_dad_B_w2 age_dad_C_w2 age_dad_D_w2 age_dad_E_w2 age_dad_F_w2 age_dad_G_w2 age_dad_H_w2 age_dad_I_w2 age_dad_J_w2 age_dad_K_w2 age_dad_L_w2 age_dad_M_w2 age_dad_N_w2 ///	
age_dad_O_w2 age_dad_P_w2 age_dad_Q_w2  ///
age_dad_A_est_w2 age_dad_B_est_w2 age_dad_C_est_w2 age_dad_D_est_w2 age_dad_E_est_w2 age_dad_F_est_w2 age_dad_G_est_w2 age_dad_H_est_w2 age_dad_I_est_w2 age_dad_J_est_w2 age_dad_K_est_w2 age_dad_L_est_w2 age_dad_M_est_w2 age_dad_N_est_w2 ///
age_dad_O_est_w2 age_dad_P_est_w2 age_dad_Q_est_w2)	
	

replace age_dad_w2 = H2HR8A if (H2HR11 == 1 & H2HR8A < 990)	
replace age_dad_w2 = H2HR8B if (H2HR11 == 2 & H2HR8B < 990)	
replace age_dad_w2 = H2HR8C if (H2HR11 == 3 & H2HR8C < 990)	
replace age_dad_w2 = H2HR8D if (H2HR11 == 4 & H2HR8D < 990)	
replace age_dad_w2 = H2HR8E if (H2HR11 == 5 & H2HR8E < 990)	
replace age_dad_w2 = H2HR8F if (H2HR11 == 6 & H2HR8F < 990)	
replace age_dad_w2 = H2HR8G if (H2HR11 == 7 & H2HR8G < 990)	
replace age_dad_w2 = H2HR8H if (H2HR11 == 8 & H2HR8H < 990)	
	
replace age_dad_w2 = H2HR9A if (H2HR11 == 1 & H2HR8A == 998)	
replace age_dad_w2 = H2HR9B if (H2HR11 == 2 & H2HR8B == 998)	
replace age_dad_w2 = H2HR9C if (H2HR11 == 3 & H2HR8C == 998)	
replace age_dad_w2 = H2HR9D if (H2HR11 == 4 & H2HR8D == 998)	
replace age_dad_w2 = H2HR9E if (H2HR11 == 5 & H2HR8E == 998)	
replace age_dad_w2 = H2HR9F if (H2HR11 == 6 & H2HR8F == 998)	
replace age_dad_w2 = H2HR9G if (H2HR11 == 7 & H2HR8G == 998)	
replace age_dad_w2 = H2HR9H if (H2HR11 == 8 & H2HR8H == 998)	

* command for double checking:
*   br age_dad_w2 no_dad_w2 H1HR13 H1HR7A H1HR8A if H1HR13 == 1
	
replace age_dad_w2 = . if age_dad_w2 > 990	
replace age_dad_w2 = 0 if (no_dad_w2 == 1 & age_dad_w2 ==.)



********* age dad ***********







********* occupations ***********
* clean missing value and contruct variables for wave 1
replace H1RM4 = . if (H1RM4 >= 96 & H1RM4 <= 99)
rename H1RM4 res_mom_occupation_w1
replace res_mom_occupation_w1 = 99 if no_mom_w1 == 1



replace H1RF4 = . if (H1RF4 >= 96 & H1RF4 <= 99)
rename H1RF4 res_dad_occupation_w1
replace res_dad_occupation_w1 = 99 if no_dad_w1 == 1



* clean missing value and contruct variables for wave 2
replace H2RM4 = . if (H2RM4 >= 96 & H2RM4 <= 98)
rename H2RM4 res_mom_occupation_w2
replace res_mom_occupation_w2 = 99 if no_mom_w2 == 1



replace H2RF4 = . if (H2RF4 >= 96 & H2RF4 <= 98)
rename H2RF4 res_dad_occupation_w2
replace res_dad_occupation_w2 = 99 if no_dad_w2 == 1
********* occupations ***********




********* education ***********
* clean missing value and contruct variables for wave 1


* mom 
replace H1RM1 = . if (H1RM1 == 96 | H1RM1 == 97 | H1RM1 == 98)
gen mom_edu_impute_indicator_w1 = 1 if no_mom_w1 == 1 
replace mom_edu_impute_indicator_w1 = 0 if H1RM1 != .


rename H1RM1 res_mom_educ_w1
replace res_mom_educ_w1 = 99 if no_mom_w1 == 1


* dad
replace H1RF1 = . if (H1RF1 == 96 | H1RF1 == 97 | H1RF1 == 98 | H1RF1 == 99)
gen dad_edu_impute_indicator_w1 = 1 if no_dad_w1 == 1 
replace dad_edu_impute_indicator_w1 = 0 if H1RF1 != .


rename H1RF1 res_dad_educ_w1
replace res_dad_educ_w1 = 99 if no_dad_w1 == 1
tab res_dad_educ_w1 




* clean missing value and contruct variables for wave 2

* mom 
replace H2RM1 = . if (H2RM1 == 97)
gen mom_edu_impute_indicator_w2 = 1 if no_mom_w2 == 1 | (res_mom_educ_w1 != .  & no_mom_w2 !=. & res_mom_educ_w1 ! = 99 & H2RM1 == .)
replace mom_edu_impute_indicator_w2 = 0 if H2RM1 != .

rename H2RM1 res_mom_educ_w2
replace res_mom_educ_w2 = 99 if no_mom_w2 == 1
replace res_mom_educ_w2 = res_mom_educ_w1 if (res_mom_educ_w1 != . & res_mom_educ_w2 == . & no_mom_w2 !=. & res_mom_educ_w1 ! = 99)



* dad
replace H2RF1 = . if (H2RF1 == 96 | H2RF1 == 97)
gen dad_edu_impute_indicator_w2 = 1 if no_dad_w2 == 1 | (res_dad_educ_w1 != .  & no_dad_w2 !=. & res_dad_educ_w1 != 99 & H2RF1 == .)
replace dad_edu_impute_indicator_w2 = 0 if H2RF1 != .


rename H2RF1 res_dad_educ_w2
replace res_dad_educ_w2 = 99 if no_dad_w2 == 1
replace res_dad_educ_w2 = res_dad_educ_w1 if (res_dad_educ_w1 != . & res_dad_educ_w2 == . & no_dad_w2 !=. & res_dad_educ_w1 ! = 99)
********* education ***********



********* family income ***********

replace PA55 = . if (PA55 == 9996)
rename PA55 family_income_1994
gen fam_income_impute_ind = 1 if (family_income_1994 ==. & AID != ".")
replace fam_income_impute_ind = 0 if family_income_1994 !=.

sum family_income_1994 [aweight = GSWGT1] 
replace family_income_1994 = r(mean) if AID != "." & family_income_1994 == . & fam_income_impute_ind == 1

********* family income ***********






********* earning per week  *********** (checked)
* clean missing value and contruct variables for wave 1
gen earnings_non_summer_w1 = .
replace earnings_non_summer_w1 = H1EE5 if (H1EE5 >= 0 & H1EE5 < 996)
replace earnings_non_summer_w1 = 0 if H1EE4 == 0


gen earnings_summer_w1 = .
replace earnings_summer_w1 = H1EE7 if (H1EE7 >= 0 & H1EE7 < 996)
replace earnings_summer_w1 = 0 if H1EE6 == 0

gen earnings_w1 = earnings_non_summer_w1 + earnings_summer_w1


gen allowance_w1 = .
replace allowance_w1 = H1EE8 if H1EE8 < 96




* clean missing value and contruct variables for wave 2

gen earnings_non_summer_w2 = .
replace earnings_non_summer_w2 = H2EE5 if (H2EE5 >= 0 & H2EE5 < 996)
replace earnings_non_summer_w2 = 0 if H2EE4 == 0


gen earnings_summer_w2 = .
replace earnings_summer_w2 = H2EE7 if (H2EE7 >= 0 & H2EE7 < 996)
replace earnings_summer_w2 = 0 if H2EE6 == 0

gen earnings_w2 = earnings_non_summer_w2 + earnings_summer_w2


gen allowance_w2 = .
replace allowance_w2 = H2EE8 if H2EE8 < 96
********* earning per week  ***********










* they are correct
********* month dummies ***********

gen month_year_w1 = IMONTH*IYEAR

gen month_year_w2 = IMONTH2*IYEAR2

********* month dummies ***********






********* Mom Work hours  ***********


* clean missing values
* 7 is taken away here. 7 include no occupation and no mom
replace H1RM5 = . if (H1RM5 == 6 | H1RM5 == 7 | H1RM5 == 8)
replace H2RM5 = . if (H2RM5 == 6 | H2RM5 == 7 | H2RM5 == 8)

replace H1RM7 = . if (H1RM7 >= 996 & H1RM7 <= 999)
replace H2RM7 = . if (H2RM7 >= 996 & H2RM7 <= 998)


* contruct variables wave 1
* all correct!
* res_mom_pay does not include no occupation ppl
rename H1RM5 res_mom_pay_w1
replace res_mom_pay_w1 = 99 if no_mom_w1 == 1


gen mwh_impute_indicator_w1 = 1 if no_mom_w1 == 1 | res_mom_pay_w1 == 0  | res_mom_occupation_w1 == 16
replace mwh_impute_indicator_w1 = 0 if H1RM7 != .
* check 1
rename H1RM7 res_mom_work_hours_w1   // continuous variable
replace res_mom_work_hours_w1 = 0 if no_mom_w1 == 1
 
gen res_mom_work_hours_v2_w1 = res_mom_work_hours_w1    
replace res_mom_work_hours_v2_w1 = 0 if (res_mom_pay_w1 == 0  | res_mom_occupation_w1 == 16)
 
 

* contruct variables wave 2
* all correct!
rename H2RM5 res_mom_pay_w2
replace res_mom_pay_w2 = 99 if no_mom_w2 == 1

 
gen mwh_impute_indicator_w2 = 1 if no_mom_w2 == 1 | res_mom_pay_w2 == 0  | res_mom_occupation_w2 == 16
replace mwh_impute_indicator_w2 = 0 if H2RM7 != . 

rename H2RM7 res_mom_work_hours_w2
replace res_mom_work_hours_w2 = 0 if no_mom_w2 == 1



gen res_mom_work_hours_v2_w2 = res_mom_work_hours_w2
replace res_mom_work_hours_v2_w2 = 0 if (res_mom_pay_w2 == 0  | res_mom_occupation_w2 == 16)


********* Mom Work hours  ***********








********* Dad Work hours  ***********

* clean missing values
replace H1RF5 = . if (H1RF5 == 6 | H1RF5 == 7 | H1RF5 == 8 | H1RF5 == 9)
replace H2RF5 = . if (H2RF5 == 6 | H2RF5 == 7 | H2RF5 == 8)

replace H1RF7 = . if (H1RF7 >= 996 & H1RF7 <= 999)
replace H2RF7 = . if (H2RF7 >= 996 & H2RF7 <= 998)



* contruct variables wave 1
* all correct!
* res_dad_pay does not include no occupation ppl

rename H1RF5 res_dad_pay_w1
replace res_dad_pay_w1 = 99 if no_dad_w1 == 1

gen dwh_impute_indicator_w1 = 1 if no_dad_w1 == 1 | res_dad_pay_w1 == 0  | res_dad_occupation_w1 == 16
replace dwh_impute_indicator_w1 = 0 if  H1RF7 != .


rename H1RF7 res_dad_work_hours_w1  // continuous variable
replace res_dad_work_hours_w1 = 0 if no_dad_w1 == 1

gen res_dad_work_hours_v2_w1 = res_dad_work_hours_w1 
replace res_dad_work_hours_v2_w1 = 0 if (res_dad_pay_w1 == 0  | res_dad_occupation_w1 == 16)




* contruct variables wave 2

rename H2RF5 res_dad_pay_w2
replace res_dad_pay_w2 = 99 if no_dad_w2 == 1


gen dwh_impute_indicator_w2 = 1 if no_dad_w2 == 1 | res_dad_pay_w2 == 0  | res_dad_occupation_w2 == 16
replace dwh_impute_indicator_w2 = 0 if  H2RF7 != .



rename H2RF7 res_dad_work_hours_w2
replace res_dad_work_hours_w2 = 0 if no_dad_w2 == 1



gen res_dad_work_hours_v2_w2 = res_dad_work_hours_w2
replace res_dad_work_hours_v2_w2 = 0 if (res_dad_pay_w2 == 0  | res_dad_occupation_w2 == 16)

********* Dad Work hours  ***********



*********************************************** OUTCOME VARIABLES ***********************************************




********* how many days smoke ***********
* clean missing value
replace H1TO1 = . if (H1TO1 == 6 | H1TO1 == 8 | H1TO1 == 9)
replace H1TO5 = . if (H1TO5 == 96 | H1TO5 == 97 | H1TO5 == 98 | H1TO5 == 99)

replace H2TO1 = . if (H2TO1 == 6 | H2TO1 == 8)
replace H2TO5 = . if (H2TO5 == 96 | H2TO5 == 97 | H2TO5 == 98)
* 8306
* 11893

* contruct variable for wave 1
* it wont add up to 11894. It is fine. Those are no information.
rename H1TO1 tried_cigarette_w1

rename H1TO5 how_many_days_smoke_w1
replace how_many_days_smoke_w1 = 0 if H1TO2 == 0 | tried_cigarette_w1 == 0 




* contruct variable for wave 2
rename H2TO1 tried_cigarette_w2
* no H2TO3 here
rename H2TO5 how_many_days_smoke_w2
replace how_many_days_smoke_w2 = 0 if tried_cigarette_w2 == 0




********* how many days smoke ***********




********* how many cigarettes a month ***********
* clean missing value
replace H1TO7 = . if (H1TO7 == 96 | H1TO7 == 97 | H1TO7 == 98 | H1TO7 == 99)
replace H2TO7 = . if (H2TO7 == 96 | H2TO7 == 97 | H2TO7 == 98)

* contruct variable for wave 1

* 8895 + 2812+ 3384 + 123 + 61. But here should be 15090 = 11706 + 3384 changes only
gen how_many_cigarettes_w1 = H1TO7
replace how_many_cigarettes_w1 = 0 if H1TO2 == 0 | tried_cigarette_w1 == 0 | how_many_days_smoke_w1 == 0

* contruct variable for wave 2

* But here should be 9907 = 8206 + 1701 changes only
gen how_many_cigarettes_w2 = H2TO7
replace how_many_cigarettes_w2 = 0 if tried_cigarette_w2 == 0 | how_many_days_smoke_w2 == 0



********* how many cigarettes a month ***********




********* total_smoke a month ***********
gen total_smoke_a_month_w1 = how_many_days_smoke_w1*how_many_cigarettes_w1

gen total_smoke_a_month_w2 = how_many_days_smoke_w2*how_many_cigarettes_w2


********* total_smoke a month ***********







********* drink days ***********
* clean missing value
replace H1TO12 = . if (H1TO12 == 6 | H1TO12 == 8 | H1TO12 == 9)
replace H2TO15 = . if (H2TO15 == 6 | H2TO15 == 8)


replace H1TO15 = . if (H1TO15 == 96 | H1TO15 == 97 | H1TO15 == 98)
replace H2TO19 = . if (H2TO19 == 96 | H2TO19 == 97 | H2TO19 == 98)


* contruct variable for wave 2



gen ever_drink_alcohol_w1 = H1TO12

gen drink_days_w1 = H1TO15
replace drink_days_w1 = 7 if ever_drink_alcohol_w1 == 0     

* v2 means translate it in days so that marginal effect can be interpreted using OLS
gen drink_days_v2_w1 = 365 if drink_days_w1 == 1
replace drink_days_v2_w1 = 4*52 if drink_days_w1 == 2
replace drink_days_v2_w1 = 1.5*52 if drink_days_w1 == 3
replace drink_days_v2_w1 = 2.5*12 if drink_days_w1 == 4
replace drink_days_v2_w1 = 7.5 if drink_days_w1 == 5
replace drink_days_v2_w1 = 1.5 if drink_days_w1 == 6
replace drink_days_v2_w1 = 0 if drink_days_w1 == 7



* contruct variable for wave 2

gen ever_drink_alcohol_w2 = H2TO15


gen drink_days_w2 = H2TO19
replace drink_days_w2 = 7 if ever_drink_alcohol_w2 == 0



gen drink_days_v2_w2 = 365 if drink_days_w2 == 1
replace drink_days_v2_w2 = 4*52 if drink_days_w2 == 2
replace drink_days_v2_w2 = 1.5*52 if drink_days_w2 == 3
replace drink_days_v2_w2 = 2.5*12 if drink_days_w2 == 4
replace drink_days_v2_w2 = 7.5 if drink_days_w2 == 5
replace drink_days_v2_w2 = 1.5 if drink_days_w2 == 6
replace drink_days_v2_w2 = 0 if drink_days_w2 == 7


********* drink days ***********




********* drink amount ***********
* clean missing value

replace H1TO16 = . if (H1TO16 == 96 | H1TO16 == 97 | H1TO16 == 98 | H1TO16 == 99)
replace H2TO20 = . if (H2TO20 == 96 | H2TO20 == 97 | H2TO20 == 98)


* contruct variable for wave 1

gen drink_amount_w1 = H1TO16
replace drink_amount_w1 = 0 if drink_days_w1 == 7  

* contruct variable for wave 2

gen drink_amount_w2 = H2TO20
replace drink_amount_w2 = 0 if drink_days_w2 == 7 
********* drink amount ***********





********* total drink per year ***********
gen total_drink_per_year_w1 = drink_amount_w1*drink_days_v2_w1 

gen total_drink_per_year_w2 = drink_amount_w2*drink_days_v2_w2 


********* total drink per year ***********





********* ever marijuana ***********
* clean missing value
replace H1TO32 = . if (H1TO32 == 996 | H1TO32 == 997 | H1TO32 == 998 | H1TO32 == 999)
replace H2TO46 = . if (H2TO46 == 996 | H2TO46 == 997 | H2TO46 == 998 )


* contruct variable for wave 1

gen how_many_times_marijuana_30_w1 = H1TO32           
replace how_many_times_marijuana_30_w1 = 0 if H1TO30 == 0 

gen ever_marijuana_30_w1 = 0 if  how_many_times_marijuana_30_w1 == 0
replace ever_marijuana_30_w1 = 1 if (how_many_times_marijuana_30_w1 > 0 & how_many_times_marijuana_30_w1 !=. )


* contruct variable for wave 2

gen how_many_times_marijuana_30_w2 = H2TO46             
replace how_many_times_marijuana_30_w2 = 0 if H2TO44 == 0


gen ever_marijuana_30_w2 = 0 if  how_many_times_marijuana_30_w2 == 0
replace ever_marijuana_30_w2 = 1 if (how_many_times_marijuana_30_w2 > 0 & how_many_times_marijuana_30_w2 !=. )


********* ever marijuana ***********







********* other drugs ***********
* clean missing value
* cocaine w1
replace H1TO36 = . if (H1TO36 == 996 | H1TO36 == 997 | H1TO36 == 998 | H1TO36 == 999)
* inhalants w1
replace H1TO39 = . if (H1TO39 == 996 | H1TO39 == 997 | H1TO39 == 998 | H1TO39 == 999)
* other illegal drugs w1
replace H1TO42 = . if (H1TO42 == 996 | H1TO42 == 997 | H1TO42 == 998 | H1TO42 == 999)


* cocaine w2
replace H2TO52 = . if (H2TO52 == 996 | H2TO52 == 997 | H2TO52 == 998)
* inhalants w2
replace H2TO56 = . if (H2TO56 == 996 | H2TO56 == 997 | H2TO56 == 998)
* other illegal drugs w2
replace H2TO60 = . if (H2TO60 == 996 | H2TO60 == 997 | H2TO60 == 998)




* contruct variable for wave 1

gen how_many_times_cocaine_30_w1 = H1TO36
replace how_many_times_cocaine_30_w1 = 0 if H1TO34 == 0 

gen ever_cocaine_30_w1 = 0 if  how_many_times_cocaine_30_w1   == 0
replace ever_cocaine_30_w1 = 1 if (how_many_times_cocaine_30_w1   > 0 & how_many_times_cocaine_30_w1   !=. )




gen how_many_times_inhalants_30_w1 = H1TO39
replace how_many_times_inhalants_30_w1 = 0 if H1TO37 == 0 

gen ever_inhalants_30_w1 = 0 if  how_many_times_inhalants_30_w1   == 0
replace ever_inhalants_30_w1 = 1 if (how_many_times_inhalants_30_w1   > 0 & how_many_times_inhalants_30_w1   !=. )





gen how_many_times_other_drug_30_w1 = H1TO42
replace how_many_times_other_drug_30_w1 = 0 if H1TO40 == 0 

gen ever_other_drug_30_w1 = 0 if  how_many_times_other_drug_30_w1   == 0
replace ever_other_drug_30_w1 = 1 if (how_many_times_other_drug_30_w1   > 0 & how_many_times_other_drug_30_w1   !=. )




gen ever_all_but_m_drugs_w1 = 1 if ( ever_cocaine_30_w1 == 1 | ever_inhalants_30_w1 == 1 | ever_other_drug_30_w1 == 1)
replace ever_all_but_m_drugs_w1 = 0 if ( ever_cocaine_30_w1 == 0 & ever_inhalants_30_w1 == 0 & ever_other_drug_30_w1 == 0)
  



* contruct variable for wave 2

gen how_many_times_cocaine_30_w2 = H2TO52
replace how_many_times_cocaine_30_w2 = 0 if H2TO50 == 0 

gen ever_cocaine_30_w2 = 0 if  how_many_times_cocaine_30_w2   == 0
replace ever_cocaine_30_w2 = 1 if (how_many_times_cocaine_30_w2   > 0 & how_many_times_cocaine_30_w2   !=. )



gen how_many_times_inhalants_30_w2 = H2TO56
replace how_many_times_inhalants_30_w2 = 0 if H2TO54 == 0 

gen ever_inhalants_30_w2 = 0 if  how_many_times_inhalants_30_w2   == 0
replace ever_inhalants_30_w2 = 1 if (how_many_times_inhalants_30_w2   > 0 & how_many_times_inhalants_30_w2   !=. )


gen how_many_times_other_drug_30_w2 = H2TO60
replace how_many_times_other_drug_30_w2 = 0 if H2TO58 == 0 

gen ever_other_drug_30_w2 = 0 if  how_many_times_other_drug_30_w2   == 0
replace ever_other_drug_30_w2 = 1 if (how_many_times_other_drug_30_w2   > 0 & how_many_times_other_drug_30_w2   !=. )


gen ever_all_but_m_drugs_w2 = 1 if ( ever_cocaine_30_w2 == 1 | ever_inhalants_30_w2 == 1 | ever_other_drug_30_w2 == 1)
replace ever_all_but_m_drugs_w2 = 0 if ( ever_cocaine_30_w2 == 0 & ever_inhalants_30_w2 == 0 & ever_other_drug_30_w2 == 0)

********* other drugs ***********








********* obesity ***********
* clean missing values
replace H1GH59A = . if (H1GH59A == 96 | H1GH59A == 98 |H1GH59A == 99)
replace H1GH59B = . if (H1GH59B == 96 | H1GH59B == 98 |H1GH59B == 99)
replace H1GH60 = . if (H1GH60 == 996 | H1GH60 == 998 |H1GH60 == 999)



replace H2GH52F = . if (H2GH52F == 96 | H2GH52F == 98)
replace H2GH52I = . if (H2GH52I == 96 | H2GH52I == 98)
replace H2GH53 = . if (H2GH53 == 996 | H2GH53 == 998)

replace H2WS16HF = . if (H2WS16HF == 96 | H2WS16HF == 98)
replace H2WS16HI = . if (H2WS16HI == 96 | H2WS16HI == 98)
replace H2WS16W = . if (H2WS16W == 996 | H2WS16W == 998)


* construct variables in wave 1
rename H1GH59A  height_feet_w1
rename H1GH59B  height_inch_w1
gen height_w1 = (height_feet_w1*12) + height_inch_w1
rename H1GH60  weight_w1
gen BMI_w1 = (weight_w1*0.454)/((height_w1*0.0254)^2)
egen BMI_zscore_w1 = zanthro(BMI_w1,ba,US), xvar(age_w1) gender(BIO_SEX) gencode(male=1,female=2)	   
gen BMIZ_percentile_w1 = normal(BMI_zscore_w1)
gen overweight_w1 = .
replace overweight_w1 = 1 if BMIZ_percentile_w1 >= 0.85 &  BMIZ_percentile_w1 ! = .
replace overweight_w1 = 0 if BMIZ_percentile_w1 < 0.85 &  BMIZ_percentile_w1 ! = .

gen obese_w1 = . 	   
replace obese_w1 = 1 if BMIZ_percentile_w1 >= 0.95 &  BMIZ_percentile_w1 ! = .
replace obese_w1 = 0 if BMIZ_percentile_w1 < 0.95 &  BMIZ_percentile_w1 ! = .




* construct variables in wave 2
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
replace overweight_w2 = 1 if BMIZ_percentile_w2 >= 0.85 &  BMIZ_percentile_w2 ! = .
replace overweight_w2 = 0 if BMIZ_percentile_w2 < 0.85 &  BMIZ_percentile_w2 ! = .


gen obese_w2 = . 	   
replace obese_w2 = 1 if BMIZ_percentile_w2 >= 0.95 & BMIZ_percentile_w2 ! = .
replace obese_w2 = 0 if BMIZ_percentile_w2 < 0.95 &  BMIZ_percentile_w2 ! = .

********* obesity ***********





********* exercise for weight ***********

* no need to clean missing value


rename H1GH29 lose_weight_w1

gen exercise_for_weight_w1 = 1 if H1GH30B == 1
replace exercise_for_weight_w1 = 1 if H1GH31B == 1
replace exercise_for_weight_w1 = 0 if H1GH30B == 0
replace exercise_for_weight_w1 = 0 if H1GH31B == 0
replace exercise_for_weight_w1 = 0 if lose_weight_w1 == 4


rename H2GH31 lose_weight_w2

gen exercise_for_weight_w2 = 1 if H2GH32B == 1
replace exercise_for_weight_w2 = 1 if H2GH33B == 1
replace exercise_for_weight_w2 = 0 if H2GH32B == 0
replace exercise_for_weight_w2 = 0 if H2GH33B == 0
replace exercise_for_weight_w2 = 0 if lose_weight_w2 == 4


********* exercise for weight ***********




********* diet for weight ***********

* no need to clean missing value


gen diet_for_weight_w1 = 1 if H1GH30A == 1
replace diet_for_weight_w1 = 1 if H1GH31A == 1
replace diet_for_weight_w1 = 0 if H1GH30A == 0
replace diet_for_weight_w1 = 0 if H1GH31A == 0
replace diet_for_weight_w1 = 0 if lose_weight_w1 == 4

gen diet_for_weight_w2 = 1 if H2GH32A == 1
replace diet_for_weight_w2 = 1 if H2GH33A == 1
replace diet_for_weight_w2 = 0 if H2GH32A == 0
replace diet_for_weight_w2 = 0 if H2GH33A == 0
replace diet_for_weight_w2 = 0 if lose_weight_w2 == 4


********* diet for weight ***********







********* vege fruits dummy ***********

* clean missing value
replace H1GH33 = . if (H1GH33 == 6 | H1GH33 == 8)
replace H1GH34 = . if (H1GH34 == 6 | H1GH34 == 8)

replace H2NU5 = . if H2NU5 == 8
replace H2NU6 = . if H2NU6 == 8


forvalues i = 10(1) 30 {
replace H2NU`i' = . if H2NU`i' == 8

}


* construct variables in wave 1

rename H1GH33 fruit_juice_w1
rename H1GH34 vege_w1
gen vege_fruits_w1 = fruit_juice_w1 + vege_w1

gen vege_fruits_dum_w1 = 0 if vege_fruits_w1 == 0
replace vege_fruits_dum_w1 = 1 if (vege_fruits_w1 > 0 & vege_fruits_w1 !=. ) 


* construct variables in wave 2

gen vege_fruits_w2 =  H2NU5 + H2NU6 + H2NU10 + H2NU11 + H2NU12 + H2NU13 + H2NU14 + H2NU15 + H2NU17 + H2NU18 + ///
                      H2NU16 + H2NU19 + H2NU20 + H2NU21 + H2NU22 + H2NU23 + H2NU24 + H2NU25 + H2NU26 + H2NU27 + H2NU28 + H2NU30

 

 
gen vege_fruits_dum_w2 = 0 if vege_fruits_w2 == 0
replace vege_fruits_dum_w2 = 1 if (vege_fruits_w2 > 0 & vege_fruits_w2 !=. ) 
 
********* vege fruits dummy ***********











save constructed_variables, replace

