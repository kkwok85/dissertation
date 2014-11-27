
cd "D:\Dropbox"



use ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w2\DS0003\21600-0003-Data", clear

do ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w2\DS0003\21600-0003-Supplemental_syntax.do"

merge 1:1 AID using ".\J file\dissertation\Add_health_data\original_unzip_files\ICPSR_21600_w2_sample_weights\DS0021\21600-0021-Data"


save ".\J file\dissertation\Add_health_data\temp_data\Add_Health_w2_v2", replace















