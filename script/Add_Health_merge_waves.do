* cd "D:\Dropbox\J file\dissertation\Add_health_data\temp_data"
cd "D:\temp_data"


clear

set maxvar 32767


use Add_Health_w1_v2, clear


merge 1:1 AID using Add_Health_w2_v2, gen(w1_w2) 


merge 1:1 AID using Add_Health_w3_in_home_v2, gen(w1_w2_w3) 


merge 1:1 AID using Add_Health_w4_v2, gen(w1_w2_w3_w4) 



save Add_Health_merged_w1_to_w4, replace
