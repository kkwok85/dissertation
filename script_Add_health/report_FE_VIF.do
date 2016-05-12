use F:\temp_data\panel_data, clear



xtset FAMID


xtreg regular_cigarette_w c.res_mom_work_hours_v2_w##c.zConscientiousness_w1, fe





destring AID, replace
xtset AID


xtreg regular_cigarette_w c.res_mom_work_hours_v2_w##c.zConscientiousness_w1, fe



xtreg regular_cigarette_w c.res_mom_work_hours_v2_w##c.zConscientiousness_w1 i.mwh_impute_indicator_w $demographic_panel $mom_occupation_panel $mom_edu_panel  $dad_educ_career_panel $family_income_panel $supervision_panel $time_panel , fe
