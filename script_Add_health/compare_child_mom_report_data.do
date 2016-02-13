cd "D:\dropbox_2\Dropbox\J file\dissertation\Add_health_data\temp_data"



* cd "C:\Users\Julian.Julian-PC\Dropbox\J file\dissertation\Add_health_data\temp_data"


clear


use constructed_variables, clear









foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 times_tv_videos_w1 roller_blading_cycling_w1 play_active_sport_w1 exercise_w1 hang_out_frds_w1 tv_hours_per_week_w1 video_hours_per_week_w1	 computer_games_hours_per_week_w1 listen_radio_hours_per_week_w1 {


	reg `varname' mom_full_time_child_report_w1 dad_full_time_child_report_w1 
	outreg2 using result1, word ctitle(`varname')  append 

	reg `varname' mom_full_time_mom_report_w1 dad_full_time_mom_report_w1
	outreg2 using result2, word ctitle(`varname')  append 


}






foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 times_tv_videos_w1 roller_blading_cycling_w1 play_active_sport_w1 exercise_w1 hang_out_frds_w1 tv_hours_per_week_w1 video_hours_per_week_w1	 computer_games_hours_per_week_w1 listen_radio_hours_per_week_w1 {


	reg `varname' mom_full_time_child_report_w1_v2 dad_full_time_child_report_w1_v2 
	reg `varname' mom_full_time_mom_report_w1 dad_full_time_mom_report_w1 

}









foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 sports time_use_w1 time_use_no_radio_w1 {


	reg `varname' mom_full_time_child_report_w1 dad_full_time_child_report_w1 
	outreg2 using result3, word ctitle(`varname')  append 


	reg `varname' mom_full_time_mom_report_w1 dad_full_time_mom_report_w1
	outreg2 using result4, word ctitle(`varname')  append 


}






foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 sports time_use_w1 time_use_no_radio_w1 {


	reg `varname' mom_full_time_child_report_w1  
	outreg2 using result5, word ctitle(`varname')  append 


	reg `varname' mom_full_time_mom_report_w1 
	outreg2 using result6, word ctitle(`varname')  append 


}










foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 sports time_use_w1 time_use_no_radio_w1 {


	reg `varname' mom_full_time_child_report_v3_w1 dad_full_time_child_report_v3_w1 


	reg `varname' mom_full_time_mom_report_v2_w1 dad_full_time_mom_report_v2_w1


}






*************************************************************************************** check variables ************************************************************************
br mom_full_time_child_report_w1  dad_full_time_child_report_w1 mom_full_time_mom_report_w1 dad_full_time_mom_report_w1 mom_full_time_child_report_w1_v2 dad_full_time_child_report_w1_v2 ///
full_time_spouse full_time_mom_or_dad  sex_mom_or_dad  sex_mom_or_dad sex_spouse res_dad_work_hours_w1 res_mom_work_hours_w1



tab mom_full_time_child_report_w1 
tab dad_full_time_child_report_w1 
tab mom_full_time_mom_report_w1 
tab dad_full_time_mom_report_w1
tab mom_full_time_child_report_w1_v2 
tab dad_full_time_child_report_w1_v2 

* seems that using 35 hours to separate part time and full time is better


sum mom_full_time_child_report_w1 
sum dad_full_time_child_report_w1 
sum mom_full_time_mom_report_w1 
sum dad_full_time_mom_report_w1
sum mom_full_time_child_report_w1_v2 
sum dad_full_time_child_report_w1_v2 

* version 1 of child report looks closer to mom's report

foreach varname in BMI_w1 work_in_house_w1 hobbies_w1 times_tv_videos_w1 roller_blading_cycling_w1 play_active_sport_w1 exercise_w1 hang_out_frds_w1 tv_hours_per_week_w1 video_hours_per_week_w1	 computer_games_hours_per_week_w1 listen_radio_hours_per_week_w1 {
	sum `varname' 
}


br BMI_w1 work_in_house_w1 hobbies_w1 times_tv_videos_w1 roller_blading_cycling_w1 play_active_sport_w1 exercise_w1 hang_out_frds_w1 tv_hours_per_week_w1 video_hours_per_week_w1	 computer_games_hours_per_week_w1 listen_radio_hours_per_week_w1
