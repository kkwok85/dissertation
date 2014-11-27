cd "D:\Dropbox\J file\dissertation\Add_health_data\temp_data"

clear

set maxvar 32767



use Add_Health_w1_v2, clear

append using Add_Health_w2_v2



use Add_Health_merged_w1_to_w4, clear



drop IMONTH3 - w1_w2_w3_w4


keep CASEID - SMP03 H1RM7 H2RM7


rename H1RM7  mom_w1
rename H2RM7  mom_w2

reshape long mom_w, i(AID) j(mom)
