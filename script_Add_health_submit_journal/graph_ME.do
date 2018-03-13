cd "$result_output"

* marginal effect


foreach yvariable in how_many_days_smoke_w total_smoke_a_month_w ever_marijuana_30_w    {
 
* CONSCIENTIOUSNESS
areg `yvariable'   c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 c.res_mom_work_hours_v2_w##c.zNeuroticism_w1  c.res_mom_work_hours_v2_w##c.zExtraversion_w1  i.mwh_impute_indicator_w ///
c.zConscientiousness_w1##c.res_dad_work_hours_v2_w  c.zNeuroticism_w1##c.res_dad_work_hours_v2_w c.zExtraversion_w1##c.res_dad_work_hours_v2_w  i.dwh_impute_indicator_w ///
c.zConscientiousness_w1##c.age_w c.zConscientiousness_w1##i.BIO_SEX c.zConscientiousness_w1##i.race c.zConscientiousness_w1##c.num_siblings_w c.zConscientiousness_w1##c.AH_PVT c.zConscientiousness_w1##i.no_mom_w c.zConscientiousness_w1##i.no_dad_w c.zConscientiousness_w1##c.age_mom_w c.zConscientiousness_w1##c.age_dad_w	///
c.zConscientiousness_w1##i.res_mom_occupation_w	///
c.zConscientiousness_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zConscientiousness_w1##i.res_dad_occupation_w c.zConscientiousness_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zConscientiousness_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zConscientiousness_w1##i.month_year_w	 ///
c.zNeuroticism_w1##c.age_w c.zNeuroticism_w1##i.BIO_SEX c.zNeuroticism_w1##i.race c.zNeuroticism_w1##c.num_siblings_w c.zNeuroticism_w1##c.AH_PVT c.zNeuroticism_w1##i.no_mom_w c.zNeuroticism_w1##i.no_dad_w c.zNeuroticism_w1##c.age_mom_w c.zNeuroticism_w1##c.age_dad_w ///
c.zNeuroticism_w1##i.res_mom_occupation_w ///
c.zNeuroticism_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zNeuroticism_w1##i.res_dad_occupation_w c.zNeuroticism_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zNeuroticism_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zNeuroticism_w1##i.month_year_w	 ///
c.zExtraversion_w1##c.age_w c.zExtraversion_w1##i.BIO_SEX c.zExtraversion_w1##i.race c.zExtraversion_w1##c.num_siblings_w c.zExtraversion_w1##c.AH_PVT c.zExtraversion_w1##i.no_mom_w c.zExtraversion_w1##i.no_dad_w c.zExtraversion_w1##c.age_mom_w c.zExtraversion_w1##c.age_dad_w  ///
c.zExtraversion_w1##i.res_mom_occupation_w  ///
c.zExtraversion_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zExtraversion_w1##i.res_dad_occupation_w c.zExtraversion_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zExtraversion_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zExtraversion_w1##i.month_year_w	///
[pw=GSWGT],absorb(AID) vce(cluster PSUSCID_w)

di _b[c.res_mom_work_hours_v2_w#c.zConscientiousness_w1]*40 + 40*_b[c.res_mom_work_hours_v2_w]

margins , dydx(res_mom_work_hours_v2_w)  at(zConscientiousness_w1=(-3(0.5)3)) noestimcheck


* recastci(dot)
*title(Average Marginal Effects of Mother Work Hours on First Time Smoking Across Conscientiousness Distribution)
marginsplot, yline(0) title("") xtitle(Child's Conscientiousness) ytitle(Average Marginal Effects) 

graph save ME_graph_`yvariable'

}






foreach yvariable in   vege_fruits_dum_w  {
 
* EXTRAVERSION
areg `yvariable'   c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 c.res_mom_work_hours_v2_w##c.zNeuroticism_w1  c.res_mom_work_hours_v2_w##c.zExtraversion_w1  i.mwh_impute_indicator_w ///
c.zConscientiousness_w1##c.res_dad_work_hours_v2_w  c.zNeuroticism_w1##c.res_dad_work_hours_v2_w c.zExtraversion_w1##c.res_dad_work_hours_v2_w  i.dwh_impute_indicator_w ///
c.zConscientiousness_w1##c.age_w c.zConscientiousness_w1##i.BIO_SEX c.zConscientiousness_w1##i.race c.zConscientiousness_w1##c.num_siblings_w c.zConscientiousness_w1##c.AH_PVT c.zConscientiousness_w1##i.no_mom_w c.zConscientiousness_w1##i.no_dad_w c.zConscientiousness_w1##c.age_mom_w c.zConscientiousness_w1##c.age_dad_w	///
c.zConscientiousness_w1##i.res_mom_occupation_w	///
c.zConscientiousness_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zConscientiousness_w1##i.res_dad_occupation_w c.zConscientiousness_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zConscientiousness_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zConscientiousness_w1##i.month_year_w	 ///
c.zNeuroticism_w1##c.age_w c.zNeuroticism_w1##i.BIO_SEX c.zNeuroticism_w1##i.race c.zNeuroticism_w1##c.num_siblings_w c.zNeuroticism_w1##c.AH_PVT c.zNeuroticism_w1##i.no_mom_w c.zNeuroticism_w1##i.no_dad_w c.zNeuroticism_w1##c.age_mom_w c.zNeuroticism_w1##c.age_dad_w ///
c.zNeuroticism_w1##i.res_mom_occupation_w ///
c.zNeuroticism_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zNeuroticism_w1##i.res_dad_occupation_w c.zNeuroticism_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zNeuroticism_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zNeuroticism_w1##i.month_year_w	 ///
c.zExtraversion_w1##c.age_w c.zExtraversion_w1##i.BIO_SEX c.zExtraversion_w1##i.race c.zExtraversion_w1##c.num_siblings_w c.zExtraversion_w1##c.AH_PVT c.zExtraversion_w1##i.no_mom_w c.zExtraversion_w1##i.no_dad_w c.zExtraversion_w1##c.age_mom_w c.zExtraversion_w1##c.age_dad_w  ///
c.zExtraversion_w1##i.res_mom_occupation_w  ///
c.zExtraversion_w1##i.res_mom_educ_w i.mom_edu_impute_indicator_w ///
c.zExtraversion_w1##i.res_dad_occupation_w c.zExtraversion_w1##i.res_dad_educ_w i.dad_edu_impute_indicator_w ///
c.zExtraversion_w1##c.family_income_1994 i.fam_income_impute_ind ///
c.zExtraversion_w1##i.month_year_w	///
[pw=GSWGT],absorb(AID) vce(cluster PSUSCID_w)

di _b[c.res_mom_work_hours_v2_w#c.zExtraversion_w1]*40 + 40*_b[c.res_mom_work_hours_v2_w]

margins , dydx(res_mom_work_hours_v2_w)  at(zExtraversion_w1=(-3(0.5)3)) noestimcheck


* recastci(dot)
*title(Average Marginal Effects of Mother Work Hours on First Time Smoking Across Conscientiousness Distribution)
marginsplot, yline(0) title("") xtitle(Child's Extraversion) ytitle(Average Marginal Effects) 

graph save ME_graph_`yvariable'

}
