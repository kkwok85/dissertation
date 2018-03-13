* summary statistics



cd "$data_output"
use panel_data, clear
cd "$result_output"


 
 
estpost sum BMI_zscore_w overweight_w obese_w diet_for_weight_w exercise_for_weight_w vege_fruits_dum_w ///
how_many_cigarettes_w how_many_days_smoke_w  total_smoke_a_month_w ///
drink_amount_w drink_days_v2_w total_drink_per_year_w  ///
ever_marijuana_30_w ever_all_but_m_drugs_w [aweight = GSWGT]
 
 




estout using summary_stat_dep.tex ,  prehead(\makeatletter\setlength{\@fptop}{0pt}\makeatother\setlength{\extrarowheight}{2pt}\begin{table}\caption{Summary Statistics for Dependent Variables} \begin{tabular}{l*{1}{ccccc}}\hline) ///
varlabels(BMI_zscore_w "BMI Z-score" ///
overweight_w "Overweight" obese_w "Obese" ///
diet_for_weight_w "Diet" exercise_for_weight_w "Exercise" ///
vege_fruits_dum_w "Vege. and fruits consumption" ///
how_many_cigarettes_w "Num. of cigarettes each time" how_many_days_smoke_w "Num. of smoking days"  total_smoke_a_month_w "Total num. of cigarettes in a month" ///
drink_amount_w "Num. of drinks each time"  drink_days_v2_w "Num. of days drinking"  /// 
total_drink_per_year_w "Total num. of drinks in a year" ever_marijuana_30_w  "Smoked marijuana" ever_all_but_m_drugs_w  "Used other drugs")  ///
style(tex)  cells("count(fmt(0))  mean(fmt(a3))  sd(fmt(a3))  min(fmt(a3))  max(fmt(a3)) ") replace postfoot(\hline\end{tabular}\end{table})







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

estpost sum res_mom_work_hours_v2_w zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1 age_w BIO_SEX_dummy1 BIO_SEX_dummy2 ///
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
res_dad_work_hours_v2_w family_income_1994 [aweight = GSWGT]






estout . using summary_stat_indep.tex , prehead(\begin{footnotesize}\setlength{\extrarowheight}{0pt}\begin{longtable}{lccccc} \caption{Summary Statistics for Variables of Interest and Controls} \\ \hline  ) ///
varlabels(res_mom_work_hours_v2_w "Mom work hours"   ///
zConscientiousness_w1  "Child's conscientiousness" zNeuroticism_w1  "Child's neuroticism" zExtraversion_w1  "Child's extraversion" ///
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
family_income_1994 "Annual family income (\$1000s)") ///
style(tex)  cells("count(fmt(0))  mean(fmt(a3))  sd(fmt(a3))  min(fmt(a3))  max(fmt(a3)) ") replace postfoot(\hline\end{longtable}\end{footnotesize})


