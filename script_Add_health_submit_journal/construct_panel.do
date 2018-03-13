cd "$data_output"



clear


*set maxvar 32767

use constructed_variables, clear






keep AID AH_PVT BIO_SEX GSWGT1 GSWGT2  family_income_1994 fam_income_impute_ind  IMONTH ///
zConscientiousness_w1 zNeuroticism_w1 zExtraversion_w1  ///
race age_w1 num_siblings_w1 AH_PVT no_mom_w1 no_dad_w1 age_mom_w1 age_dad_w1 ///
res_mom_work_hours_v2_w1 res_mom_occupation_w1 mwh_impute_indicator_w1 res_mom_educ_w1 mom_edu_impute_indicator_w1 ///
res_dad_work_hours_v2_w1 res_dad_occupation_w1 dwh_impute_indicator_w1 res_dad_educ_w1 dad_edu_impute_indicator_w1  ///
family_income_1994 fam_income_impute_ind  ///
month_year_w1 ///
drink_days_v2_w1 drink_amount_w1 total_drink_per_year_w1 ///
how_many_days_smoke_w1 how_many_cigarettes_w1 total_smoke_a_month_w1 ///
ever_marijuana_30_w1 ever_all_but_m_drugs_w1 ///
BMI_zscore_w1 overweight_w1 obese_w1  exercise_for_weight_w1 diet_for_weight_w1 vege_fruits_dum_w1  ///
age_w2 num_siblings_w2 no_mom_w2 no_dad_w2 age_mom_w2 age_dad_w2 ///
res_mom_work_hours_v2_w2 res_mom_occupation_w2 mwh_impute_indicator_w2 res_mom_educ_w2 mom_edu_impute_indicator_w2 ///
res_dad_work_hours_v2_w2 res_dad_occupation_w2 dwh_impute_indicator_w2 res_dad_educ_w2 dad_edu_impute_indicator_w2  ///
month_year_w2 ///
earnings_w1 earnings_w2 allowance_w1 allowance_w2 ///
PSUSCID_w1 PSUSCID_w2  ///
drink_days_v2_w2 drink_amount_w2 total_drink_per_year_w2 ///
how_many_days_smoke_w2 how_many_cigarettes_w2 total_smoke_a_month_w2 ///
ever_marijuana_30_w2 ever_all_but_m_drugs_w2 ///
BMI_zscore_w2 overweight_w2 obese_w2  exercise_for_weight_w2 diet_for_weight_w2 vege_fruits_dum_w2  





reshape long GSWGT PSUSCID_w  age_w ///
num_siblings_w no_mom_w no_dad_w age_mom_w age_dad_w ///
res_mom_work_hours_v2_w res_mom_occupation_w mwh_impute_indicator_w res_mom_educ_w mom_edu_impute_indicator_w ///
res_dad_work_hours_v2_w res_dad_occupation_w dwh_impute_indicator_w res_dad_educ_w dad_edu_impute_indicator_w  ///
month_year_w earnings_w allowance_w ///
drink_days_v2_w drink_amount_w total_drink_per_year_w ///
how_many_days_smoke_w how_many_cigarettes_w total_smoke_a_month_w ///
ever_marijuana_30_w ever_all_but_m_drugs_w ///
BMI_zscore_w overweight_w obese_w  exercise_for_weight_w diet_for_weight_w vege_fruits_dum_w  , i(AID) j(wave)



  

destring AID, gen(AID2)





save panel_data, replace

	   	   		
