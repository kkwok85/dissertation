 
  foreach name of varlist H1GH1A - not_live_with_you_6_months {


	capture  reg `name'  c.res_mom_work_hours_v2_w1 ib0.mom_full_time_mom_report_v2_w1  ib0.mom_work_home_w1  $control6 i.SCH_YR i.IMONTH  [pweight = GSWGT1],r

	capture noisily est table, keep(c.res_mom_work_hours_v2_w1 ib0.mom_full_time_mom_report_v2_w1 ib0.mom_work_home_w1 i.s_lie_to_parents_w1)  star(.05 .01 .001) title(`name')


}



trial2



  foreach name of varlist H1GH1A - not_live_with_you_6_months {


	capture  reg `name'  ib0.mom_full_time_mom_report_v2_w1 $control6 i.SCH_YR i.IMONTH  [pweight = GSWGT1],r

	capture noisily est table, keep(ib0.mom_full_time_mom_report_v2_w1)  star(.05 .01 .001) title(`name')


}







  foreach name of varlist H1GH1A - not_live_with_you_6_months {


	capture  reg `name'  ib0.mom_full_time_mom_report_v2_w1 $control6 i.SCH_YR i.IMONTH  [pweight = GSWGT1],r

	capture noisily est table, keep(ib0.mom_full_time_mom_report_v2_w1)  star(.05 .01 .001) title(`name')


}
