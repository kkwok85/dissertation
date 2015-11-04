/*

cd "D:\Dropbox"

use "J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w4\DS0023\21600-0023-Data", clear

do "J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w4\DS0023\21600-0023-Supplemental_syntax.do"

merge 1:1 AID using "D:\Dropbox\J file\dissertation\Add_health_data\temp_data\w4_sample_weight"


save ".\J file\dissertation\Add_health_data\temp_data\Add_Health_w4_v2", replace
 
 */

 
 
 
 

 
 
 
 
 
cd "F:\Add_health_data\"

* clean  and save weight files

fdause ".\Grand Sample Weights\weights4\weights4.xpt", clear
renvars *, upper

save ".\Grand Sample Weights\weights4\weights4", replace




* clean  and save w4 files, combine with wieghts file

fdause ".\In Home Interview Files\wave4\wave4.xpt", clear


renvars *, upper



merge 1:1 AID using ".\Grand Sample Weights\weights4\weights4"



save "F:\temp_data\Add_Health_w4", replace


