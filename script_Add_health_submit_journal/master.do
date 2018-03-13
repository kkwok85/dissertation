
clear
set maxvar 32767
set more off

 
global script_folder G:\github\dissertation\script_Add_health_submit_journal
global data_input  F:\Add_health_data
global data_output  F:\temp_data_journal
global result_output C:\Users\AYSPS\Desktop\results

do "$script_folder\Add_Health_w1"
do "$script_folder\Add_Health_w2"
do "$script_folder\Add_Health_merge_waves"
do "$script_folder\construct_all_waves"
do "$script_folder\construct_panel"
do "$script_folder\regression"
do "$script_folder\sum_stat"





