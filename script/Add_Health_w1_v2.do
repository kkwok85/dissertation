


cd "D:\Dropbox"

use ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w1\DS0001\21600-0001-Data", clear


do ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w1\DS0001\21600-0001-Supplemental_syntax.do"


merge 1:1 AID using ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w1_sample_weights\DS0002\21600-0002-Data"


save ".\J file\dissertation\Add_health_data\temp_data\Add_Health_w1_v2", replace




