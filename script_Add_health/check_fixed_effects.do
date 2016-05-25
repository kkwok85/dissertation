
use  F:\temp_data\panel_data, clear
* eliminate the variation cuz by reported work hours from siblings
bysort FAMID wave: egen avg_mom_wh = mean(res_mom_work_hours_v2_w)
* check variation in mom work hours
bysort AID: gen diff_mom_wh = res_mom_work_hours_v2_w - res_mom_work_hours_v2_w[_n-1]


* tried regular_cigarette_w too. the number is driven by subsample!!!!
areg BMI_z c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] if FAMID != . ,  absorb(AID) vce(cluster PSUSCID_w )



areg BMI_z c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] if FAMID == . ,  absorb(AID) vce(cluster PSUSCID_w )


* this shows that the result is driven by individual variation




reg BMI_z c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] if FAMID != . ,   vce(cluster PSUSCID_w )


reg BMI_z c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel [pw=GSWGT] if FAMID == . ,   vce(cluster PSUSCID_w )







use  F:\temp_data\constructed_variables, clear
