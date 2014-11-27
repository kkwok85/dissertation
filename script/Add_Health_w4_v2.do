

cd "D:\Dropbox"

use "J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w4\DS0023\21600-0023-Data", clear

do "J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w4\DS0023\21600-0023-Supplemental_syntax.do"

merge 1:1 AID using "D:\Dropbox\J file\dissertation\Add_health_data\temp_data\w4_sample_weight"


save ".\J file\dissertation\Add_health_data\temp_data\Add_Health_w4_v2", replace
 

 
 
 
 

 
 
 
 
 

